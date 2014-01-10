/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.entrypoint;

import it.geosolutions.fra2015.entrypoint.model.CountryValues;
import it.geosolutions.fra2015.entrypoint.model.Updates;
import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.server.model.survey.Question;
import it.geosolutions.fra2015.server.model.survey.QuestionRevision;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.survey.Survey;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;
import it.geosolutions.fra2015.server.model.survey.Value;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.InternalErrorServiceEx;

import java.util.List;

/**
 *
 * @author DamianoG
 * @author Tobia Di Pisa at tobia.dipisa@geo-solutions.it
 * 
 * This API Represents the Services EntryPoint.
 * 
 * All the controllers MUST use these Interface and inject the specified implementation through Dependency Injection.
 * 
 * Do not confuse this Interface with SurveyService Interface in package it.geosolutions.fra2015.services .
 * When implementing something in MVC part the developer MUST use only this interface.
 * If an operation is not present here but is present in package it.geosolutions.fra2015.services.SurveyService please wrap it here.
 * 
 */
public interface SurveyServiceEntryPoint {
    
    /**
     * Update on DB the values provided. 
     * 
     * The update process is:
     * 
     * WARNING: Make sure you understand the Data Model of the survey otherwise these rules could be misleading.
     * 
     * If a fraValue obj is present into updates but not stored in DB, the value will be added(stored) on DB.
     *          In this case if an EntryItem for the Entry related to the value is not present the entryItem will be created
     * If a fraValue obj is present both into updates and stored on DB, the value on db will be updated.
     * 
     * @param updates
     * @return The list of Entry updated.
     */
    public List<Entry> updateValues(Updates updates);
    
    
    /**
     * @param survey
     * @return
     */
    public Survey create(Survey survey);
    
    
    public String changeStatus(Status status);

    /**
     * Remove on DB the values provided.
     * 
     * WARNING: don't be fooled by the name of the class of removes instances, it's just a list of fra Value
     * 
     * @param removes
     * @return true if the removal process has been successful. false otherwise.
     */
    public boolean removeValues(Updates removes);

    /**
     * Return All the country fraValues related to a given questionNumber.
     * if questionNumber == null returns all fraValues
     * 
     * @param countryId
     * @param questionNumber
     * @return
     * @throws BadRequestServiceEx
     */
    public CountryValues getCountryAndQuestionValues(String countryId, Integer questionNumber) throws BadRequestServiceEx, InternalErrorServiceEx;
        
    /**
     * @param revision
     * @return
     */
    boolean updateQuestionRevisionNumber(QuestionRevision revision);


    /**
     * @param country
     * @param questionNumber
     * @return
     */
    QuestionRevision getQuestionRevisionNumber(Country country, Question questionNumber);
    
    /**
     * 
     * @param qr
     * @return
     */
    void insertQuestionRevisionNumber(QuestionRevision qr);
    
    /**
     * @param questionNumber
     * @return
     */
    Question findQuestion(Long questionNumber);
    
    /**
     * @param iso3
     * @return
     */
    Country searchCountry(String iso3);
    
    /**
     * @param countryList
     * @param page
     * @param index
     * @return
     */
    List<SurveyInstance> getSurveysByCountry(String[] countryList,int page, int index, String orderBy);

    /**
     * @param country
     * @return
     */
    public Status getStatus(String country);

    /**
     * @param country
     * @return
     */
    public Country findCountryByISO3(String country);
    
    /**
     * @param iso3
     * @param questionNumber
     * @return
     * @throws BadRequestServiceEx
     */
    public List<Value> getValues(String iso3, Integer questionNumber) throws BadRequestServiceEx;
    
    /**
     * @return List<Country>
     */
    public List<Country> getCountries();

	/**
	 * @param countries
	 * @param page
	 * @param pagesize
	 * @param sortType 
	 * @param propertyToShort
	 * @return List<SurveyInstance>
	 */
	public List<SurveyInstance> getSurveysByCountrySortTimestamp(
			String[] countries, int page, int pagesize, String timestampPropertyToShort, String sortType);

}
