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
import it.geosolutions.fra2015.entrypoint.model.CountryValues;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;
import it.geosolutions.fra2015.mvc.controller.utils.FeedbackHandler;
import it.geosolutions.fra2015.mvc.controller.utils.SessionUtils;
import it.geosolutions.fra2015.mvc.controller.utils.StatusUtils;
import it.geosolutions.fra2015.server.model.survey.Feedback;
import it.geosolutions.fra2015.server.model.survey.Question;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.FeedbackService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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
    
    @Autowired
    private FeedbackService feedbackService;
    
    @Autowired
    private SurveyServiceEntryPoint surveyService;
    
    private final Logger LOGGER = Logger.getLogger(ReviewController.class);

    @RequestMapping(value = "/survey/review/{country}/{question}", method = RequestMethod.GET)
    public String handleGet(
            @PathVariable(value = "country") String country,
            @PathVariable(value = "question") Long question, Model model,
            HttpSession session) {


        User su = (User) session.getAttribute("sessionUser");
        if (su == null) {
            return "redirect:/login";
        }

        User userForQuery = new User();
        Boolean harmonized = null;
        Profile userProfile = null;

        if (su.getRole().equalsIgnoreCase(Profile.REVIEWER.toString())) {
            //TODO check if reviewer has access to this country
            model.addAttribute("profile", Profile.REVIEWER.toString());
            setupAllowedQuestions(question, su, model);
            userForQuery = su;
            harmonized = false;
            userProfile = Profile.REVIEWER;
        } else if (su.getRole().equalsIgnoreCase(Profile.EDITOR.toString())) {

            model.addAttribute("profile", ControllerServices.Profile.EDITOR.toString());
            model.addAttribute("context", "survey");
            model.addAttribute("question", question);
            userForQuery = null;
            userProfile = Profile.EDITOR;
        } else {
            return "redirect:/login";
        }

        String status = utils.getStatusByCountry(country);
       
        model.addAttribute("profile", userProfile.toString());
        
        String statusLocale = StatusUtils.getStatusLocaleCode(status);
        // Set the parameter operationWR, the domain is "WRITE" "READ"
        model.addAttribute("status",status);
        model.addAttribute("statuscode", statusLocale);
        model.addAttribute("country", country);


        try {
            CountryValues cvalues = SessionUtils.retrieveQuestionValueAndStoreInSession(utils, session, question, country);
            utils.prepareHTTPRequest(model, question.toString(), cvalues, false);

            FeedbackHandler fh = new FeedbackHandler(utils, feedbackService);

            List<Feedback> listF = SessionUtils.retrieveFeedbacksAndStoreInSession(fh, session, question, country, userForQuery, harmonized);
            if (Profile.EDITOR.toString().equalsIgnoreCase(su.getRole())) {

                listF = fh.packageFeedbacks(listF, true);
            }
            fh.prepareFeedbackModel(model, listF);
        } catch (BadRequestServiceEx e) {

            model.addAttribute("messageType", "warning");
            model.addAttribute("messageCode", "alert.savefaliure");
            LOGGER.error(e.getMessage(), e);
            return "reviewer";
        }

        return "reviewer";

    }

    @RequestMapping(value = "/survey/review/{country}/{question}", method = RequestMethod.POST)
    public String handlePost(HttpServletRequest request,
            @PathVariable(value = "country") String country,
            @PathVariable(value = "question") String question, HttpSession session, Model model) {

        String status = utils.getStatusByCountry(country);
        String statusLocale = StatusUtils.getStatusLocaleCode(status);
        // Set the parameter operationWR, the domain is "WRITE" "READ"
        model.addAttribute("status",status);
        model.addAttribute("statuscode", statusLocale);
        model.addAttribute("question", question);
        model.addAttribute("context", "survey");
        // TODO validate country
        model.addAttribute("country", country);
        User su = (User) session.getAttribute("sessionUser");
        Boolean harmonizedRead = null;
        Boolean harmonizedWrite = null;
        User userForQuery = new User();

        if (su == null) {
            return "redirect:/login";
        }
        if (su.getRole().equalsIgnoreCase(Profile.REVIEWER.toString())) {
            //TODO check if reviewer has access to this country
            model.addAttribute("profile", Profile.REVIEWER.toString());
            setupAllowedQuestions(Long.parseLong(question), su, model);
            harmonizedRead = false;
            harmonizedWrite = false;
            userForQuery = su;
        } else if (su.getRole().equalsIgnoreCase(Profile.EDITOR.toString())) {

            model.addAttribute("profile", ControllerServices.Profile.EDITOR.toString());
            harmonizedWrite = true;
            userForQuery = null;
        } else {
            return "redirect:/login";
        }

        CountryValues cvalues = SessionUtils.retrieveQuestionValueFromSessionOrLoadFromDB(utils, session, Long.parseLong(question), country);
        utils.prepareHTTPRequest(model, question, cvalues, false);

        // save feedbacks
        FeedbackHandler fh = new FeedbackHandler(utils, feedbackService);
        fh.populateFeedbackList(request, session, utils, country, harmonizedWrite);

        try {

            List<Feedback> oldFeedbacks = SessionUtils.retrieveFeedbacksFromSessionOrLoadFromDB(fh, session, Long.parseLong(question), country, userForQuery, harmonizedRead);
            fh.mergefeedbacks(oldFeedbacks);
            fh.storeFeedbacks();
            
            changeStatusToUnderReview(country, su);
            
            if (su.getRole().equalsIgnoreCase(Profile.EDITOR.toString())) {
                List<Feedback> notHarmonizedFeedbacks = fh.packageFeedbacks(oldFeedbacks, false);
                fh.addAllToFeedbackList(notHarmonizedFeedbacks);
            }
        } catch (BadRequestServiceEx e) {

            model.addAttribute("messageType", "warning");
            model.addAttribute("messageCode", "alert.savefaliure");
            LOGGER.error(e.getMessage(), e);
            return "reviewer";
        }

        //Put feedback in model
        fh.prepareFeedbackModel(model, fh.getFeedbackList());

        model.addAttribute("messageType", "success");
        model.addAttribute("messageCode", "alert.savesuccess");

        model.addAttribute("messageTimeout", 5000);
        return "reviewer";

    }

    private static void setupAllowedQuestions(Long question, User su, Model model) {
        Set<Question> allowed = su.getQuestions();
        List<Long> allowedQuestionNumbers = new ArrayList<Long>();
        Long min = Long.MAX_VALUE;
        for (Question q : allowed) {
            allowedQuestionNumbers.add(q.getId());
            min = q.getId() < min ? q.getId() : min;
        }
        //set current question if not available
        if (!allowedQuestionNumbers.contains(question)) {
            question = min;
        }
        //create a string list to parse
        List<String> allowedQuestions = new ArrayList<String>();
        for (Long n : allowedQuestionNumbers) {

            allowedQuestions.add("q" + (n > 9 ? n : "0" + n));
        }
        model.addAttribute("allowedQuestions", allowedQuestions);
        model.addAttribute("context", "survey");
        model.addAttribute("question", question);
    }
    
    private void changeStatusToUnderReview(String iso3, User su){
        
        Status status =surveyService.getStatus(iso3);
        if(su.getRole().equalsIgnoreCase(Profile.REVIEWER.toString()) && StatusUtils.isCompiled(status)){
            status.setCountry(iso3);
            status.setStatus(StatusUtils.UNDER_REVIEW);
            surveyService.changeStatus(status);
            LOGGER.info("submitted survey: " + status.getCountry() + " - the status now is UNDER_REVIEW");
        }
    }
}
