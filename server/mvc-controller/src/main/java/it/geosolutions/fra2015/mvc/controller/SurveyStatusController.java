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

import it.geosolutions.fra2015.entrypoint.SurveyServiceEntryPoint;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices;
import it.geosolutions.fra2015.mvc.controller.utils.StatusUtils;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;
import it.geosolutions.fra2015.mvc.model.Pagination;
import it.geosolutions.fra2015.server.model.survey.ActivityLogEntry;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.SurveyActivityLog;
import it.geosolutions.fra2015.services.UserService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.InternalErrorServiceEx;
import it.geosolutions.fra2015.services.model.ActivityLogFilter;
import it.geosolutions.fra2015.services.utils.UserUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Lorenzo Natali
 * 
 */
@Controller
public class SurveyStatusController {

    @Autowired
    private ControllerServices utils;

    @Autowired
    private SurveyServiceEntryPoint surveyService;

    @Autowired
    private UserService userService;
    
    @Autowired
    private SurveyActivityLog sal;
    Logger LOGGER = Logger.getLogger(SurveyStatusController.class);

    /**
     * Gets a checksum for a country. Shows:
     *  * Users for country
     *  * reviewers for each question
     *  * status changes
     *  * current status
     *  * coverage
     * 
     * @param country
     * @param model
     * @param session
     * @return
     * @throws IllegalArgumentException
     * @throws InternalErrorServiceEx
     */
    @RequestMapping(value = "/survey/status/{country}", method = RequestMethod.GET)
    public String printWelcome(@PathVariable(value = "country") String country, Model model,
            HttpSession session) throws IllegalArgumentException, InternalErrorServiceEx {
        User su = (User) session.getAttribute("sessionUser");
        if (su == null) {
            return "redirect:/login";
        }
        model.addAllAttributes(getUsers(country));
        model.addAttribute("context","surveystatus");
        model.addAttribute("countrycode",country);
        model.addAttribute("coverage",getQuestionCoverage(country));
        model.addAttribute("users",getUsers(country));
        Status status = utils.getStatusInstanceByCountry(country);
        model.addAttribute("status",status);
        model.addAttribute("statuscode",StatusUtils.getStatusLocaleCode(status));
        model.addAttribute("statuschanges",getStatusChanges(country));
        if (su.getRole().equalsIgnoreCase(Profile.ADMIN.toString())) {
            return "admin";
        }  else if (su.getRole().equalsIgnoreCase(Profile.EDITOR.toString())) {
           
           return "editor";
        } else {
            return "redirect:/login";
        }

    }
    
 

    /**
     * Returns users for each role in a map
     * @param country
     * @return a map of (contributors, reviewers,editors,validators)
     */
    private Map<String, List<User>> getUsers(String country) {
        Map<String, List<User>> users = new HashMap<String, List<User>>();

        for (String role : getRoles()) {
            List<User> list = userService.getUsersForCountry(country, role);
            if(role.equals("contributor")){
                List<User> submitters= new ArrayList<User>();
                for( User u : list){
                    
                    if(u.getCanSubmit()!=null){
                        if(u.getCanSubmit() ==true){
                            submitters.add(u);
                        }
                    }
                }
                users.put("submitters", submitters);
            }
            users.put(role + "s",list );
            
        }
        return users;

    }

    /**
     * Utility to get roles 
     * @return
     */
    private static List<String> getRoles() {
        List<String> roles = new ArrayList<String>();
        roles.add("contributor");
        roles.add("reviewer");
        roles.add("editor");
        roles.add("validator");
        return roles;
    }
    
    /**
     * Return a map of reviewer coverage 
     * @param country
     * @return a map <QuestionNumber,users>
     */
    private Map<Long,List<User>> getQuestionCoverage(String country){
        Map<Long,List<User>> coverage = new HashMap<Long,List<User>>();
        for(long question=0 ; question<=21 ; question++){
            coverage.put(question,userService.getReviewersForSurveyAndQuestion(country, question));
        }
        return coverage;
    }
    
    private List<ActivityLogEntry> getStatusChanges(String country){
        ActivityLogFilter logFilter = new ActivityLogFilter();
        logFilter.setQuestion_id("STATUS_CHANGED");
        logFilter.setCountry(country);
        
        List<ActivityLogEntry> activityLogList=null;
        try {
            activityLogList = sal.getAll(null, null, logFilter);
        } catch (BadRequestServiceEx e) {
            LOGGER.error(e.getMessage(), e);
        }

      

        return activityLogList;

    }
}
