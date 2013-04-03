/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.services;

import it.geosolutions.fra2015.server.model.survey.CompactValue;
import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.EntryItem;
import it.geosolutions.fra2015.server.model.survey.QuestionRevision;
import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.server.model.survey.Question;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;
import it.geosolutions.fra2015.server.model.survey.Value;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.InternalErrorServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;
import java.util.List;

/**
 *
 * @author marco
 */
/**
 * @author Xandros
 * 
 */
public interface SurveyService {

    public Entry updateValues(String iso3, String variable, Integer row, Integer col, String value)
            throws BadRequestServiceEx, NotFoundServiceEx;

//    public List<CompactValue> getAllValues(String iso3) throws BadRequestServiceEx,
//            NotFoundServiceEx;

    /**
     * update or insert an entry
     * 
     * @param entry
     * @throws BadRequestServiceEx
     * @throws NotFoundServiceEx
     */
    public void upsert(Entry entry) throws BadRequestServiceEx, NotFoundServiceEx;

    /**
     * update or insert a question
     * 
     * @param question
     * @throws BadRequestServiceEx
     * @throws NotFoundServiceEx
     */
    public void upsert(Question question) throws BadRequestServiceEx, NotFoundServiceEx;

    /**
     * change the status of the survey associated to a given country
     * 
     * @param country
     * @param status
     * @param message additional information about the status
     * @throws BadRequestServiceEx
     * @throws NotFoundServiceEx
     * @return the new status
     */
    public String changeStatus(Status status) throws BadRequestServiceEx, NotFoundServiceEx;

    /**
     * @param iso3
     * @param questionNumber
     * @return
     * @throws BadRequestServiceEx
     * @throws NotFoundServiceEx
     */
    public List<CompactValue> getQuestionCountryValues(String iso3, Integer questionNumber)
            throws BadRequestServiceEx, InternalErrorServiceEx;

    /**
     * @param iso3
     * @param entryId
     * @param row
     * @param col
     * @param value
     * @return
     * @throws BadRequestServiceEx
     * @throws NotFoundServiceEx
     */
    boolean removeValues(String iso3, String entryId, Integer row, Integer col, String value)
            throws BadRequestServiceEx, NotFoundServiceEx;

    /**
     * @return
     */
    public List<Country> getCountries();

    /**
     * @param revision
     * @return
     */
    boolean updateQuestionRevision(QuestionRevision revision);

    /**
     * @param country
     * @param questionNumber
     * @return
     */
    QuestionRevision findQuestionRevision(Country country, Question questionNumber);
    
    /**
     * 
     * @param country
     * @param questionNumber
     * @return
     */
    void insertQuestionRevision(QuestionRevision questionRevision);
    
    Question findQuestion(Long questionNumber);
    
    Country searchCountry(String iso3);
    
    Country findCountry(Long id);
    /**
     * 
     * @param country
     * @param index 
     * @param page 
     * @return
     */
    public List<SurveyInstance> getSurveysByCountry(String[] country, int page, int index);

    public List<Value> getEntryListByVariableName(List<String> vars, String country) throws BadRequestServiceEx;

    
    public List<Question> getQuestions();

    Country findCountryByISO3(String iso3);

    Status getStatus(String iso3);
    
    public List<Value> getValues(String iso3, Integer questionNumber) throws BadRequestServiceEx;
}
