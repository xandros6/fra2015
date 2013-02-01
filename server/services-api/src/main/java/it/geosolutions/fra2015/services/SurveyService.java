/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.services;

import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.server.model.survey.Survey;
import it.geosolutions.fra2015.server.model.survey.Value;
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

    public Entry addValue(Long itemId, Value value) throws BadRequestServiceEx, NotFoundServiceEx;

    public List<Value> getEntryValues(Long itemId, String countryId) throws BadRequestServiceEx, NotFoundServiceEx;

    public Survey read(String name) throws BadRequestServiceEx, NotFoundServiceEx;
}
