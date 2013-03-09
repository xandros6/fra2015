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

import it.geosolutions.fra2015.entrypoint.SurveyServiceEntryPoint;
import it.geosolutions.fra2015.entrypoint.model.CountryValues;
import it.geosolutions.fra2015.entrypoint.model.Updates;
import it.geosolutions.fra2015.server.model.survey.CompactValue;
import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.services.SurveyCatalog;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

/**
 * @author DamianoG
 *
 */
public class ControllerServices {
    
    Logger LOGGER = Logger.getLogger(ControllerServices.class);
    
    @Autowired
    private SurveyServiceEntryPoint surveyService;
    @Autowired
    private SurveyCatalog catalog;
    
    public enum Profile {CONTRIBUTOR,REIVIEWER,REVIEWEDITOR,PRINT,COUNTRYACCEPTANCE,ACCEPTED}
    
    /**
     * Retrieve the survey value given a question and country code.
     * If question == null the method loads all value from each question
     * 
     * @param question the id of the question.
     * @param country the iso3 code of the country
     * @return
     */
    public CountryValues retrieveValues(String question, String country) {

        Integer q = (question != null)?Integer.parseInt(question):null;

        CountryValues es = null;
        try {
            es = surveyService.getCountryAndQuestionValues(country, q);
        } catch (BadRequestServiceEx e) {
            LOGGER.error(e.getLocalizedMessage());
        }
        return es;
    }

    public void prepareHTTPRequest(Model model, String question, CountryValues values, boolean printNameInsteadOfValue) {

        Integer q = (question != null)?Integer.parseInt(question):null;
        
        Map<String, Integer> tableRowsCounter = new HashMap<String, Integer>();
        List<Entry> questionCatalog = catalog.getCatalogForQuestion(null);
        for (Entry el : questionCatalog) {
            if (el != null && el.getType().equalsIgnoreCase("table")) {
                tableRowsCounter.put("tableRowsCounter" + el.getVariable(), 4);
            }
        }

        for (CompactValue el : values.getValues()) {
            // Hack for handle dynamicTables: the jsp must know how many row are present.
            // so count them for each table and put it in the model
            if (catalog.getEntry(el.getVariable()).getType().equals("table")) {
                Integer oldRowCounter = tableRowsCounter.remove("tableRowsCounter"
                        + el.getVariable());
                Integer newRowCounter = (el.getRowNumber() >= 4 && el.getRowNumber() > oldRowCounter) ? el
                        .getRowNumber() : 4;
                // Integer newRowCounter = (oldRowCounter != null && oldRowCounter+1>4)?el.getRowNumber():4;
                tableRowsCounter.put("tableRowsCounter" + el.getVariable(), newRowCounter);
            }
            String print = (printNameInsteadOfValue)?el.getVariable():el.getContent();
            model.addAttribute(VariableNameUtils.buildVariableAsText(el), print);
        }

        // Put in the model the counters
        for (String el : tableRowsCounter.keySet()) {
            if (el.startsWith("tableRowsCounter")) {
                String name = el.substring(16);
                model.addAttribute(el, tableRowsCounter.get(el));
            }
        }
    }
    
    public void updateValuesService(Updates updates){
        surveyService.updateValues(updates);
    }
    
}
