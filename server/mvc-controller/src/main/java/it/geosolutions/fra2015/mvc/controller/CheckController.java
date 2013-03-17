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

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import it.geosolutions.fra2015.mvc.validation.Validator;
import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.SurveyService;
import it.geosolutions.fra2015.services.UserService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;
import it.geosolutions.fra2015.validation.ValidationResult;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Lorenzo Natali
 * 
 */
@Controller
@RequestMapping("/check")
public class CheckController {
    Logger LOGGER = Logger.getLogger(CheckController.class);
    
    @Autowired
    private SurveyService surveyService;
    @Autowired
    private UserService userService;

    @Autowired
    private Validator validator;

    @RequestMapping(method = RequestMethod.GET)
    public String printWelcome(ModelMap model, HttpSession session) {
        model.addAttribute("context", "check");
        User su = (User) session.getAttribute(SESSION_USER);
        if (su == null) {
            return "redirect:/";
        }

        ValidationResult v = validator.validate(su.getCountries());
        if (v.getSuccess()) {
            model.addAttribute("allowsubmit", true);
        } else {
            model.addAttribute("validationResult", v);
        }
        return "index";

    }

    @RequestMapping(method = RequestMethod.POST)
    public String printWelcome(HttpServletRequest request, ModelMap model, HttpSession session) {
        model.addAttribute("context", "check");
        model.addAttribute("messageType", "warning");
        // model.addAttribute("messageType","alert");// red background
        model.addAttribute("messageCode", "alert.notavailableservice");

        
        //

        User su = (User) session.getAttribute(SESSION_USER);
        Status status = new Status();
        status.setMessage((String) request.getAttribute("submitmessage"));
        status.setCountry(su.getCountries());
        status.setStatus("under review");
        Country c = surveyService.findCountryByISO3(su.getCountries());
        
        try {
            surveyService.changeStatus(status);
            surveyService.searchCountry(status.getCountry());
            LOGGER.info("submitted survey:"+status.getCountry());
            User filter =new User();
            
            filter.setRole("Reviewer");
            //filtering by country doesn't work yet
            filter.setCountriesSet(su.getCountriesSet());
            List<User> reviewers=  userService.getAll(null, null,filter );
            
            
            LOGGER.info(reviewers.size());
            
            // TODO mail the reviewers associated to the country
            
        } catch (BadRequestServiceEx e) {
            // TODO notify error
        } catch (NotFoundServiceEx e) {
            // TODO notify error
        }

        return "index";

    }
}
