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

import it.geosolutions.fra2015.entrypoint.model.CountryValues;
import it.geosolutions.fra2015.entrypoint.model.Update;
import it.geosolutions.fra2015.entrypoint.model.Updates;
import it.geosolutions.fra2015.mvc.controller.utils.ActivityLogUtils;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices;
import it.geosolutions.fra2015.mvc.controller.utils.VariableNameUtils;
import it.geosolutions.fra2015.server.model.user.User;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
 */
@Controller
@RequestMapping("/survey/{question}")
public class SurveyController {

    @Autowired
    private ControllerServices utils;
    
    Logger LOGGER = Logger.getLogger(SurveyController.class);

    @RequestMapping(value = "/survey/{question}", method = RequestMethod.GET)
    public String printWelcome(@PathVariable(value = "question") String question, Model model,
            HttpSession session) {

        // model.addAttribute("message", "Spring 3 MVC dummy example");
        model.addAttribute("question", question);
        model.addAttribute("context", "survey");

        User su = (User) session.getAttribute("sessionUser");
        
        // Set the parameter operationWR, the domain is "WRITE" "READ"
        model.addAttribute("operationWR", ControllerServices.OperationWR.WRITE.toString());
        utils.prepareHTTPRequest(model, question, utils.retrieveValues(question, su));
        
        return "index";

    }

    @RequestMapping(value = "/survey/{question}", method = RequestMethod.POST)
    public String handlePost(HttpServletRequest request,
            @PathVariable(value = "question") String question, HttpSession session, Model model) {

        model.addAttribute("question", question);
        model.addAttribute("context", "survey");

        User su = (User) session.getAttribute("sessionUser");

        // Retrieve the stored value in order to compare them with the new submitted values
        CountryValues es = utils.retrieveValues(question, su);

        Map<String, String[]> reqParams = request.getParameterMap();

        ActivityLogUtils.compareValueSet(reqParams, es.getValues());

        List<Update> updateList = new ArrayList<Update>();
        User se = (User) session.getAttribute("sessionUser");

        for (String el : reqParams.keySet()) {
            String s = reqParams.get(el)[0];
            VariableNameUtils.VariableName var = VariableNameUtils.buildVariable(el, s);
            if (LOGGER.isInfoEnabled()) {
                LOGGER.info(var.toString());
            }

            Update update = new Update();
            update.setColumn(var.col);
            update.setRow(var.row);
            update.setCountry(su.getCountries());
            update.setValue(var.value);
            update.setVariable(var.variableName);
            updateList.add(update);
            if (LOGGER.isInfoEnabled()) {
                LOGGER.info("update persisted...");
            }

        }

        Updates updates = new Updates();
        updates.setUpdates(updateList);
        utils.updateValuesService(updates);
        
        // Another time???? WTF???
        // Set the parameter operationWR, the domain is "WRITE" "READ"
        model.addAttribute("operationWR", ControllerServices.OperationWR.WRITE.toString());
        utils.prepareHTTPRequest(model, question, utils.retrieveValues(question, su));
        
        return "index";

    }
}
