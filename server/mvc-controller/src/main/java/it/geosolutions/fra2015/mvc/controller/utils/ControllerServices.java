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
import it.geosolutions.fra2015.server.dao.EntryItemDAO;
import it.geosolutions.fra2015.server.model.survey.CompactValue;
import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.server.model.survey.EntryItem;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;
import it.geosolutions.fra2015.services.BulkModelEntitiesLoader;
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
 * This class contains a set of utils that implements several operation used in several Controller.
 * These methods usually interact with one or more fra business Services 
 * The project involved is only the fra2015-services-impl for the new services created with refactor3 and also
 * projects fra2015-rest-api, fra2015-rest-impl, fra2015-services-api for old service design.
 * 
 */
public class ControllerServices {

    Logger LOGGER = Logger.getLogger(ControllerServices.class);

    @Autowired
    private SurveyServiceEntryPoint surveyService;

    @Autowired
    private SurveyCatalog catalog;

    @Autowired
    private BulkModelEntitiesLoader bulkLoader;

    public enum Profile {
        CONTRIBUTOR, REIVIEWER, REVIEWEDITOR, PRINT, COUNTRYACCEPTANCE, ACCEPTED
    }

    /**
     * Retrieve the survey value given a question and country code. If question == null the method loads all value from each question
     * 
     * @param question the id of the question.
     * @param country the iso3 code of the country
     * @return
     */
    public CountryValues retrieveValues(String question, String country) {

        Integer q = (question != null) ? Integer.parseInt(question) : null;

        CountryValues es = null;
        try {
            es = surveyService.getCountryAndQuestionValues(country, q);
        } catch (BadRequestServiceEx e) {
            LOGGER.error(e.getLocalizedMessage());
        }
        return es;
    }

    /**
     * Put in the model all the values provided as input and the dynamic table rows counters
     * 
     * @param model
     * @param question
     * @param values
     * @param printNameInsteadOfValue
     */
        // TODO please remove the awful printNameInsteadOfValue param but remember that at least printController still use it...
    public void prepareHTTPRequest(Model model, String question, CountryValues values,
            boolean printNameInsteadOfValue) {

        Integer q = (question != null) ? Integer.parseInt(question) : null;

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
                Integer newRowCounter = (el.getRowNumber() > oldRowCounter) ? el
                        .getRowNumber() : oldRowCounter;
                // Integer newRowCounter = (oldRowCounter != null && oldRowCounter+1>4)?el.getRowNumber():4;
                tableRowsCounter.put("tableRowsCounter" + el.getVariable(), newRowCounter);
            }
            String print = (printNameInsteadOfValue) ? el.getVariable() : el.getContent();
            model.addAttribute(VariableNameUtils.buildVariableAsText(el), print);
        }

        // Put in the model the counters, if a counter is < 4 , put 4 due to is the min rows displayed.
        for (String el : tableRowsCounter.keySet()) {
            if (el.startsWith("tableRowsCounter")) {
                String name = el.substring(16);
                model.addAttribute(el, tableRowsCounter.get(el));
            }
        }
    }

    /**
     * Put in the model all entryItems name and the dynamic table rows counters.
     * Iterate over ALL EntryItem and build the name with the Help of VariableNameUtils.buildVariableAsText(...). 
     * 
     * @param model
     * @param question
     * @param values
     * @param printNameInsteadOfValue
     */
    public void prepareHTTPRequestOnlyVariablesName(Model model, String country){

        CountryValues values = retrieveValues(null, country);
        Map<String, Integer> tableRowsCounter = countRowsAndStoreTheNumberInTheModel(model, values, catalog);
        List<EntryItem> entryItems = bulkLoader.loadAllEntryItem();
        for (EntryItem el : entryItems) {

            CompactValue cv = new CompactValue();
            if (el != null && el.getEntry() != null && el.getEntry().getVariable() != null) {
                cv.setVariable(el.getEntry().getVariable());
            }
            cv.setRowNumber(el.getRowNumber());
            cv.setColumnNumber(el.getColumnNumber());
            String entryItemName = VariableNameUtils.buildVariableAsText(cv);
            model.addAttribute(entryItemName, entryItemName);
        }
        
        //Put in the model the counters
        for (String el : tableRowsCounter.keySet()) {
            if (el.startsWith("tableRowsCounter")) {
                String name = el.substring(16);
                model.addAttribute(el, tableRowsCounter.get(el));
            }
        }

    }

    
    private static Map<String, Integer> initRowsCounters(SurveyCatalog catalog){
        
        Map<String, Integer> tableRowsCounter = new HashMap<String, Integer>();
        List<Entry> questionCatalog = catalog.getCatalogForQuestion(null);
        for (Entry el : questionCatalog) {
            if (el != null && el.getType().equalsIgnoreCase("table")) {
                tableRowsCounter.put("tableRowsCounter" + el.getVariable(), 4);
            }
        }
        return tableRowsCounter;
    }
   
    private static Map<String, Integer> countRowsAndStoreTheNumberInTheModel(Model model, CountryValues values, SurveyCatalog catalog) {
        
        Map<String, Integer> tableRowsCounter = initRowsCounters(catalog);
        
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
        }

        // Put in the model the counters
        for (String el : tableRowsCounter.keySet()) {
            if (el.startsWith("tableRowsCounter")) {
                String name = el.substring(16);
                model.addAttribute(el, tableRowsCounter.get(el));
            }
        }
        return tableRowsCounter;
    }

    /**
     * Compares for changes a new values set retrieved from HTTP request with the set stored on DB (called oldSet because it will be updated)
     * 
     * @param newSet
     * @param oldSet
     * @return Map<String, String[]> representing the values that must be deleted from DB
     */
    // public List<String> compareValueSet(Map<String, String[]> newSet, List<CompactValue> oldSet){
    //
    // // The return set
    // List<String> removedSet = new ArrayList<String>();
    //
    // //Iterate on the oldSet and search for updated values
    // for(CompactValue el : oldSet){
    //
    // String oldVariable = el.getVariable();
    //
    // String oldContent = el.getCo ntent();
    // String[] set = newSet.get(VariableNameUtils.buildVariableAsText(el));
    // String newContent = (set!=null)?set[0]:null;
    // if(newContent == null){
    // removedSet.add(oldVariable);
    // }
    // // if(!oldContent.equals(newContent)){
    // // activityLog(Changes.UPDATE);
    // // }
    // }
    //
    // //Iterate on the remaining values of newSet log them as ADDED Values
    // for(String el : newSet.keySet()){
    // activityLog(Changes.NEW);
    // }
    //
    // return removedSet;
    //
    // }

    public List<SurveyInstance> retriveSurveyListByCountries(String[] countryList, int page,
            int index) {

        return surveyService.getSurveysByCountry(countryList, page, index);
    }

    public void updateValuesService(Updates updates) {

        surveyService.updateValues(updates);
    }

}
