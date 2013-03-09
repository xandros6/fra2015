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

import it.geosolutions.fra2015.entrypoint.model.CountryValues;
import it.geosolutions.fra2015.entrypoint.model.Update;
import it.geosolutions.fra2015.entrypoint.model.Updates;
import it.geosolutions.fra2015.mvc.controller.utils.ActivityLogUtils;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices;
import it.geosolutions.fra2015.mvc.controller.utils.VariableNameUtils;
import it.geosolutions.fra2015.server.model.user.User;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
    		@PathVariable(value = "question") String question, Model model,
            HttpSession session) {

        try{
            Integer.parseInt(question);
        }
        catch(Exception e){
            model.addAttribute("context", "survey");
            model.addAttribute("question", 0);
            session.invalidate();
            return "redirect:/login";
        }
        
        model.addAttribute("question", question);
        model.addAttribute("context", "survey");
        //TODO validate country
        User su = (User) session.getAttribute("sessionUser");
        //TODO check access to provide accessible questions for menu and allow to 
        // Set the parameter operationWR, the domain is "WRITE" "READ"
        model.addAttribute("operationWR", ControllerServices.OperationWR.READ.toString());
        utils.prepareHTTPRequest(model, question, utils.retrieveValues(question, country), false);
        
        return "reviewer";

    }

	@RequestMapping(value = "/survey/review/{country}/{question}", method = RequestMethod.POST)
	public String handlePost(HttpServletRequest request,
			@PathVariable(value = "country") String country,
			@PathVariable(value = "country") String question,
			HttpSession session, Model model) {
		//TODO manage feedbacks
		return "reviewer";

	}
}
