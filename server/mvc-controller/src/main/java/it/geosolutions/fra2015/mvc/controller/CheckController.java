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

import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.SurveyService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	@Autowired
    private SurveyService surveyService;
    
    @RequestMapping(method = RequestMethod.GET)
    public String printWelcome(ModelMap model) {
    		model.addAttribute("context", "check");
            //TODO add values for validation
            return "index";

    }
    @RequestMapping(method = RequestMethod.POST)
    public String printWelcome(HttpServletRequest request,ModelMap model,HttpSession session) {
    		User su = (User) session.getAttribute("sessionUser");
    		Status status = new Status();
    		status.setMessage((String) request.getAttribute("submitmessage"));
    		status.setCountry(su.getCountries());
    		status.setStatus("under review");
    		try {
				surveyService.changeStatus(status);
			} catch (BadRequestServiceEx e) {
				
			} catch (NotFoundServiceEx e) {
				
			}
            
            return "index";

    }
}
