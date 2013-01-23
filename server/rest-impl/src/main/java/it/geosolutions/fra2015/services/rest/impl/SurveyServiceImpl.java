/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.services.rest.impl;

import it.geosolutions.fra2015.server.model.survey.Survey;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;
import it.geosolutions.fra2015.services.rest.SurveyService;
import it.geosolutions.fra2015.services.rest.exception.BadRequestWebEx;
import it.geosolutions.fra2015.services.rest.exception.NotFoundWebEx;
import java.util.List;
import javax.ws.rs.core.SecurityContext;
import org.apache.log4j.Logger;

/**
 *
 * @author marco
 */
public class SurveyServiceImpl implements SurveyService{
    
    private final static Logger LOGGER = Logger.getLogger(SurveyServiceImpl.class);
    private it.geosolutions.fra2015.services.SurveyService surveyService;

    public void setSurveyService(it.geosolutions.fra2015.services.SurveyService surveyService){
        this.surveyService = surveyService;
    }
    
    @Override
    public Survey create(SecurityContext sc, Survey survey) throws BadRequestServiceEx, NotFoundServiceEx {
        try{
            return surveyService.create(survey);
        } catch (BadRequestServiceEx ex) {
            throw new BadRequestWebEx(ex.getMessage());
        } catch (NotFoundServiceEx ex) {
            throw new NotFoundWebEx(ex.getMessage());
        } 
    }

    @Override
    public List<Survey> getAll(SecurityContext sc, Integer page, Integer entries) throws BadRequestWebEx {
        try{
            return surveyService.getAll();
        } catch (BadRequestServiceEx ex) {
            throw new BadRequestWebEx(ex.getMessage());
        } catch (NotFoundServiceEx ex) {
            throw new NotFoundWebEx(ex.getMessage());
        } 
    }
    
}
