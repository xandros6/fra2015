package it.geosolutions.fra2015.server.dao;



import it.geosolutions.fra2015.server.model.survey.SurveyInstance;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author marco
 */
public interface SurveyDAO extends RestrictedGenericDAO<SurveyInstance>{

    public SurveyInstance findByCountry(String country);
    
}
