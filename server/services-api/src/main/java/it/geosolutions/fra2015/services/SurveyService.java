/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.services;

import it.geosolutions.fra2015.server.model.survey.CompactValue;
import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;
import java.util.List;

/**
 *
 * @author marco
 */
public interface SurveyService {
    

    public Entry updateValues(String iso3, String variable, Integer row, Integer col, String value) throws BadRequestServiceEx, NotFoundServiceEx;

    public List<CompactValue> getAllValues(String iso3) throws BadRequestServiceEx, NotFoundServiceEx;

    /**
     * update or insert an entry
     * @param entry
     * @throws BadRequestServiceEx
     * @throws NotFoundServiceEx 
     */
    public void upsert(Entry entry) throws BadRequestServiceEx, NotFoundServiceEx;
}
