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

/**
 * @author DamianoG
 *
 */
public class SurveyActivityLog { 
    
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

    public List<ActivityLogEntry> findByTimeInterval(String c, Long t1, Long t2, int page, int entries) {
        
        return  activityLogDAO.findByTimeInterval(c, t1, t2, page, entries);
    }

    public List<ActivityLogEntry> findByEntryItemName(String c, String entryItemName, int page, int entries) {

        return  activityLogDAO.findByEntryItemName(c, entryItemName, page, entries);
    }

    public List<ActivityLogEntry> findByQuestionAndUsername(String c, String question, String username, int page,int entries) {
        
        return  activityLogDAO.findByQuestionAndUsername(c, question, username, page, entries);
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
