/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.dao.impl;

import it.geosolutions.fra2015.server.dao.SurveyDAO;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;

import java.util.Arrays;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.googlecode.genericdao.search.ISearch;
import com.googlecode.genericdao.search.Search;
import com.googlecode.genericdao.search.Sort;

/**
 * @author marco
 * @author Tobia Di Pisa at tobia.dipisa@geo-solutions.it
 * 
 */
@Transactional(value = "fra2015TransactionManager")
public class SurveyDAOImpl extends BaseDAO<SurveyInstance, Long> implements SurveyDAO {

    /* (non-Javadoc)
     * @see com.googlecode.genericdao.dao.jpa.GenericDAOImpl#search(com.googlecode.genericdao.search.ISearch)
     */
    @Override
    public List<SurveyInstance> search(ISearch search) {
        return super.search(search);
    }

    /* (non-Javadoc)
     * @see com.googlecode.genericdao.dao.jpa.GenericDAOImpl#persist(T[])
     */
    @Override
    public void persist(SurveyInstance... entities) {
        super.persist(entities);
    }

    /* (non-Javadoc)
     * @see com.googlecode.genericdao.dao.jpa.GenericDAOImpl#merge(java.lang.Object)
     */
    @Override
    public SurveyInstance merge(SurveyInstance entity) {
        return super.merge(entity);
    }

    /* (non-Javadoc)
     * @see com.googlecode.genericdao.dao.jpa.GenericDAOImpl#remove(java.lang.Object)
     */
    @Override
    public boolean remove(SurveyInstance entity) {
        return super.remove(entity);
    }

    /* (non-Javadoc)
     * @see com.googlecode.genericdao.dao.jpa.GenericDAOImpl#removeById(java.io.Serializable)
     */
    @Override
    public boolean removeById(Long id) {
        return super.removeById(id);
    }

    /* (non-Javadoc)
     * @see it.geosolutions.fra2015.server.dao.SurveyDAO#findByCountry(java.lang.String)
     */
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
    
    /* (non-Javadoc)
     * @see it.geosolutions.fra2015.server.dao.SurveyDAO#findByCountries(java.lang.String[], int, int, java.lang.String)
     */
    @Override
    public List<SurveyInstance> findByCountries(String[] countries, 
    		int page, int entries, String orderBy){
    	
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

	/* (non-Javadoc)
	 * @see it.geosolutions.fra2015.server.dao.SurveyDAO#findByCountriesTimestamp(java.lang.String[], int, int, java.lang.String)
	 */
	@Override
	public List<SurveyInstance> getSurveysByCountrySortTimestamp(String[] countries,
			int page, int entries, String orderBy, String sortType) {
		
		Search searchCriteria = new Search(SurveyInstance.class);
		
	    if(orderBy != null && !orderBy.isEmpty()
	    		&& sortType != null && !sortType.isEmpty()){
	    	if(sortType.equalsIgnoreCase("asc")){
	    		searchCriteria.addSort(Sort.asc("status." + orderBy));
	    	}else{
	    		searchCriteria.addSort(Sort.desc("status." + orderBy));
	    	}
		}else{
			searchCriteria.addSort(Sort.asc("status.lastSurveyReview"));
		}
		
	    searchCriteria.setMaxResults(entries);
	    searchCriteria.setPage(page);
	    searchCriteria.addFilterIn("country.iso3", Arrays.asList(countries));
	    
		
	    return  this.search(searchCriteria);
	}
}
