/*
 *  fra2015
 *  https://github.com/geosolutions-it/fra2015
 *  Copyright (C) 2013 GeoSolutions S.A.S.
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
package it.geosolutions.fra2015.mvc.aspect;

import it.geosolutions.fra2015.entrypoint.model.Update;
import it.geosolutions.fra2015.entrypoint.model.Updates;
import it.geosolutions.fra2015.server.model.survey.ActivityLogEntry;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.services.SurveyActivityLog;

import java.util.GregorianCalendar;
import java.util.List;
import java.util.TimeZone;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author DamianoG
 *
 */
@Aspect
public class ActivityLogAspect {

    private Logger LOGGER = Logger.getLogger(ActivityLogAspect.class);
    
    private static final String DELETED = "***VALUE_DELETED***";
    private static final String STATUS_CHANGED = "STATUS_CHANGED";
    
    @Autowired
    private SurveyActivityLog sal;
    
    @Before("execution(* it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.updateValuesService(..))")
    public void logUpdates(JoinPoint joinPoint) {
        
        Updates up = (Updates)joinPoint.getArgs()[0];
        List<Update> upList = up.getUpdates();

        for(Update el : upList){
            
            sal.storeLog(fromUpdateToActivityLog(el, up.getQuestion(), up.getUsername()));
        }

        Updates del = (Updates) joinPoint.getArgs()[1];

        List<Update> delList = del.getUpdates();
        if (delList != null) {
            for (Update el : delList) {

                sal.storeLog(fromDeleteToActivityLog(el, up.getQuestion(), up.getUsername()));
            }
        }
        
        
    }
    
    @Before("execution(* it.geosolutions.fra2015.entrypoint.SurveyServiceEntryPoint.changeStatus(..))")
    public void logStatusChange(JoinPoint joinPoint) {
        
        Status status = (Status)joinPoint.getArgs()[0];
        sal.storeLog(fromStatusToActivityLog(status));
    }
    
    private static ActivityLogEntry fromStatusToActivityLog(Status status){
        
        ActivityLogEntry al = new ActivityLogEntry();
        al.setContent(truncateContent(composeStatusChangeContent(status), 3900));
        al.setCountry(status.getCountry());
        al.setVarName(null);
        al.setVarCol(null);
        al.setVarRow(null);
        al.setQuestion_id(STATUS_CHANGED);
        al.setTimestamp(GregorianCalendar.getInstance(TimeZone.getTimeZone("UTC")).getTime());
        al.setUsername(null);
        return al;
    }
    
    private static String composeStatusChangeContent(Status status) {

        final String SEPARATOR = " % ";
        String tostring = "status=" + status.getStatus() + SEPARATOR + "coverage="
                + status.getCoverage() + SEPARATOR + "reviewerSubmit=" + status.getReviewerSubmit()
                + SEPARATOR + "lastContributorSubmission=" + status.getLastContributorSubmission()
                + SEPARATOR + "lastSurveyReview=" + status.getLastPendingFixSubmit() + SEPARATOR
                + "previousSurveyReview=" + status.getPreviousPendingFix() + SEPARATOR
                + "revisionNumber=" + status.getRevisionNumber() + SEPARATOR + "message="
                + status.getMessage();
        return tostring;
    }
    
    private static ActivityLogEntry fromUpdateToActivityLog(Update u, String question, String username){
        
        ActivityLogEntry al = new ActivityLogEntry();
        al.setContent(truncateContent(u.getValue(), 20));
        al.setCountry(u.getCountry());
        al.setVarName(u.getVariable());
        al.setVarCol(u.getColumn());
        al.setVarRow(u.getRow());
        al.setQuestion_id(question);
        al.setTimestamp(GregorianCalendar.getInstance(TimeZone.getTimeZone("UTC")).getTime());
        al.setUsername(username);
        return al;
    }
    
    private static ActivityLogEntry fromDeleteToActivityLog(Update u, String question, String username){
        
        ActivityLogEntry al = new ActivityLogEntry();
        al.setContent(DELETED);
        al.setCountry(u.getCountry());
        al.setVarName(u.getVariable());
        al.setVarCol(u.getColumn());
        al.setVarRow(u.getRow());
        al.setQuestion_id(question);
        al.setTimestamp(GregorianCalendar.getInstance(TimeZone.getTimeZone("UTC")).getTime());
        al.setUsername(username);
        return al;
    }
    
    private static String truncateContent(String content, int lenght){
        
        if(!StringUtils.isBlank(content) && content.length() > lenght){
            StringBuilder sb = new StringBuilder();
            sb.append(content.substring(0, lenght)).append("[...]");
            return sb.toString();
        }
        return content;
    }
}
