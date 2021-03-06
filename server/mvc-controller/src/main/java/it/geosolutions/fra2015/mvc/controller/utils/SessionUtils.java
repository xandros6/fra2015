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
package it.geosolutions.fra2015.mvc.controller.utils;

import it.geosolutions.fra2015.entrypoint.model.CountryValues;
import it.geosolutions.fra2015.server.model.survey.Feedback;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;

import java.util.List;

import javax.servlet.http.HttpSession;

/**
 * @author DamianoG
 *
 */
public class SessionUtils {

    public static final String COUNTRY_SURVEY_VALUES = "countryValues";
    public static final String COUNTRY_FEEDBACKS = "feedbacks";
    
    public static CountryValues retrieveQuestionValueAndStoreInSession(ControllerServices utils, HttpSession session, Long question, String country){
    
        CountryValues cv = utils.retrieveValues(question.toString(), country);
        
        if(session.getAttribute(COUNTRY_SURVEY_VALUES) != null){
            
            session.removeAttribute(COUNTRY_SURVEY_VALUES);
        }
        session.setAttribute(COUNTRY_SURVEY_VALUES, cv);
        
        return cv;
    }
    
    public static CountryValues retrieveQuestionValueFromSessionOrLoadFromDB(ControllerServices utils, HttpSession session, Long question, String country){
        
        if(session.getAttribute(COUNTRY_SURVEY_VALUES) == null){
            
            CountryValues cv = null;
            cv = utils.retrieveValues(question.toString(), country);
            return cv;
        }
        CountryValues cv = (CountryValues)session.getAttribute(COUNTRY_SURVEY_VALUES);
        session.removeAttribute(COUNTRY_SURVEY_VALUES);
        return cv;
    }
    
    /*****************************************************************
     * WARNING: The following two methods: 
     *              - retrieveFeedbacksAndStoreInSession
     *              - retrieveFeedbacksFromSessionOrLoadFromDB
     * Has been changed and their names are not representatives.
     * Please read their Javadoc
     *****************************************************************/
    
    /**
     * WARNING 18/11/2013: This method was originally designed to perform a some kind of data caching using user Session but it has created
     * lot of problem in pre-production testing so the base feedback load has been restored keeping the same method signature in order to avoid regressions.
     * Same case of method retrieveFeedbacksFromSessionOrLoadFromDB(...)
     *   
     * @param fh
     * @param session
     * @param question
     * @param country
     * @param userForQuery
     * @param harmonized
     * @return
     * @throws BadRequestServiceEx
     * @throws NotFoundServiceEx
     */
    public static List<Feedback> retrieveFeedbacksAndStoreInSession(FeedbackHandler fh, HttpSession session, Long question, String country, User userForQuery, Boolean harmonized) throws BadRequestServiceEx, NotFoundServiceEx{
        
        List<Feedback> feedbackList = fh.retrieveFeedbacks(country, question, session, userForQuery, harmonized);
        
//        if(session.getAttribute(COUNTRY_FEEDBACKS) != null){
//            
//            session.removeAttribute(COUNTRY_FEEDBACKS);
//        }
//        session.setAttribute(COUNTRY_FEEDBACKS, feedbackList);
        
        return feedbackList;
    }
    
    /**
     * WARNING 18/11/2013: This method was originally designed to perform a some kind of data caching using user Session but it has created
     * lot of problem in pre-production testing so the base feedback load has been restored keeping the same method signature in order to avoid regressions.
     * Same case of method retrieveFeedbacksAndStoreInSession(...)
     * 
     * @param fh
     * @param session
     * @param question
     * @param country
     * @param userForQuery
     * @param harmonized
     * @return
     * @throws BadRequestServiceEx
     * @throws NotFoundServiceEx
     */
    public static List<Feedback> retrieveFeedbacksFromSessionOrLoadFromDB(FeedbackHandler fh, HttpSession session, Long question, String country, User userForQuery, Boolean harmonized) throws BadRequestServiceEx, NotFoundServiceEx{
        
//        if(session.getAttribute(COUNTRY_FEEDBACKS) == null){
//            
            List<Feedback> feedbacks = null;
            feedbacks = fh.retrieveFeedbacks(country, question, session, userForQuery, harmonized);
            return feedbacks;
//        }
//        List<Feedback> returnList = (List<Feedback>)session.getAttribute(COUNTRY_FEEDBACKS);
//        session.removeAttribute(COUNTRY_FEEDBACKS);
//        return returnList;
    }
}
