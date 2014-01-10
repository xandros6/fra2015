package it.geosolutions.fra2015.server.dao;



import java.util.List;

import it.geosolutions.fra2015.server.model.survey.SurveyInstance;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * @author marco
 * @author Tobia Di Pisa at tobia.dipisa@geo-solutions.it
 * 
 */
public interface SurveyDAO extends RestrictedGenericDAO<SurveyInstance>{

    public SurveyInstance findByCountry(String country);

	List<SurveyInstance> findByCountries(String[] countries, int page, int entries, String orderBy);

	public List<SurveyInstance> getSurveysByCountrySortTimestamp(String[] countries,
			int page, int entries, String orderBy, String sortType);
    
}
