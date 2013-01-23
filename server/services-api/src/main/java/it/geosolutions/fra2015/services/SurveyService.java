/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.services;

import it.geosolutions.fra2015.server.model.survey.Survey;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;
import java.util.List;

/**
 *
 * @author marco
 */
public interface SurveyService {
    
    public Survey create(Survey survey) throws BadRequestServiceEx, NotFoundServiceEx;

    public List<Survey> getAll() throws BadRequestServiceEx, NotFoundServiceEx;
}
