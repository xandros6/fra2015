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

import javax.servlet.http.HttpSession;

/**
 * @author DamianoG
 *
 */
public class SessionUtils {

    public static final String COUNTRY_SURVEY_VALUES = "countryValues";
    
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
            session.setAttribute(COUNTRY_SURVEY_VALUES, cv);
            return cv;
        }
        return (CountryValues)session.getAttribute(COUNTRY_SURVEY_VALUES);
    }
}
