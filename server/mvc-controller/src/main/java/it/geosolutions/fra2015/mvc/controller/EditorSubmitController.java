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

import static it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.SESSION_USER;
import freemarker.template.TemplateException;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;
import it.geosolutions.fra2015.mvc.controller.utils.FlashAttributesHandler;
import it.geosolutions.fra2015.mvc.controller.utils.StatusUtils;
import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.SurveyService;
import it.geosolutions.fra2015.services.UserService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;
import it.geosolutions.fra2015.services.mail.NotificationSerivice;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author DamianoG
 * 
 * This class expose 2 SpringMVC controllers that are responsible for the state transition between UNDERREVIEW to COMPLETE/PENDINGFIX
 * These controllers should be invoked just from the surveylist page by a ReviewerEditor
 * 
 */
@Controller
public class EditorSubmitController {

    private static final Logger LOGGER = Logger.getLogger(EditorSubmitController.class);
    
    @Autowired
    private SurveyService surveyService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private NotificationSerivice notificationService;
    
    /**
     * This Method is responsible for change the status of the survey from UNDERREVIEW to PENDINGFIX
     * 
     * -> Change the survey status on DB (if it is allowed) from UNDERREVIEW to PENDINGFIX
     * -> Notify all the contributors involved 
     * 
     * @param country
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "/editorPendingFix/{countryIso3}", method = RequestMethod.GET)
    public String editorPendingFix(@PathVariable(value = "countryIso3") String country,
            ModelMap model, HttpSession session) {

        User user = (User) session.getAttribute(SESSION_USER);
        if (user == null) {

            return "redirect:/";
        }
        
        //
        // Check the status of the survey: 
        //    if (change status is allowed) then Set the status=pendingFix
        //                                  else display an error message to the user
        //
        
        //check status
        String iso3 = country;
        Status status = surveyService.getStatus(iso3);
        if(!StatusUtils.isSubmitAllowedByReviewerEditor(status)){
            LOGGER.warn("A reviewerEditor has tried to change the status for country '" + iso3 + "' but the survey status is not set to 'underreview' at this moment");
            FlashAttributesHandler.addFlashAttribute(session, "error", "editor.surveylist.submitFailed", 10000, null, null);
            LOGGER.error("Survey can't be submitted now");
            return "redirect:/surveylist/0";
        }
        //change status
        status.setStatus(StatusUtils.PENDING_FIX);
        status.setCountry(iso3);
        status.setReviewerSubmit("");
        status.setCoverage("");
        StatusUtils.updateRevision(status);
        Country c = surveyService.findCountryByISO3(iso3);
        if(c!=null){
            status.setCountry(iso3);
        }
        try {
            surveyService.changeStatus(status);
        } catch (BadRequestServiceEx e) {
            LOGGER.error("Error -1- while changing status to pendingfix. " + e.getMessage(), e);
            FlashAttributesHandler.addFlashAttribute(session, "error", "editor.pendingfix.error", 10000, null, null);
            return "redirect:/surveylist/0";
        } catch (NotFoundServiceEx e) {
            LOGGER.error("Error -2- while changing status to pendingfix. " + e.getMessage(), e);
            FlashAttributesHandler.addFlashAttribute(session, "error", "editor.pendingfix.error", 10000, null, null);
            return "redirect:/surveylist/0";
        }
        LOGGER.info("Submission for survey: '" + status.getCountry() + "' has been succesful. The transition done is UNDERREVIEW->PENDINGFIX");
        
        //
        // Notify of the status changed with a mail to all Contributors involved
        //
        List<User> contributors = userService.getUsersToNotify(Profile.CONTRIBUTOR.toString().toLowerCase(), iso3 );
        if (contributors.size() <= 0) {
            LOGGER.error("No reviewer associated to country '" + iso3 + "' The submit has been done correctly but anyone has been notificated, no mail sent");
            // TODO notify with mail this error to admin ???
            FlashAttributesHandler.addFlashAttribute(session, "warning", "editor.pendingfix.notnotified", 10000, null, null);
        }
        try {
            notificationService.notifyPendingFix(user, status, contributors);
        } catch (MailException e) {
            FlashAttributesHandler.addFlashAttribute(session, "warning", "editor.pendingfix.notnotified",
                    10000, null, null);
            LOGGER.error("Error in mail notification (pending fixes) ",e);
            return "redirect:/surveylist/0";

        } catch (TemplateException e) {
            FlashAttributesHandler.addFlashAttribute(session, "warning", "editor.pendingfix.notnotified",
                    10000, null, null);
            LOGGER.error("Error in mail notification (pending fixes) ",e);
            return "redirect:/surveylist/0";

        } catch (IOException e) {
            FlashAttributesHandler.addFlashAttribute(session, "warning", "editor.pendingfix.notnotified",
                    10000, null, null);
            LOGGER.error("Error in mail notification (pending fixes) ",e);
            return "redirect:/surveylist/0";
        }
        
        LOGGER.info("The survey status-changed notification for survey: '" + status.getCountry() + "' has been done.");
        FlashAttributesHandler.addFlashAttribute(session, "success", "editor.pendingfix.notified", 10000, null, null);
        
        return "redirect:/surveylist/0";

    }

    /**
     * This Method is responsible for change the status of the survey from UNDERREVIEW to COMPLETED
     * 
     * -> Change the survey status on DB (if it is allowed) from UNDERREVIEW to COMPLETED
     * -> Notify all the validators involved 
     * 
     * @param country
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "/editorCompleted/{countryIso3}", method = RequestMethod.GET)
    public String editorCompleted(@PathVariable(value = "countryIso3") String country,
            ModelMap model, HttpSession session) {

        User user = (User) session.getAttribute(SESSION_USER);
        if (user == null) {

            return "redirect:/";
        }
        
        //
        // Check the status of the survey: 
        //    if (change status is allowed) then Set the status=completed
        //                                  else display an error message to the user
        //
        
        //check status
        String iso3 = country;
        Status status = surveyService.getStatus(iso3);
        if(!StatusUtils.isSubmitAllowedByReviewerEditor(status)){
            LOGGER.warn("A reviewerEditor has tried to change the status for country '" + iso3 + "' but the survey status is not set to 'underreview' at this moment");
            FlashAttributesHandler.addFlashAttribute(session, "error", "editor.surveylist.submitFailed", 10000, null, null);
            return "redirect:/surveylist/0";
        }
        //change status
        status.setStatus(StatusUtils.COMPLETED);
        status.setCountry(iso3);
        status.setReviewerSubmit("");
        status.setCoverage("");
        Country c = surveyService.findCountryByISO3(iso3);
        if(c!=null){
            status.setCountry(iso3);
        }
        try {
            surveyService.changeStatus(status);
        } catch (BadRequestServiceEx e) {
            LOGGER.error("Error -1- while changing status to complete. " + e.getMessage(), e);
            FlashAttributesHandler.addFlashAttribute(session, "error", "editor.complete.error", 10000, null, null);
            return "redirect:/surveylist/0";
        } catch (NotFoundServiceEx e) {
            LOGGER.error("Error -2- while changing status to complete. " + e.getMessage(), e);
            FlashAttributesHandler.addFlashAttribute(session, "error", "editor.complete.error", 10000, null, null);
            return "redirect:/surveylist/0";
        }
        LOGGER.info("Submission for survey: '" + status.getCountry() + "' has been succesful. The transition done is UNDERREVIEW->COMPLETED");

        //
        // Notify of the status changed with a mail to all Validators involved
        //
        List<User> validators = userService.getUsersToNotify(Profile.VALIDATOR.toString().toLowerCase(), iso3 );
        if (validators.size() <= 0) {
            LOGGER.error("No reviewer associated to country '" + iso3 + "' The submit has been done correctly but anyone has been notificated, no mail sent");
            // TODO notify with mail this error to admin ???
            FlashAttributesHandler.addFlashAttribute(session, "warning", "editor.complete.notnotified", 10000, null, null);
        }
        try {
            notificationService.notifyComplete(user, status, validators);
        } catch (MailException e) {
            FlashAttributesHandler.addFlashAttribute(session, "warning", "editor.complete.notnotified",
                    10000, null, null);
            LOGGER.error("Error in mail notification (submit) ",e);
            return "redirect:/surveylist/0";

        } catch (TemplateException e) {
            FlashAttributesHandler.addFlashAttribute(session, "warning", "editor.complete.notnotified",
                    10000, null, null);
            LOGGER.error("Error in mail notification (submit) ",e);
            return "redirect:/surveylist/0";

        } catch (IOException e) {
            FlashAttributesHandler.addFlashAttribute(session, "warning", "editor.complete.notnotified",
                    10000, null, null);
            LOGGER.error("Error in mail notification (submit) ",e);
            return "redirect:/surveylist/0";
        }

        LOGGER.info("The survey status-changed notification for survey: '" + status.getCountry() + "' has been done.");
        FlashAttributesHandler.addFlashAttribute(session, "success", "editor.complete.notified", 10000, null, null);

        return "redirect:/surveylist/0";

    }

}
