/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.services;

import com.googlecode.genericdao.search.Search;
import it.geosolutions.fra2015.server.dao.EntryDAO;
import it.geosolutions.fra2015.server.dao.EntryItemDAO;
import it.geosolutions.fra2015.server.dao.NumberValueDAO;
import it.geosolutions.fra2015.server.dao.SurveyDAO;
import it.geosolutions.fra2015.server.dao.TextValueDAO;
import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.server.model.survey.EntryItem;
import it.geosolutions.fra2015.server.model.survey.NumberValue;
import it.geosolutions.fra2015.server.model.survey.Survey;
import it.geosolutions.fra2015.server.model.survey.TextValue;
import it.geosolutions.fra2015.server.model.survey.Value;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.logging.Level;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.log4j.Logger;

/**
 *
 * @author marco
 */
public class SurveyServiceImpl implements SurveyService {

    public abstract class ValueDAO {

        public abstract void persist(Value value);

        public abstract Value read(Long itemId, String countryId);

        public abstract void merge(Value dbValue);
    }
    private static final Logger LOGGER = Logger.getLogger(SurveyServiceImpl.class);
    @PersistenceContext(unitName = "fra2015EntityManagerFactory")
    private EntityManager entityManager;
    private SurveyDAO surveyDAO;
    private EntryDAO entryDAO;
    private EntryItemDAO entryItemDAO;
    private TextValueDAO textValueDAO;
    private NumberValueDAO numberValueDAO;
    private Map<String, ValueDAO> map = new HashMap<String, ValueDAO>();

    public void setSurveyDAO(SurveyDAO surveyDAO) {
        this.surveyDAO = surveyDAO;
    }

    public void setEntryDAO(EntryDAO entryDAO) {
        this.entryDAO = entryDAO;
    }

    public void setEntryItemDAO(EntryItemDAO entryItemDAO) {
        this.entryItemDAO = entryItemDAO;
    }

    public void setTextValueDAO(TextValueDAO textValueDAO) {
        this.textValueDAO = textValueDAO;
    }

    public void setNumberValueDAO(NumberValueDAO numberValueDAO) {
        this.numberValueDAO = numberValueDAO;
    }

    public SurveyServiceImpl() {
        map.put("String", new ValueDAO() {
            @Override
            public void persist(Value value) {
                TextValue dbValue = new TextValue();
                dbValue.setCountry(value.getCountry());
                dbValue.setRowNumber(value.getRowNumber());
                dbValue.setValue(value.getContent());
                dbValue.setEntryItem(value.getEntryItem());
                textValueDAO.persist(dbValue);
            }

            @Override
            public Value read(Long itemId, String countryId) {
                Search searchCriteria = new Search(TextValue.class);
                searchCriteria.addFilterEqual("entryItem.id", itemId);
                searchCriteria.addFilterEqual("country", countryId);
                // TODO add unique constraint to TextValue
                List<TextValue> textValues = textValueDAO.search(searchCriteria);
                if (textValues.size() > 0) {
                    return textValues.get(0);
                }
                return null;

            }

            @Override
            public void merge(Value value) {
                TextValue textValue = (TextValue) value;
                textValue.setValue(value.getContent());
                textValueDAO.merge(textValue);
            }
        });
        map.put("Number", new ValueDAO() {
            @Override
            public void persist(Value value) {
                try {
                    NumberFormat format = NumberFormat.getInstance(Locale.US);
                    Number number = format.parse(value.getContent());
                    NumberValue dbValue = new NumberValue();
                    dbValue.setCountry(value.getCountry());
                    dbValue.setValue(number);
                    dbValue.setEntryItem(value.getEntryItem());
                    numberValueDAO.persist(dbValue);
                } catch (ParseException ex) {
                    throw new IllegalArgumentException("Value of item " + value.getEntryItem().getId() + "must be numeric.");
                }
            }

            @Override
            public Value read(Long itemId, String countryId) {
                Search searchCriteria = new Search(NumberValue.class);
                searchCriteria.addFilterEqual("entryItem.id", itemId);
                searchCriteria.addFilterEqual("country", countryId);
                // TODO add unique constraint to NumberValue
                List<NumberValue> numberValues = numberValueDAO.search(searchCriteria);
                if (numberValues.size() > 0) {
                    NumberValue numberValue = numberValues.get(0);
                    numberValue.setContent(String.valueOf(numberValue.getValue()));
                    return numberValue;
                }
                return null;
            }

            @Override
            public void merge(Value value) {
                try {
                    NumberValue numberValue = (NumberValue) value;
                    NumberFormat format = NumberFormat.getInstance(Locale.US);
                    Number number = format.parse(value.getContent());
                    numberValue.setValue(number);
                    numberValueDAO.merge(numberValue);
                } catch (ParseException ex) {
                    throw new IllegalArgumentException("Value of item " + value.getEntryItem().getId() + "must be numeric.");
                }
            }
        });
    }

    @Override
    public Survey create(Survey survey) throws BadRequestServiceEx, NotFoundServiceEx {

        surveyDAO.persist(survey);
        return survey;
    }

    @Override
    public Survey read(String name) throws BadRequestServiceEx, NotFoundServiceEx {
        Search searchCriteria = new Search(Survey.class);
        searchCriteria.addFilterEqual("name", name);
        List<Survey> surveys = surveyDAO.search(searchCriteria);
        if (surveys.size() > 0) {
            return surveys.get(0);
        }
        return null;
    }

    @Override
    public List<Survey> getAll() throws BadRequestServiceEx, NotFoundServiceEx {
        Search searchCriteria = new Search(Survey.class);
        List<Survey> surveys = surveyDAO.search(searchCriteria);
        return surveys;
    }

    @Override
    public Entry addValue(Long itemId, Value value) throws BadRequestServiceEx, NotFoundServiceEx {
        EntryItem item = entryItemDAO.find(itemId);
        if (item != null) {
            value.setEntryItem(item);
            ValueDAO valueDAO = map.get(item.getType());
            if (valueDAO != null) {
                valueDAO.persist(value);
                return item.getEntry();
            }
        }
        throw new BadRequestServiceEx("Item " + itemId + " not found.");
    }

    @Override
    public List<Value> getEntryValues(Long entryId, String countryId) throws BadRequestServiceEx, NotFoundServiceEx {
        Entry entry = entryDAO.find(entryId);
        if (entry != null) {
            List<Value> values = new ArrayList<Value>();
            if (!entry.getEntryItems().isEmpty()) {
                for (EntryItem item : entry.getEntryItems()) {
                    String type = item.getType();
                    ValueDAO valueDAO = map.get( type );
                    Value value = valueDAO.read(item.getId(), countryId);
                    if (value != null) {
                        values.add(value);
                    }
                }
            }
            return values;
        }
        throw new BadRequestServiceEx("Entry " + entryId + " not found.");
    }

    @Override
    public Entry updateValues(Long entryId, Integer row, Integer col, String value) throws BadRequestServiceEx, NotFoundServiceEx {

        LOGGER.info("insert: " + row + "-" + col + "-" + value);

        Entry entry = entryDAO.find(entryId);
        if (entry != null) {
            Search searchCriteria = new Search(EntryItem.class);
            searchCriteria.addFilterEqual("rowNumber", row);
            searchCriteria.addFilterEqual("columnNumber", col);
            searchCriteria.addFilterEqual("entry.id", entryId);
            List<EntryItem> items = entryItemDAO.search(searchCriteria);
            EntryItem item = null;
            if (items.isEmpty()) {
                // create a new entry item for this entry
                item = new EntryItem();
                item.setType("String"); // TODO
                item.setColumnNumber(col);
                item.setRowNumber(row);
                item.setEntry(entry);
                
                entry.addEntryItem(item);
                
                entryItemDAO.persist(item);
                entryDAO.merge(entry);
            } else {
                item = items.get(0);
            }
            // retrieve previous value if it is an update
            ValueDAO valueDAO = map.get(item.getType());
            Value dbValue = valueDAO.read(item.getId(), "IT"); // TODO
            if (dbValue == null) {
                // create a new value
                dbValue = new Value();
                dbValue.setEntryItem(item);
                dbValue.setCountry("IT"); // TODO
                // set value
                dbValue.setContent(value);
                valueDAO.persist(dbValue);
            } else {
                // update values
                dbValue.setContent(value);
                valueDAO.merge(dbValue);
            }

            return entry;
        }
        throw new BadRequestServiceEx("Entry " + entryId + " not found.");
    }
}
