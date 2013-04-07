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
import it.geosolutions.fra2015.mvc.concurrency.BasicConcurrencyHandler;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;
import it.geosolutions.fra2015.mvc.controller.utils.FlashAttributesHandler;
import it.geosolutions.fra2015.mvc.controller.utils.StatusUtils;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.utils.UserUtil;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@RequestMapping("/acceptance/accept/")
public class AcceptController{ 

    @Autowired
    private ControllerServices utils;

    
    @Autowired
    private BasicConcurrencyHandler concurencyHandler;
    
    private final Logger LOGGER = Logger.getLogger(AcceptController.class);
    

    
    @RequestMapping(method = RequestMethod.GET)
    public String handleGet(HttpServletRequest request, Model model,
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
        Status s = si.getStatus();
        if(StatusUtils.isCompleted(s)){
            utils.updateSurveyStatusAccepted(country);
            FlashAttributesHandler.addFlashAttribute(session, "success", "acceptance.success", null, null, null);
        }else{
            FlashAttributesHandler.addFlashAttribute(session, "error", "acceptance.error.notCompleted", 10000, null, null);
        }

        return "redirect:/acceptance/view/0";
    
    }


}
