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
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;
import it.geosolutions.fra2015.mvc.controller.utils.FlashAttributesHandler;
import it.geosolutions.fra2015.mvc.controller.utils.StatusUtils;
import it.geosolutions.fra2015.mvc.model.Pagination;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.utils.UserUtil;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Lorenzo Natali
 * @author Tobia Di Pisa at tobia.dipisa@geo-solutions.it
 * 
 */
@Controller
public class SurveyListController {
	@Autowired
	private ControllerServices utils;
	
	private int pagesize = 15;
	
	 @RequestMapping(value = "/surveylist/{page}", method = RequestMethod.GET)
	public String printWelcome(@PathVariable(value = "page") int page, Model model, HttpSession session, Locale locale) {
		model.addAttribute("context", "surveylist");

		User user = (User) session.getAttribute(SESSION_USER);
		String targetPage = "";
		if (user==null){
		    return "/";
		}
		if(user.getRole().equalsIgnoreCase(Profile.EDITOR.toString())){
		    targetPage = "editor";
		}
		else if(user.getRole().equalsIgnoreCase(Profile.REVIEWER.toString())){
		    targetPage = "reviewer";
                }
		else{
		    targetPage= "redirect:/";
		}
		
		FlashAttributesHandler.copyToModel(session, model);
		
		String[] countries = UserUtil.getIso3Array(user);
		
        String countryName = "name_" + locale;
        List<SurveyInstance> surveys = utils.retriveSurveyListByCountries(countries, page, pagesize, countryName);
		
		model.addAttribute("surveys", surveys);
		
		// /////////////////////////////////////
		// Check prev and next pages presence
		// /////////////////////////////////////
		long totalCountries = 0;
		if(user.getRole().equalsIgnoreCase(Profile.ADMIN.toString())){
			totalCountries = countries.length;
		}else{
			totalCountries = user.getCountriesSet().size();
		}

		int totalPage = (int) (Math.ceil(((double)totalCountries)/pagesize));
		Pagination pagination = new Pagination();
		pagination.setCurrentPage(page);
		
		if((page+1) < totalPage){
			pagination.setLastPage(totalPage);
		}
		if((page+1)*pagesize < totalCountries){
			pagination.setNext1(page+1);
		}
		if((page+2)*pagesize < totalCountries){
			pagination.setNext2(page+2);
		}
		if(page > 0 ){
			pagination.setFirstPage(0);
			pagination.setPrev1(page-1);
		}
		if((page-1) > 0 ){
			pagination.setPrev2(page-2);
		}
		
		model.addAttribute("pagination", pagination);		
		model.addAttribute("allowedsubmitstatus",StatusUtils.UNDER_REVIEW);
		model.addAttribute("profile", ControllerServices.Profile.CONTRIBUTOR.toString());
		model.addAttribute("username", user.getName());
		
		return targetPage;

	}
}
