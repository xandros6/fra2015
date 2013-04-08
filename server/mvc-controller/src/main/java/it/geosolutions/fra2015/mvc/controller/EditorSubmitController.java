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
import it.geosolutions.fra2015.mvc.controller.utils.FlashAttributesHandler;
import it.geosolutions.fra2015.mvc.controller.utils.StatusUtils;
import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.SurveyService;
import it.geosolutions.fra2015.services.UserService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;
import it.geosolutions.fra2015.services.utils.UserUtil;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author DamianoG
 * 
 */
@Controller
public class EditorSubmitController {

    private static final Logger LOGGER = Logger.getLogger(EditorSubmitController.class);
    
    @Autowired
    private SurveyService surveyService;
    
    @Autowired
    private UserService userService;
    
    @RequestMapping(value = "/editorPendingFix/{countryIso3}", method = RequestMethod.GET)
    public String editorPendingFix(@PathVariable(value = "countryIso3") String country,
            ModelMap model, HttpSession session) {

        User user = (User) session.getAttribute(SESSION_USER);
        if (user == null) {

            return "redirect:/";
        }
        
        //check status
        String iso3 = UserUtil.getSingleIso3(user);
        Status status = surveyService.getStatus(iso3);
        if(!StatusUtils.isSubmitAllowedByReviewerEditor(status)){
            FlashAttributesHandler.addFlashAttribute(session, "error", "editor.surveylist.submitFailed", 10000, null, null);
            return "redirect:/surveylist/0";
        }
        status.setStatus(StatusUtils.PENDING_FIX);
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
            LOGGER.error(e.getMessage(), e);
        } catch (NotFoundServiceEx e) {
            LOGGER.error(e.getMessage(), e);
        }
        LOGGER.info("submitted survey:"+status.getCountry());

        //TODO Which user must be notified? 
        //List<User> reviewers=  userService.getUsersToNotify("reviewer", iso3 );
        
        FlashAttributesHandler.addFlashAttribute(session, "success", "editor.surveylist.submitSuccess", 10000, null, null);
        return "redirect:/surveylist/0";

    }

    @RequestMapping(value = "/editorCompleted/{countryIso3}", method = RequestMethod.GET)
    public String editorCompleted(@PathVariable(value = "countryIso3") String country,
            ModelMap model, HttpSession session) {

        User user = (User) session.getAttribute(SESSION_USER);
        if (user == null) {

            return "redirect:/";
        }
        
      //check status
        String iso3 = UserUtil.getSingleIso3(user);
        Status status = surveyService.getStatus(iso3);
        if(!StatusUtils.isSubmitAllowedByReviewerEditor(status)){
            FlashAttributesHandler.addFlashAttribute(session, "error", "editor.surveylist.submitFailed", 10000, null, null);
            return "redirect:/surveylist/0";
        }
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
            LOGGER.error(e.getMessage(), e);
        } catch (NotFoundServiceEx e) {
            LOGGER.error(e.getMessage(), e);
        }
        LOGGER.info("submitted survey:"+status.getCountry());

        //TODO Which user must be notified? 
        //List<User> reviewers=  userService.getUsersToNotify("reviewer", iso3 );

        FlashAttributesHandler.addFlashAttribute(session, "success", "editor.surveylist.submitSuccess", 10000, null, null);
        return "redirect:/surveylist/0";

    }

}
