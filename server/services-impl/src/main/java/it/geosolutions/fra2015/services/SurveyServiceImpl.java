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
                dbValue.setRow(value.getRowNumber());
                dbValue.setValue(value.getValue());
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
                if ( textValues.size() > 0 ){
                    TextValue textValue = textValues.get(0);
                    Value value = new Value();
                    value.setCountry( textValue.getCountry() );
                    value.setEntryItem( textValue.getEntryItem() );
                    value.setRowNumber( textValue.getRow() );
                    value.setValue( textValue.getValue());
                    return value;
                }
                return null;
                
            }
        });
        map.put("Number", new ValueDAO() {

            @Override
            public void persist(Value value) {
                try {
                    NumberFormat format = NumberFormat.getInstance(Locale.US);
                    Number number = format.parse( value.getValue() );
                    NumberValue dbValue = new NumberValue();
                    dbValue.setCountry(value.getCountry());
                    dbValue.setValue(number);
                    dbValue.setEntryItem(value.getEntryItem());
                    numberValueDAO.persist(dbValue);
                } catch (ParseException ex) {
                    throw new IllegalArgumentException("Value of item " + value.getEntryItem().getId() +"must be numeric.");
                }
            }

            @Override
            public Value read(Long itemId, String countryId) {
                Search searchCriteria = new Search(NumberValue.class);
                searchCriteria.addFilterEqual("entryItem.id", itemId);
                searchCriteria.addFilterEqual("country", countryId);
                // TODO add unique constraint to NumberValue
                List<NumberValue> numberValues = numberValueDAO.search(searchCriteria);
                if ( numberValues.size() > 0 ){
                    NumberValue numberValue = numberValues.get(0);
                    Value value = new Value();
                    value.setCountry( numberValue.getCountry() );
                    value.setEntryItem( numberValue.getEntryItem() );
                    value.setValue( String.valueOf(numberValue.getValue()));
                    return value;
                }
                return null;
            }
        });
    }
    
    

    @Override
    public Survey create(Survey survey) throws BadRequestServiceEx, NotFoundServiceEx {

        surveyDAO.persist(survey);
        return survey;
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
            if ( valueDAO != null ){
                valueDAO.persist(value);
                return item.getEntry();
            }
        }
        throw new BadRequestServiceEx("Item " + itemId + " not found.");
    }
    
    @Override
    public List<Value> getEntryValues(Long entryId, String countryId) throws BadRequestServiceEx, NotFoundServiceEx {
        Entry entry = entryDAO.find(entryId);
        if ( entry != null) {
            List<Value> values = new ArrayList<Value>();
            for (EntryItem item: entry.getEntryItems()){
                ValueDAO valueDAO = map.get( item.getType() );
                Value value = valueDAO.read(entryId, countryId);
                if ( value != null ){
                    values.add(value);
                }
            }
            return values;
        }
        throw new BadRequestServiceEx("Entry " + entryId + " not found.");
    }
    
}
