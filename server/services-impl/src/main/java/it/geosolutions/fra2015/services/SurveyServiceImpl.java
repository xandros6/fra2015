/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.services;

import it.geosolutions.fra2015.server.dao.CountryDAO;
import it.geosolutions.fra2015.server.dao.EntryDAO;
import it.geosolutions.fra2015.server.dao.EntryItemDAO;
import it.geosolutions.fra2015.server.dao.NumberValueDAO;
import it.geosolutions.fra2015.server.dao.QuestionDAO;
import it.geosolutions.fra2015.server.dao.QuestionRevisionDAO;
import it.geosolutions.fra2015.server.dao.SurveyDAO;
import it.geosolutions.fra2015.server.dao.TextValueDAO;
import it.geosolutions.fra2015.server.model.survey.CompactValue;
import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.server.model.survey.EntryItem;
import it.geosolutions.fra2015.server.model.survey.NumberValue;
import it.geosolutions.fra2015.server.model.survey.Question;
import it.geosolutions.fra2015.server.model.survey.QuestionRevision;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;
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

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.googlecode.genericdao.search.Search;

/**
 *
 * @author marco
 */
public class SurveyServiceImpl implements SurveyService {

	public abstract class ValueDAO {

		public abstract void persist(Value value);

		public abstract Value read(Long itemId, Country country);

		public abstract void merge(Value dbValue);

		public abstract void remove(Value dbValue);
	}
	private static final Logger LOGGER = Logger.getLogger(SurveyServiceImpl.class);
	private CountryDAO countryDAO;
	private EntryDAO entryDAO;
	private QuestionDAO questionDAO;
	private EntryItemDAO entryItemDAO;
	private TextValueDAO textValueDAO;
	private NumberValueDAO numberValueDAO;
	private SurveyDAO surveyDAO;
	private QuestionRevisionDAO questionRevisionDAO;

	private SurveyCatalog surveyCatalog;


	/**
	 * @param surveyCatalog the surveyCatalog to set
	 */
	public void setSurveyCatalog(SurveyCatalog surveyCatalog) {
		this.surveyCatalog = surveyCatalog;
	}



	private Map<String, ValueDAO> map = new HashMap<String, ValueDAO>();

	public void setSurveyDAO(SurveyDAO surveyDAO) {
		this.surveyDAO = surveyDAO;
	}



	public void setCountryDAO(CountryDAO countryDAO) {
		this.countryDAO = countryDAO;
	}

	public void setEntryDAO(EntryDAO entryDAO) {
		this.entryDAO = entryDAO;
	}

	public void setQuestionDAO(QuestionDAO questionDAO) {
		this.questionDAO = questionDAO;
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

        public void setQuestionRevisionDAO(QuestionRevisionDAO countryRevisionDAO) {
            this.questionRevisionDAO = countryRevisionDAO;
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
			public Value read(Long itemId, Country country) {
				Search searchCriteria = new Search(TextValue.class);
				searchCriteria.addFilterEqual("entryItem.id", itemId);
				searchCriteria.addFilterEqual("country.id", country.getId());
				// TODO add unique constraint to TextValue
				List<TextValue> textValues = textValueDAO.search(searchCriteria);
				if (textValues.size() > 0) {
					TextValue textValue = textValues.get(0);
					textValue.setContent(textValue.getValue());
					return textValue;
				}
				return null;

			}

			@Override
			public void merge(Value value) {
				TextValue textValue = (TextValue) value;
				textValue.setValue(value.getContent());
				textValueDAO.merge(textValue);
			}

			@Override
			public void remove(Value value) {
				TextValue textValue = (TextValue) value;
				textValue.setValue(value.getContent());
				textValueDAO.remove(textValue);

			}
		});
		map.put("Number", new ValueDAO() {
			@Override
			public void persist(Value value) {
				try {
				    if(!StringUtils.isBlank(value.getContent())){
					NumberFormat format = NumberFormat.getInstance(Locale.US);
					Number number = format.parse(value.getContent());
					NumberValue dbValue = new NumberValue();
					dbValue.setCountry(value.getCountry());
					dbValue.setValue(number);
					dbValue.setEntryItem(value.getEntryItem());
					numberValueDAO.persist(dbValue);
				    }
				    else{
				        StringBuilder sb = new StringBuilder();
				        sb.append("Error when try to persist entryItem id:'").append(value.getId()).append("' the provided value is blank and the EntryItem has type 'Number', skip the value...");
				        LOGGER.error(sb.toString());
				    }
				} catch (ParseException ex) {
					throw new IllegalArgumentException("Value of item " + value.getEntryItem().getId() + "must be numeric.");
				}
			}

			@Override
			public Value read(Long itemId, Country country) {
				Search searchCriteria = new Search(NumberValue.class);
				searchCriteria.addFilterEqual("entryItem.id", itemId);
				searchCriteria.addFilterEqual("country.id", country.getId());
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

			@Override
			public void remove(Value value) {
				try {
					NumberValue numberValue = (NumberValue) value;
					NumberFormat format = NumberFormat.getInstance(Locale.US);
					Number number = format.parse(value.getContent());
					numberValue.setValue(number);
					numberValueDAO.remove(numberValue);
				} catch (ParseException ex) {
					throw new IllegalArgumentException("Value of item " + value.getEntryItem().getId() + "must be numeric.");
				}
			}
		});
	}

	@Override
	public Entry updateValues(String iso3, String entryId, Integer row, Integer col, String value) throws BadRequestServiceEx, NotFoundServiceEx {

		Entry entry = entryDAO.findByName(entryId);
		if (entry != null) {
			Search searchCriteria = new Search(EntryItem.class);
			searchCriteria.addFilterEqual("rowNumber", row);
			searchCriteria.addFilterEqual("columnNumber", col);
			searchCriteria.addFilterEqual("entry.id", entry.getId());
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

			// find a country with the given name
			Country country = findCountryByISO3(iso3);
			if (country == null) {
				throw new BadRequestServiceEx("Country with code " + iso3 + " does not exist.");
			}

			// retrieve previous value if it is an update
			ValueDAO valueDAO = map.get(item.getType());
			Value dbValue = valueDAO.read(item.getId(), country);
			if (dbValue == null) {
				// create a new value
				dbValue = new Value();
				dbValue.setEntryItem(item);
				dbValue.setCountry(country);
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

	/**
	 * UNTESTED
	 */
	// TODO untested!
	@Override
	public boolean removeValues(String iso3, String entryId, Integer row, Integer col, String value) throws BadRequestServiceEx, NotFoundServiceEx {

		Entry entry = entryDAO.findByName(entryId);
		if (entry != null) {
			Search searchCriteria = new Search(EntryItem.class);
			searchCriteria.addFilterEqual("rowNumber", row);
			searchCriteria.addFilterEqual("columnNumber", col);
			searchCriteria.addFilterEqual("entry.id", entry.getId());
			List<EntryItem> items = entryItemDAO.search(searchCriteria);
			EntryItem item = null;
			if (items.isEmpty()) {
				return false;
			} else {
				item = items.get(0);
			}

			// find a country with the given name
			Country country = findCountryByISO3(iso3);
			if (country == null) {
				throw new BadRequestServiceEx("Country with code " + iso3 + " does not exist.");
			}

			// retrieve previous value if it is an update
			ValueDAO valueDAO = map.get(item.getType());
			Value dbValue = valueDAO.read(item.getId(), country);
			if (dbValue == null) {
				return false;
			} else {
				// update values
				dbValue.setContent(value);
				valueDAO.remove(dbValue);
			}

			return true;
		}
		throw new BadRequestServiceEx("Entry " + entryId + " not found.");
	}

	@Override
	public List<CompactValue> getQuestionCountryValues(String iso3, Integer questionId) throws BadRequestServiceEx {

		return getValuesInternal(iso3, questionId);
	}

	@Override
	public List<CompactValue> getAllValues(String iso3) throws BadRequestServiceEx, NotFoundServiceEx {

		return getValuesInternal(iso3, null);
	}

	@Override
	public void upsert(Entry entry) throws BadRequestServiceEx, NotFoundServiceEx {
		List<EntryItem> items = entry.getEntryItems();
		if (items != null) {
			for (EntryItem item : items) {
				item.setEntry(entry);
				// entryItemDAO.persist(item);
			}
		}
		entryDAO.persist(entry);
	}

	@Override
	public void upsert(Question question) throws BadRequestServiceEx, NotFoundServiceEx {
		for(Entry entry : question.getEntries()){
			entry.setQuestion(question);
			if(entry.getEntryItems() != null){
				for(EntryItem entryItems : entry.getEntryItems()){
					entryItems.setEntry(entry);
				}
			}
		}
		questionDAO.persist(question);	
	}

	@Override
	public String changeStatus(Status status) throws BadRequestServiceEx, NotFoundServiceEx {
		SurveyInstance survey = surveyDAO.findByCountry( status.getCountry() );
		if ( survey != null ){
			survey.getStatus().setMessage( status.getMessage() );
			survey.getStatus().setStatus( status.getStatus() );
			surveyDAO.merge(survey);
			return survey.getStatus().getStatus();
		}
		return null;
	}
	
	@Override
	public Status getStatus(String iso3){
	    SurveyInstance survey = surveyDAO.findByCountry( iso3 );
	    if ( survey != null ){
                return survey.getStatus();
                
            }
	    return null;
	}
	@Override
	public List<SurveyInstance> getSurveysByCountry(String[] countries,int page,int entries){
		return surveyDAO.findByCountries( countries,page,entries );
	}
	/**
	 * retuns a country with the given name, null otherwise
	 *
	 * @param countryName
	 * @return
	 */
	private Country findCountryByName(String name) {
		Search searchCriteria = new Search(Country.class);
		searchCriteria.addFilterEqual("name", name);
		List<Country> countries = countryDAO.search(searchCriteria);
		if (countries.size() > 0) {
			return countries.get(0);
		}
		return null;
	}
	
	@Override
	public List<Country> getCountries() {
		List<Country> countries = countryDAO.findAll();
		return countries;
	}
	
	@Override
        public QuestionRevision findQuestionRevision(Country country, Question question) {
            Search searchCriteria = new Search(QuestionRevision.class);
            searchCriteria.addFilterEqual("country", country);
            searchCriteria.addFilterEqual("question", question);
            List<QuestionRevision> qr = questionRevisionDAO.search(searchCriteria);
            if (qr.size() > 0) {
                return qr.get(0);
            }
            return null;
        }
	
        @Override
        public boolean updateQuestionRevision(QuestionRevision revision) {
        
            QuestionRevision lastRevision = findQuestionRevision(revision.getCountry(),
                    revision.getQuestion());
            Long version = lastRevision.getVersion();
            if (lastRevision.getVersion() <= revision.getVersion()) {
                if (!questionRevisionDAO.remove(revision)) {
                    return false;
                }
                else{
                    lastRevision.setVersion(version+1);
                    questionRevisionDAO.merge(lastRevision);
                }
            }
        
            return true;
        }

        @Override
	public Country findCountryByISO3(String iso3) {
		Search searchCriteria = new Search(Country.class);
		searchCriteria.addFilterEqual("iso3", iso3);
		List<Country> countries = countryDAO.search(searchCriteria);
		if (countries.size() > 0) {
			return countries.get(0);
		}
		return null;
	}

	private List<CompactValue> getValuesInternal(String iso3, Integer questionNumber) throws BadRequestServiceEx{

		// find a country with the given name
		Country country = findCountryByISO3(iso3);
		if (country == null) {
			throw new BadRequestServiceEx("Country with code " + iso3 + " does not exist.");
		}

		List<CompactValue> values = new ArrayList<CompactValue>();

		List<Entry> entries = new ArrayList<Entry>();
		if(questionNumber == null){
			entries = surveyCatalog.getCatalog();
		}
		else{
			entries = surveyCatalog.getCatalogForQuestion(questionNumber);
		}
		//        List<Entry> entries = entryDAO.findAll();
		if (entries != null) {
			for (Entry entry : entries) {
				if(entry == null){
					continue;
				}
				if (!entry.getEntryItems().isEmpty()) {
					for (EntryItem item : entry.getEntryItems()) {
						String type = item.getType();
						ValueDAO valueDAO = map.get(type);
						if (valueDAO != null) {
							Value value = valueDAO.read(item.getId(), country);
							if (value != null) {
								CompactValue compact = new CompactValue(
										item.getEntry().getVariable(),
										item.getRowNumber(),
										item.getColumnNumber(),
										value.getContent());
								values.add(compact);
							}
						}

					}
				}
			}
		}
		return values;
	}
	
	public List<Value> getValues(String iso3, Integer questionNumber) throws BadRequestServiceEx{

            // find a country with the given name
            Country country = findCountryByISO3(iso3);
            if (country == null) {
                    throw new BadRequestServiceEx("Country with code " + iso3 + " does not exist.");
            }

            List<Value> values = new ArrayList<Value>();

            List<Entry> entries = new ArrayList<Entry>();
            if(questionNumber == null){
                    entries = surveyCatalog.getCatalog();
            }
            else{
                    entries = surveyCatalog.getCatalogForQuestion(questionNumber);
            }
            //        List<Entry> entries = entryDAO.findAll();
            if (entries != null) {
                    for (Entry entry : entries) {
                            if(entry == null){
                                    continue;
                            }
                            if (!entry.getEntryItems().isEmpty()) {
                                    for (EntryItem item : entry.getEntryItems()) {
                                            String type = item.getType();
                                            ValueDAO valueDAO = map.get(type);
                                            if (valueDAO != null) {
                                                    Value value = valueDAO.read(item.getId(), country);
                                                    if (value != null) {
                                                            values.add(value);
                                                    }
                                            }

                                    }
                            }
                    }
            }
            return values;
    }

    @Override
    public void insertQuestionRevision(QuestionRevision question) {
        questionRevisionDAO.persist(question);
    }



    /* (non-Javadoc)
     * @see it.geosolutions.fra2015.services.SurveyService#findQuestion(java.lang.Long)
     */
    @Override
    public Question findQuestion(Long questionNumber) {
       
        return questionDAO.find(questionNumber);
    }
    
    @Override
    public List<Question> getQuestions() {
       
        return questionDAO.findAll();
    }



    /* (non-Javadoc)
     * @see it.geosolutions.fra2015.services.SurveyService#searchCountry(java.lang.String)
     */
    @Override
    public Country searchCountry(String iso3) {        
        Search searchCriteria = new Search(Country.class);
        searchCriteria.addFilterEqual("iso3", iso3);
        return countryDAO.search(searchCriteria).get(0);
    }
    
	@Override
	public Country findCountry(Long id) {
		
		 return countryDAO.find(id);
	}

    
    @Override
    public List<Value> getEntryListByVariableName(List<String> names, String iso3) throws BadRequestServiceEx{
    	
    	Search searchCriteria = new Search(EntryItem.class);
    	
    	Country country = findCountryByISO3(iso3);
		if (country == null) {
			throw new BadRequestServiceEx("Country with code " + iso3 + " does not exist.");
		}
    	searchCriteria.addFilterIn("rowName", names);
    	List<Value> results = new ArrayList<Value>();
    	List<EntryItem> items =  entryItemDAO.search(searchCriteria);
    	for(EntryItem item : items){
    		String type = item.getType();
			ValueDAO valueDAO = map.get(type);
			if (valueDAO != null) {
				Value value = valueDAO.read(item.getId(), country);
				if(value!=null){

					results.add(value);
				}
			}
    	}
		return results;
		
    	
    }




}
