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
package it.geosolutions.fra2015.mvc.controller;

import static it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.SURVEY_INSTANCES;
import freemarker.template.TemplateException;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices;
import it.geosolutions.fra2015.mvc.controller.utils.FlashAttributesHandler;
import it.geosolutions.fra2015.mvc.controller.utils.LoggingUtils;
import it.geosolutions.fra2015.mvc.controller.utils.ReviewerUtils;
import it.geosolutions.fra2015.mvc.controller.utils.StatusUtils;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;
import it.geosolutions.fra2015.server.model.survey.Question;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.FeedbackService;
import it.geosolutions.fra2015.services.SurveyCatalog;
import it.geosolutions.fra2015.services.SurveyService;
import it.geosolutions.fra2015.services.UserService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;
import it.geosolutions.fra2015.services.mail.NotificationSerivice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author DamianoG
 * @author Tobia Di Pisa at tobia.dipisa@geo-solutions.it
 * 
 */
@Controller
public class ReviewerSubmitController {

    @Autowired
    private FeedbackService feedbackService;

    @Autowired
    private SurveyService surveyService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private SurveyCatalog catalog;
    
    @Autowired
    private ControllerServices utils;
    
    @Autowired
    private NotificationSerivice notificationService;
    
    private static final Logger LOGGER = Logger.getLogger(ReviewerSubmitController.class);

    /**
     * @param country
     * @param session
     * @return SurveyInstance
     */
    private SurveyInstance getSurveyInstance(String country, HttpSession session){
        @SuppressWarnings("unchecked")
		Map<String, SurveyInstance> surveyInstanceMap = (Map<String, SurveyInstance>) session
                .getAttribute(SURVEY_INSTANCES);
        SurveyInstance si = surveyInstanceMap.get(country);
        return si;
    }
    
    /**
     * @param country
     * @param request
     * @param model
     * @param session
     * @return String
     */
    @RequestMapping(value = "/reviewersubmit/{country}", method = RequestMethod.GET)
    public String handleGet(@PathVariable(value = "country") String country, HttpServletRequest request, 
    		Model model, HttpSession session) {

        model.addAttribute("context","surveylist");
        User su = (User) session.getAttribute("sessionUser");
        if (su == null) {
            return "redirect:/login";
        }

        SurveyInstance si = getSurveyInstance(country, session);
        
        // ////////////////////////////////////
        // Update the status in surveyIstance
        // ////////////////////////////////////
        
        si.setStatus(surveyService.getStatus(country));
        
        // //////////////////////////////////
        // Check for not accepted questions
        // //////////////////////////////////
        
        List<Long> notAcceptedQuestions = new ArrayList<Long>();
        boolean accepted = true;

        Set<Question> questions = su.getQuestions();
        if(questions == null || questions.isEmpty()){
            StatusUtils.addReviewerToReviewerSubmit(su, si.getStatus());
            
            // ///////////////////////
            // submit the Survey
            // ///////////////////////
            
            FlashAttributesHandler.addFlashAttribute(session, "error", "revsubmit.error", 10000, null, null);
            return "redirect:/surveylist/0";
        }
        
        for (Question el : questions) {
            long qid = el.getId();
            if (!feedbackService.checkQuestionFeedbackStatus(su, si, qid)) {                
                notAcceptedQuestions.add(qid);
                accepted = false;
            }
        }
        
        Long[] qArray = (Long[]) notAcceptedQuestions.toArray(new Long[notAcceptedQuestions.size()]);
        Arrays.sort(qArray);
        
        if (accepted) {
            String redirect = "redirect:/surveylist/0";
            boolean outcome = doSubmit(si, su, session);
            Status surveyStatus = utils.getStatusInstanceByCountry(country);
            if(outcome && checkIfAllRevsHasSubmitted(country, surveyStatus)){
                try {
                    sendMailToReviewerEditor(country, session, su, surveyStatus);
                } catch (MailException e) {
                    FlashAttributesHandler.addFlashAttribute(session, "warning", "reviewer.lastsubmission.notnotified",
                            10000, null, null);
                    LOGGER.error("Error in mail notification (last reviewer submission) ",e);
                    return "redirect:/surveylist/0";

                } catch (TemplateException e) {
                    FlashAttributesHandler.addFlashAttribute(session, "warning", "reviewer.lastsubmission.notnotified",
                            10000, null, null);
                    LOGGER.error("Error in mail notification (last reviewer submission) ",e);
                    return "redirect:/surveylist/0";

                } catch (IOException e) {
                    FlashAttributesHandler.addFlashAttribute(session, "warning", "reviewer.lastsubmission.notnotified",
                            10000, null, null);
                    LOGGER.error("Error in mail notification (last reviewer submission) ",e);
                    return "redirect:/surveylist/0";
                }
            }
            return redirect;
        }else{
            FlashAttributesHandler.addFlashAttribute(session, "confirm", "revsubmit.ko", 10000, null, Arrays.toString(qArray));
            FlashAttributesHandler.addFlashConfirmedAttribute(session, country);
            return "redirect:/surveylist/0";
        }       
    }
    
    /**
     * @param country
     * @param request
     * @param model
     * @param session
     * @return String
     */
    @RequestMapping(value = "/reviewersubmitconfirmed/{country}", method = RequestMethod.GET)
    public String revisionSubmitConfirmed(@PathVariable(value = "country") String country,
    		HttpServletRequest request, Model model, HttpSession session) {

        model.addAttribute("context","surveylist");
        User su = (User) session.getAttribute("sessionUser");
        if (su == null) {
            return "redirect:/login";
        }

        SurveyInstance si = getSurveyInstance(country, session);
        
        // //////////////////////////////////////
        // Update the status in surveyIstance
        // //////////////////////////////////////
        
        si.setStatus(surveyService.getStatus(country));
        
        boolean outcome = doSubmit(si, su, session);
        String redirect = "redirect:/surveylist/0";
        Status surveyStatus = utils.getStatusInstanceByCountry(country);
        if(outcome && checkIfAllRevsHasSubmitted(country, surveyStatus)){
            try {
                sendMailToReviewerEditor(country, session, su, surveyStatus);
            } catch (MailException e) {
                FlashAttributesHandler.addFlashAttribute(session, "warning", "reviewer.lastsubmission.notnotified",
                        10000, null, null);
                LOGGER.error("Error in mail notification (last reviewer submission) ",e);
                return "redirect:/surveylist/0";

            } catch (TemplateException e) {
                FlashAttributesHandler.addFlashAttribute(session, "warning", "reviewer.lastsubmission.notnotified",
                        10000, null, null);
                LOGGER.error("Error in mail notification (last reviewer submission) ",e);
                return "redirect:/surveylist/0";

            } catch (IOException e) {
                FlashAttributesHandler.addFlashAttribute(session, "warning", "reviewer.lastsubmission.notnotified",
                        10000, null, null);
                LOGGER.error("Error in mail notification (last reviewer submission) ",e);
                return "redirect:/surveylist/0";
            }
        }
        return redirect;
    }
    
    /**
     * @param si
     * @param su
     * @param session
     * @return String
     */
    private boolean doSubmit(SurveyInstance si, User su, HttpSession session){
        Status s = si.getStatus();
        s.setCountry(si.getCountry().getIso3());
        
        boolean outcome = StatusUtils.addReviewerToReviewerSubmit(su, s);
        if(!outcome){
            FlashAttributesHandler.addFlashAttribute(session, "error", "revsubmit.doublesubmit", 10000, null, null);
            return false;
        }
        
        // ////////////////////////////////////
        // Calculate the revision coverage
        // ////////////////////////////////////
        
        List<String> reviewers = StatusUtils.getReviewerSubmit(s);
        ReviewerUtils ru = new ReviewerUtils(catalog, userService);
        
        s.setCoverage(ru.getSurveyCoverage(reviewers));
        s.setLastSurveyReview(System.currentTimeMillis());
        
        try {
            surveyService.changeStatus(s);
        } catch (BadRequestServiceEx e) {
            LOGGER.error(e.getMessage(), e);
        } catch (NotFoundServiceEx e) {
            LOGGER.error(e.getMessage(), e);
        }
        
        // /////////////////////
        // Submit the Survey
        // /////////////////////
        
        FlashAttributesHandler.addFlashAttribute(session, "success", "revsubmit.ok", 10000, null, null);
        return true; 
    }
    
    private boolean checkIfAllRevsHasSubmitted(String country, Status status){
        
        String revsListAsBlob = status.getReviewerSubmit();
        String [] revsList = (revsListAsBlob == null)?new String[]{}:revsListAsBlob.split(";");
        int reviewerHasBeenSubmitted = 0;
        // Ok seem that I'm crazy but often happens that empty elements appears in the rev list...
        // Don't trust of .length!!!
        for(String el : revsList){
            if(!el.isEmpty()){
                reviewerHasBeenSubmitted++;
            }
        }
        List<User> users = userService.getReviewersForSurveyAndQuestion(country, null);
        int totalReviewers = (users != null)?users.size():0; 
        return reviewerHasBeenSubmitted == totalReviewers;
    }
    
    private void sendMailToReviewerEditor(String country, HttpSession session, User user, Status status) throws IOException, TemplateException{
        //
        // Notify of the status changed with a mail to the Reviewer Editor
        //
        List<User> revEditors = userService.getUsersToNotify(Profile.EDITOR.toString().toLowerCase(), country, false);
        LOGGER.info("----------------- state transition: EDITOR NOTIFICATION AFTER LATEST REVIEWER SUBMISSION ---");
        LOGGER.info("----------------- Selected Users (Editors) to notify with Mail: ----------------------------");
        LOGGER.info(LoggingUtils.printUsernames(revEditors));
        LOGGER.info("--------------------------------------------------------------------------------------------");
        
        if (revEditors.size() <= 0) {
            LOGGER.error("No reviewer associated to country '" + country + "' The submit has been done correctly but anyone has been notificated, no mail sent");
            // TODO notify with mail this error to admin ???
            FlashAttributesHandler.addFlashAttribute(session, "warning", "reviewer.lastsubmission.notnotified", 10000, null, null);
        }
        notificationService.notifyReviewerSubmit(user, status, revEditors);
        
    }
    
}
