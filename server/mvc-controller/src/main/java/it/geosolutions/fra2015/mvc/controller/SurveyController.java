/*
 *  fra2015
 *  https://github.com/geosolutions-it/fra2015
 *  Copyright (C) 2007-2013 GeoSolutions S.A.S.
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
package it.geosolutions.fra2015.mvc.controller;

import static it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.SESSION_USER;
import static it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.TEXT_STATIC_TABLE;
import it.geosolutions.fra2015.entrypoint.model.CountryValues;
import it.geosolutions.fra2015.entrypoint.model.Update;
import it.geosolutions.fra2015.entrypoint.model.Updates;
import it.geosolutions.fra2015.mvc.concurrency.BasicConcurrencyHandler;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices;
import it.geosolutions.fra2015.mvc.controller.utils.FeedbackHandler;
import it.geosolutions.fra2015.mvc.controller.utils.SessionUtils;
import it.geosolutions.fra2015.mvc.controller.utils.StatusUtils;
import it.geosolutions.fra2015.mvc.controller.utils.VariableNameUtils;
import it.geosolutions.fra2015.mvc.controller.utils.VariableNameUtils.VariableName;
import it.geosolutions.fra2015.server.model.survey.CompactValue;
import it.geosolutions.fra2015.server.model.survey.Feedback;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.FeedbackService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.InternalErrorServiceEx;
import it.geosolutions.fra2015.services.utils.UserUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author DamianoG
 * 
 * This is the contributor controller 
 * 
 * 
 */
@Controller
@RequestMapping("/survey/{question}")
public class SurveyController{ 

    @Autowired
    private ControllerServices utils;

    @Autowired
    private FeedbackService feedbackService;
    
    @Autowired
    private BasicConcurrencyHandler concurencyHandler;
    
    private final Logger LOGGER = Logger.getLogger(SurveyController.class);
    
    /**
     * This value is used in select box for mark an Empty Value. 
     * Note if this value is added in a text cell the meaning is the same: the value on DB will be erased.
     */
    private static final String ERASE_VALUE = "---";
    
    @RequestMapping(value = "/survey/{question}", method = RequestMethod.GET)
    public String handleGet(@PathVariable(value = "question") String question, Model model,
            HttpSession session) {

        concurencyHandler.loadQuestionRevision(session, Long.parseLong(question));
        
        Long questionLong = Long.parseLong(question); 
        try{
            Integer.parseInt(question);
        }
        catch(Exception e){
            model.addAttribute("context", "survey");
            model.addAttribute("question", 0);
            session.invalidate();
            return "login";
        }
        
        model.addAttribute("question", question);
        model.addAttribute("context", "survey");
        
        User su = (User) session.getAttribute(SESSION_USER);
        String iso3 = UserUtil.getSingleIso3(su);
        String status = utils.getStatusByCountry(iso3);
        model.addAttribute("profile", ControllerServices.Profile.CONTRIBUTOR.toString());
        
        String statusLocale= StatusUtils.getStatusLocaleCode(status);
        // Set the parameter operationWR, the domain is "WRITE" "READ"
        model.addAttribute("statuscode",statusLocale);
        model.addAttribute("country", iso3);
        model.addAttribute("status",status);    
        CountryValues cv = SessionUtils.retrieveQuestionValueAndStoreInSession(utils, session, questionLong, iso3);
        utils.prepareHTTPRequest(model, question, cv, false);

        FeedbackHandler fh = new FeedbackHandler(utils, feedbackService);
        try {
            
            List<Feedback> listF = fh.retrieveFeedbacks(iso3, questionLong, session, null, true);
            fh.prepareFeedbackModel(model, listF);
        } 
        catch (BadRequestServiceEx e) {            

            session.invalidate();
            model.addAttribute("messageType", "warning");
            model.addAttribute("messageCode", "alert.savefaliure");
            LOGGER.error(e.getMessage(), e);
            return "reviewer";
        }
        
        return "index";

    }

    @RequestMapping(value = "/survey/{question}", method = RequestMethod.POST)
    public String handlePost(HttpServletRequest request,
            @PathVariable(value = "question") String question, HttpSession session, Model model) {

        Long questionLong = null;
        try{
            questionLong = Long.parseLong(question);
        }
        catch(Exception e){
            model.addAttribute("context", "survey");
            model.addAttribute("question", 0);
            session.invalidate();
            return "login";
        }
        
        model.addAttribute("question", question);
        model.addAttribute("context", "survey");

        User su = (User) session.getAttribute(SESSION_USER);

        // Retrieve the stored value in order to compare them with the new submitted values
        String iso3 = UserUtil.getSingleIso3(su);
        String status = utils.getStatusByCountry(iso3);
        model.addAttribute("status",status);
        CountryValues es = SessionUtils.retrieveQuestionValueFromSessionOrLoadFromDB(utils, session, questionLong, iso3);
        List<CompactValue> oldValues = es.getValues();
        
        // Create the OLD MAP
        Map<String, CompactValue> oldMap = new HashMap<String, CompactValue>();
        for(CompactValue el : oldValues){
            String oldVarName = VariableNameUtils.buildVariableAsText(el);
            oldMap.put(oldVarName, el);
        }
        
        // Get from the request the EntryItem values to update
        Map<String, String[]> reqParams = request.getParameterMap();

        // Create the UPDATE LIST
        List<Update> updateList = new ArrayList<Update>();
        
        // Create the UPDATE MAP
        Map<String, Update> updateMap = new HashMap<String, Update>();

 
        //Iterate over all req params...
        for (String el : reqParams.keySet()) {
            
            // TODO be sure that the params taken from the request is an entryItem
            //get the value of the param
            String newValue = reqParams.get(el)[0];
            //build the Value (unproperly called 'Variable' in variableNameUtils class)
            VariableNameUtils.VariableName var = VariableNameUtils.buildVariable(el, newValue);
            
            //copy the variable (all info, both name and values) in an Update instance
            Update update = new Update();
            update.setColumn(var.col);
            update.setRow(var.row);
            update.setCountry(iso3);
            update.setValue(var.value);
            update.setVariable(var.variableName);
            
            // ADD TO UPDATE MAP (just for avoid another iteration over a list...)
            updateMap.put(el, update);
            
            // ADD TO UPDATE LIST IF THE VALUE:
            // * is present in oldValues
            // * is not present in oldValues Map AND is not a blank value
            if(checkIfTheValueMustBeUpdated(el, newValue, oldMap)){
              //add it to the add list, so the Value will be updated
                updateList.add(update);
            }
        }
        
        // create the REMOVE LIST, this list will be passed to values deletion service
        Updates removes = getValuesToDelete(oldValues, updateMap, iso3);
        
        //Build the update list, the object taken as input in updateValuesService method 
        Updates updates = new Updates();
        updates.setUpdates(updateList);
        updates.setQuestion(question);
        updates.setUsername(su.getUsername());

        // Update the Values only if the concurrency System allow the operation.
        if(concurencyHandler.updateQuestionRevision(session, Long.parseLong(question))){
            if(StatusUtils.isSubmitAllowed(utils.getStatusByCountry(iso3))){
                utils.updateValuesService(updates, removes);
                utils.updateSurveyStatusInProgress(iso3);
            }else{
                //TODO notify is not editable
            }
            
        }
        else{
            // Display the concurrency error message
            LOGGER.error("FATAL ERROR");
            model.addAttribute("messageType","warning");
            //model.addAttribute("messageType","alert");// red background
            model.addAttribute("messageCode","alert.savefaliure");
            model.addAttribute("messageTrailCode","message.cuncurrencyconflict");
            model.addAttribute("messageTimeout",10000);
        }
        
        // Set the parameter operationWR, the domain is "WRITE" "READ"
        concurencyHandler.loadQuestionRevision(session, Long.parseLong(question));
        
        //Merge old values with those have been changed       
//        List<CompactValue> backList = new ArrayList<CompactValue>();
//        for(String el : updateMap.keySet()){
//            
//            CompactValue v = oldMap.get(el);
//            if(v != null){
//                
//                backList.add(v);
//            }
//            else{
//                
//                Update u = updateMap.get(el);
//                CompactValue cv = new CompactValue();
//                cv.setColumnNumber(u.getColumn());
//                cv.setContent(u.getValue());
//                cv.setRowNumber(u.getRow());
//                cv.setVariable(u.getVariable());
//                backList.add(cv);
//            }
//        }
//        CountryValues mergedValues = new CountryValues();
//        mergedValues.setValues(backList);
        
        utils.prepareHTTPRequest(model, question, utils.retrieveValues(question.toString(), iso3)/*mergedValues*/, false);

        FeedbackHandler fh = new FeedbackHandler(utils, feedbackService);
        try {
            
            List<Feedback> listF = fh.retrieveFeedbacks(iso3, questionLong, session, null, true);
            fh.prepareFeedbackModel(model, listF);
        } 
        catch (BadRequestServiceEx e) {
            
            session.invalidate();
            model.addAttribute("messageType", "warning");
            model.addAttribute("messageCode", "alert.savefaliure");
            LOGGER.error(e.getMessage(), e);
            return "reviewer";  //TODO <--- why????
        }
        
        model.addAttribute("country", iso3);


        
        String statusLocale= StatusUtils.getStatusLocaleCode(status);
        // Set the parameter operationWR, the domain is "WRITE" "READ"
        model.addAttribute("status",status);
        model.addAttribute("statuscode",statusLocale);
        model.addAttribute("profile", ControllerServices.Profile.CONTRIBUTOR.toString());
        model.addAttribute("messageType","success");
        model.addAttribute("messageCode","alert.savesuccess");
        //get the status 
        
        return "index";

    }
    
    /**
     * Check if the value has been removed by the user.
     * The value is Removed if:
     *  * is present in the oldValue List but not in newValues Map
     *  * is present in the oldValue List but is blank (or --- if is a select) in newValues Map
     *  
     * @param valueToCheck
     * @param newValues
     * @return
     */
    private Updates getValuesToDelete(List<CompactValue> oldValues, Map<String, Update> newValues, String country){
        
        List<Update> deleteList = new ArrayList<Update>();
        
        for (CompactValue el : oldValues) {
            
            String entryItemName = VariableNameUtils.buildVariableAsText(el);
            if(checkIfTheValueMustBeRemoved(entryItemName, newValues)){
                // build the Value (unproperly called 'Variable' in variableNameUtils class)
                VariableNameUtils.VariableName var = VariableNameUtils.buildVariable(entryItemName, el.getContent());
                // copy the variable (all info, both name and values) in an Update instance
                Update update = new Update();
                update.setColumn(var.col);
                update.setRow(var.row);
                update.setCountry(country);
                update.setValue(var.value);
                update.setVariable(var.variableName);
                // add it to the add list, so the Value will be updated
                deleteList.add(update);
            }
        }
        Updates updates = new Updates();
        updates.setUpdates(deleteList);
        return updates;
    }
    
    /**
     * The implementation of the logic for the removal check
     * 
     * @param valueToCheck
     * @param newValues
     * @return
     */
    private boolean checkIfTheValueMustBeRemoved(String valueToCheck, Map<String, Update> newValues){
        
        //Check if the Value Entry type is equals to fixed_table 
        VariableName var = VariableNameUtils.buildVariable(valueToCheck, "placeholder value");
        String type = utils.getEntryType(var.variableName);
        
        Update val = newValues.get(valueToCheck);
        
        if(val == null && !StringUtils.isBlank(type) && type.equals(TEXT_STATIC_TABLE)){
            //Static tables don't submit not changed value so return false;
            return false;
        }
        if(val == null && type!=null && !type.equals(TEXT_STATIC_TABLE)){
            
            return true;
        }
        if(StringUtils.isBlank(val.getValue()) || StringUtils.equals(val.getValue(), ERASE_VALUE)){
            
            return true;
        }
        return false;
    }
    
    /**
     * The implementation of the logic for the update check.
     * 
     * @param valueToCheck
     * @param newValues
     * @return
     */
    private static boolean checkIfTheValueMustBeUpdated(String name, String value, Map<String, CompactValue> oldValues){
        
        CompactValue val = oldValues.get(name);
//        if(val != null){
            
            if(StringUtils.isBlank(value) || StringUtils.equals(value, ERASE_VALUE) || (val!=null && value.equals(val.getContent()))){
                
                return false;
            }
//        }
        
        return true;
    }
}
