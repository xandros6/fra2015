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

import static it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.SURVEY_INSTANCES;
import freemarker.template.TemplateException;
import it.geosolutions.fra2015.mvc.concurrency.BasicConcurrencyHandler;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;
import it.geosolutions.fra2015.mvc.controller.utils.FlashAttributesHandler;
import it.geosolutions.fra2015.mvc.controller.utils.StatusUtils;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.UserService;
import it.geosolutions.fra2015.services.mail.NotificationSerivice;
import it.geosolutions.fra2015.services.utils.UserUtil;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Lorenzo Natali
 * 
 * This is the Country Acceptance controller for acceptance 
 * 
 * 
 */
@Controller
public class AcceptController{ 

    @Autowired
    private ControllerServices utils;
    
    @Autowired
    private NotificationSerivice notificationService;

    @Autowired
    private UserService userService;
    private final Logger LOGGER = Logger.getLogger(AcceptController.class);
    
    @RequestMapping(value ="/acceptance/accept/",method = RequestMethod.GET)
    public String handleAccept(HttpServletRequest request, Model model,
            HttpSession session) {

        model.addAttribute("context","surveylist");
        User su = (User) session.getAttribute("sessionUser");
        if (su == null) {
            return "redirect:/login";
        }
        if(!Profile.VALIDATOR.toString().equalsIgnoreCase(su.getRole())){
            return "redirect:/";
        }
        String country =UserUtil.getSingleIso3(su);
        Map<String, SurveyInstance> surveyInstanceMap = (Map<String, SurveyInstance>) session
                .getAttribute(SURVEY_INSTANCES);
        SurveyInstance si = surveyInstanceMap.get(country);
        // Update the status in surveyIstance
        si.setStatus(utils.getStatusInstanceByCountry(country));
        
        Status s = si.getStatus();
        if(StatusUtils.isCompleted(s)){
            doAcceptance(country);
            LOGGER.info("The Country Acceptace has now accepted the survey. The status for survey '" + country + "' is Completed");
        }else{
            FlashAttributesHandler.addFlashAttribute(session, "error", "acceptance.error.notCompleted", 10000, null, null);
            LOGGER.info("Errors has occurred while Accept process run for country: '" + country + "'");
        }

        return "redirect:/acceptance/view/0";
    
    }
    @RequestMapping(value ="/acceptance/decline/",method = RequestMethod.POST)
    public String handleDecline(HttpServletRequest request, Model model,
            HttpSession session) {

        model.addAttribute("context","surveylist");
        User su = (User) session.getAttribute("sessionUser");
        if (su == null) {
            return "redirect:/login";
        }
        if(!Profile.VALIDATOR.toString().equalsIgnoreCase(su.getRole())){
            return "redirect:/";
        }
        String country =UserUtil.getSingleIso3(su);
        Map<String, SurveyInstance> surveyInstanceMap = (Map<String, SurveyInstance>) session
                .getAttribute(SURVEY_INSTANCES);
        SurveyInstance si = surveyInstanceMap.get(country);
        // Update the status in surveyIstance
        si.setStatus(utils.getStatusInstanceByCountry(country));
        Status s = si.getStatus();
        String message = request.getParameter("message");
        if(StatusUtils.isCompleted(s)||StatusUtils.isAccepted(s)){
            doDecline(su,country,message,model,session);
       }else{
            FlashAttributesHandler.addFlashAttribute(session, "error", "acceptance.error.decline.notCompleted", 10000, null, null);
            LOGGER.info("Errors has occurred while Accept process run for country: '" + country + "'");
        }//message error acceptance.error.decline.notNotified 

        return "redirect:/acceptance/view/0";
    
    }



    private void doDecline(User su, String country, String message,Model model,HttpSession session) {
        //TODO send mails, notify errors 
        utils.updateSurveyStatusUnderReview(country,message);
        Status s = utils.getStatusInstanceByCountry(country);
        s.setCountry(country);
        notifyEditors(su,s,session);
        
    }
    
    private void notifyEditors(User su, Status status, HttpSession session) {
        String iso3 = status.getCountry();
        List<User> editors = userService.getUsersToNotify("editor", iso3);

        if (editors.size() <= 0) {
            LOGGER.error("No reviewer associated to country " + iso3);
            // TODO notify someone this error

        }
        try {
            notificationService.notifyDecline(su, status, editors);
            
            String country = status.getCountry();
            FlashAttributesHandler.addFlashAttribute(session, "success", "acceptance.decline.success", null, null, null);
            LOGGER.info("The Country Acceptance has now rejected the survey. The status for survey '" + country + "' is UnderReview");
            FlashAttributesHandler.addFlashAttribute(session, "success", "acceptance.success", null, null, null);

        } catch (MailException e) {
            FlashAttributesHandler.addFlashAttribute(session, "warning", "acceptance.error.decline.notNotified", 10000, null, null);

            LOGGER.error(
                    "The editor were not notified of the message submit because of an Mail Exception",
                    e);
        } catch (TemplateException e) {
            FlashAttributesHandler.addFlashAttribute(session, "warning", "acceptance.error.decline.notNotified", 10000, null, null);
            LOGGER.error(
                    "The editor were not notified of the message submit because of an Mail Exception",
                    e);
        } catch (IOException e) {
            FlashAttributesHandler.addFlashAttribute(session, "warning", "acceptance.error.decline.notNotified", 10000, null, null);
            LOGGER.error(
                    "The editor were not notified of the message submit because of an Mail Exception",
                    e);
        }
    }
    
    
    private void doAcceptance(String country) {
        //TODO all the stuff to do in acceptance
        utils.updateSurveyStatusAccepted(country);
        
    }


}
