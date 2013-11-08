/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.dao.impl;

import com.googlecode.genericdao.search.ISearch;
import com.googlecode.genericdao.search.Search;
import com.googlecode.genericdao.search.Sort;

import it.geosolutions.fra2015.server.dao.SurveyDAO;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;

import java.util.Arrays;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author marco
 * @author Tobia Di Pisa at tobia.dipisa@geo-solutions.it
 * 
 */
@Transactional(value = "fra2015TransactionManager")
public class SurveyDAOImpl extends BaseDAO<SurveyInstance, Long> implements SurveyDAO {

    @Override
    public List<SurveyInstance> search(ISearch search) {
        return super.search(search);
    }

    @Override
    public void persist(SurveyInstance... entities) {
        super.persist(entities);
    }

    @Override
    public SurveyInstance merge(SurveyInstance entity) {
        return super.merge(entity);
    }

    @Override
    public boolean remove(SurveyInstance entity) {
        return super.remove(entity);
    }

    @Override
    public boolean removeById(Long id) {
        return super.removeById(id);
    }

    @Override
    public SurveyInstance findByCountry(String country) {
         Search searchCriteria = new Search(SurveyInstance.class);
         searchCriteria.addFilterEqual("country.iso3", country);
         List<SurveyInstance> entries = this.search(searchCriteria);
         if ( entries.size() > 0){
             return entries.get(0);
         }
         return null;
    }
    
    @Override
    public List<SurveyInstance> findByCountries(String[] countries, int page, int entries, String orderBy){
    	Search searchCriteria = new Search(SurveyInstance.class);
    	
    	if(orderBy != null && !orderBy.isEmpty()){
    		searchCriteria.addSort(Sort.asc("country." + orderBy));
    	}else{
    		searchCriteria.addSort(Sort.asc("country.iso3"));
    	}
    	    	
        searchCriteria.setMaxResults(entries);
        searchCriteria.setPage(page);
        searchCriteria.addFilterIn("country.iso3", Arrays.asList(countries));
        
		
        return  this.search(searchCriteria);
        
    }
}
