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
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices;
import it.geosolutions.fra2015.mvc.controller.utils.FlashAttributesHandler;
import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.utils.UserUtil;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Lorenzo Natali
 * 
 */
@Controller
public class SurveyListController {
	@Autowired
	private ControllerServices utils;
	
	 @RequestMapping(value = "/surveylist/{page}", method = RequestMethod.GET)
	public String printWelcome(@PathVariable(value = "page") int page,Model model, HttpSession session) {
		model.addAttribute("context", "surveylist");

		User su = (User) session.getAttribute(SESSION_USER);
		if (su==null){
		    return "redirect:login";
		}
		
		FlashAttributesHandler.copyToModel(session, model);
		
		String[] countries = UserUtil.getIso3Array(su);
		List<SurveyInstance> surveys=utils.retriveSurveyListByCountries(countries, page, 10);
		//quick trick, because there is no filtering here 
		model.addAttribute("prev",page >0);
		boolean next = utils.retriveSurveyListByCountries(countries, page+1, 10).size()>0;
		model.addAttribute("next",next);
		model.addAttribute("surveys",surveys);
		model.addAttribute("page",page);
		model.addAttribute("profile", ControllerServices.Profile.CONTRIBUTOR.toString());
		return "reviewer";

	}
}
