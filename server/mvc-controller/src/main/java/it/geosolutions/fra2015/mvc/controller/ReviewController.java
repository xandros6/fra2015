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

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices;
import it.geosolutions.fra2015.server.model.survey.Question;
import it.geosolutions.fra2015.server.model.user.User;

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
public class ReviewController {

    @Autowired
    private ControllerServices utils;

    Logger LOGGER = Logger.getLogger(ReviewController.class);

    @RequestMapping(value = "/survey/review/{country}/{question}", method = RequestMethod.GET)
    public String handleGet(
    		@PathVariable(value = "country") String country, 
    		@PathVariable(value = "question") Long question, Model model,
            HttpSession session) {
	    
	    
        // TODO validate country
        User su = (User) session.getAttribute("sessionUser");
        if(su==null){
            return "redirect:/login";
        }
        //check allowed questions
        Set<Question> allowed = su.getQuestions();
        List<Long> allowedQuestionNumbers = new ArrayList<Long>();
        Long min = Long.MAX_VALUE;
        for (Question q : allowed) {
            allowedQuestionNumbers.add(q.getId());
            min = q.getId() < min ? q.getId():min;
        }
        //set current quetstion if not available
        if (!allowedQuestionNumbers.contains(question)){
            question = min;
        }
        model.addAttribute("allowedQuestions",allowedQuestionNumbers);
        model.addAttribute("context", "survey");
        model.addAttribute("question", question);
        //TODO check access to provide accessible questions for menu and allow to 
        // Set the parameter operationWR, the domain is "WRITE" "READ"
        model.addAttribute("profile", ControllerServices.Profile.REIVIEWER.toString());
        utils.prepareHTTPRequest(model, question.toString(), utils.retrieveValues(question.toString(), country), false);
        
        
        return "reviewer";

    }

    @RequestMapping(value = "/survey/review/{country}/{question}", method = RequestMethod.POST)
    public String handlePost(HttpServletRequest request,
            @PathVariable(value = "country") String country,
            @PathVariable(value = "question") String question, HttpSession session, Model model) {
        model.addAttribute("question", question);
        model.addAttribute("context", "survey");
        // TODO validate country
        User su = (User) session.getAttribute("sessionUser");
        // TODO check access to provide accessible questions for menu and allow to
        // Set the parameter operationWR, the domain is "WRITE" "READ"
        model.addAttribute("profile", ControllerServices.Profile.REIVIEWER.toString());
        utils.prepareHTTPRequest(model, question, utils.retrieveValues(question, country), false);

        // TODO save feedbacks
        model.addAttribute("messageType", "warning");
        // model.addAttribute("messageType","alert");// red background
        model.addAttribute("messageCode", "alert.savefaliure");

        model.addAttribute("messageTimeout", 5000);
        return "reviewer";

    }
}
