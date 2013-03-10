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

import java.util.List;

import org.apache.log4j.Logger;

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
    
    
    
    
}
