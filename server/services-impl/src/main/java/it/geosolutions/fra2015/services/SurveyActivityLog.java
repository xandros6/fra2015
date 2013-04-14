/*
 *  fra2015
 *  https://github.com/geosolutions-it/fra2015
 *  Copyright (C) 2007-2012 GeoSolutions S.A.S.
 *  http://www.geo-solutions.it
 *
 *  GPLv3 + Classpath exception
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package it.geosolutions.fra2015.services;

import it.geosolutions.fra2015.server.dao.ActivityLogDAO;
import it.geosolutions.fra2015.server.model.survey.ActivityLogEntry;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;

import java.text.ParseException;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.googlecode.genericdao.search.Filter;
import com.googlecode.genericdao.search.Search;
import com.googlecode.genericdao.search.Sort;
import it.geosolutions.fra2015.services.model.ActivityLogFilter;
import it.geosolutions.fra2015.services.utils.UserUtil;

/**
 * @author DamianoG
 *
 * Service provided for Activity log management. 
 * The store service will be used when save new values.
 * The other services are for loading and filtering.
 * All services must be filtered by country. 
 * 
 */
public class SurveyActivityLog { 
    
    Logger LOGGER = Logger.getLogger(SurveyActivityLog.class);
    
    public static final int NUM_ENTRIES = 10;
    
    ActivityLogDAO activityLogDAO;
    
    public boolean storeLog(ActivityLogEntry logEntry) {
        
        try{
            activityLogDAO.persist(logEntry);
        }
        catch(Exception e){
            return false;
        }
        return true;
    }
    
    /**
     * Retrieve logs with pagination.
     * 
     * @param page
     * @param entries
     * @return
     */
    public List<ActivityLogEntry> find(int page, int entries) throws IllegalArgumentException{
        
        StringBuffer sb = new StringBuffer();
      /*  if(!checkPageParams(page, entries, sb)){
            
            LOGGER.error(sb.toString());
            throw new IllegalArgumentException();
        }*/
        return  activityLogDAO.find(page, entries);
    }
    
    /**
     * Retrieve logs between 2 timestamps, with pagination.
     * 
     * @param c
     * @param t1
     * @param t2
     * @param page
     * @param entries
     * @return
     */
    public List<ActivityLogEntry> findByTimeInterval(String c, Long t1, Long t2, int page, int entries) throws IllegalArgumentException{
        
        StringBuffer sb = new StringBuffer();
        if(!checkPageParams(page, entries, sb)){
            
            LOGGER.error(sb.toString());
            throw new IllegalArgumentException();
        }
        return  activityLogDAO.findByTimeInterval(c, t1, t2, page, entries);
    }
    
    /**
     * Retrieve all logs for an entryItem, by name. with pagination.
     * 
     * @param c
     * @param entryItemName
     * @param page
     * @param entries
     * @return
     * @throws IllegalArgumentException
     */
    public List<ActivityLogEntry> findByEntryItemName(String c, String entryItemName, int page, int entries) throws IllegalArgumentException{
        
        StringBuffer sb = new StringBuffer();
        if(!checkPageParams(page, entries, sb)){
            
            LOGGER.error(sb.toString());
            throw new IllegalArgumentException();
        }
        return  activityLogDAO.findByEntryItemName(c, entryItemName, page, entries);
    }

    /**
     * Retrieve all logs for an entryItem, by question and username. with pagination.
     * 
     * @param c
     * @param question
     * @param username
     * @param page
     * @param entries
     * @return
     * @throws IllegalArgumentException
     */
    public List<ActivityLogEntry> findByQuestionAndUsername(String c, String question, String username, int page,int entries) throws IllegalArgumentException{
        
        StringBuffer sb = new StringBuffer();
        if(!checkPageParams(page, entries, sb)){
            
            LOGGER.error(sb.toString());
            throw new IllegalArgumentException();
        }
        return  activityLogDAO.findByQuestionAndUsername(c, question, username, page, entries);
    }
    
    /**
     * Control the page parameter.
     * 
     * @param page
     * @param entries
     * @param msg
     * @return
     */
    public static boolean checkPageParams(int page, int entries, StringBuffer msg){
        
        if(page < 1){
            
            msg.append("PAGINATION ERROR: The param 'page' ").append("is < 0 ...");
            return false;
        }
        if(entries > 100){
            
            msg.append("PAGINATION ERROR: The param 'entries' ").append("is > 1000 ...");
            return false;
        }
        msg.append("page params OK");
        return true;
    }

    /**
     * @return the activityLogDAO
     */
    public ActivityLogDAO getActivityLogDAO() {
        return activityLogDAO;
    }

    /**
     * @param activityLogDAO the activityLogDAO to set
     */
    public void setActivityLogDAO(ActivityLogDAO activityLogDAO) {
        this.activityLogDAO = activityLogDAO;
    }

    public long getCountFiltered(ActivityLogFilter logFilter) throws BadRequestServiceEx {
    	Search searchCriteria = getSearchCriteria(null, null, logFilter);  
    	return activityLogDAO.count(searchCriteria);
    }
    
    private Search getSearchCriteria(Integer page, Integer entries, ActivityLogFilter logFilter) throws BadRequestServiceEx{
   	 if (((page != null) && (entries == null)) || ((page == null) && (entries != null))) {
            throw new BadRequestServiceEx("Page and entries params should be declared together.");
        }

        Search searchCriteria = new Search(ActivityLogEntry.class);     
        
        searchCriteria.addSort(new Sort("updateTimeStamp",true));
        
        if(logFilter != null){
        	if(StringUtils.isNotBlank(logFilter.getFromDate())){
        		try {
					searchCriteria.addFilter(Filter.greaterOrEqual("updateTimeStamp", ActivityLogFilter.asDate(logFilter.getFromDate())) );
				} catch (ParseException e) {
					LOGGER.error(e.getMessage(),e);
				}
        	}
        	if(StringUtils.isNotBlank(logFilter.getToDate())){
        		try {
					searchCriteria.addFilter(Filter.lessOrEqual("updateTimeStamp", ActivityLogFilter.asDate(logFilter.getToDate())) );
				} catch (ParseException e) {
					LOGGER.error(e.getMessage(),e);
				}
        	}
        	if(StringUtils.isNotBlank(logFilter.getToDate())){
        		searchCriteria.addFilter(Filter.ilike("username", "%"+logFilter.getUsername()+"%"));
        	}
        	if(StringUtils.isNotBlank(logFilter.getUsername()))
        		searchCriteria.addFilter(Filter.ilike("username", "%"+logFilter.getUsername()+"%"));
        	if(StringUtils.isNotBlank(logFilter.getCountry()))
        		searchCriteria.addFilter(Filter.ilike("country","%"+logFilter.getCountry()+"%"));        	
        	if(StringUtils.isNotBlank(logFilter.getQuestion_id()))
        		searchCriteria.addFilter(Filter.equal("question_id", logFilter.getQuestion_id()));
        	if(StringUtils.isNotBlank(logFilter.getContent()))
        		searchCriteria.addFilter(Filter.ilike("content","%"+logFilter.getContent()+"%"));
        }
        
        if (page != null) {
            searchCriteria.setMaxResults(entries);
            searchCriteria.setPage(page);
        }
        
        return searchCriteria;
   }

    public List<ActivityLogEntry> getAll(Integer page, Integer entries, ActivityLogFilter logFilter) throws BadRequestServiceEx {

        Search searchCriteria = getSearchCriteria(page, entries, logFilter);  
        
        List<ActivityLogEntry> found = activityLogDAO.search(searchCriteria);

        return found;
    }
    
    /**
     * Filters the  activity log and add proper filter for users (reviewer,editor)
     * @param page
     * @param entries
     * @param logFilter
     * @param user
     * @return
     * @throws BadRequestServiceEx
     */
    public List<ActivityLogEntry> getAll(Integer page, Integer entries, ActivityLogFilter logFilter,User user) throws BadRequestServiceEx {
        if(user==null) return getAll(page,entries,logFilter);
        Search searchCriteria = getSearchCriteria(page, entries, logFilter);  
        if(user.getRole().equals("reviewer")){
            searchCriteria.addFilterIn("country",Arrays.asList(UserUtil.getIso3Array(user)));
            searchCriteria.addFilterIn("question_id", UserUtil.getQuestionIdList(user));
        }else if(user.getRole().equals("editor")){
           searchCriteria.addFilterIn("country",Arrays.asList(UserUtil.getIso3Array(user)));
        }
        List<ActivityLogEntry> found = activityLogDAO.search(searchCriteria);

        return found;
    }
    
    
    
    
}
