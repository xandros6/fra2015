/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.services;

import com.googlecode.genericdao.search.Search;
import it.geosolutions.fra2015.server.dao.EntryDAO;
import it.geosolutions.fra2015.server.dao.SurveyDAO;
import it.geosolutions.fra2015.server.model.survey.Survey;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.log4j.Logger;


/**
 *
 * @author marco
 */
public class SurveyServiceImpl implements SurveyService {

    private static final Logger LOGGER = Logger.getLogger(SurveyServiceImpl.class);
    
    @PersistenceContext(unitName = "fra2015EntityManagerFactory")
    private EntityManager entityManager;
    
    private SurveyDAO surveyDAO;
    private EntryDAO entryDAO;

    public void setSurveyDAO(SurveyDAO surveyDAO) {
        this.surveyDAO = surveyDAO;
    }
    
    public void setEntryDAO(EntryDAO entryDAO){
        this.entryDAO = entryDAO;
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
}
