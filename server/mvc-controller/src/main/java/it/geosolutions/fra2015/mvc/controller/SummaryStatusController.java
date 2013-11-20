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

import it.geosolutions.fra2015.entrypoint.SurveyServiceEntryPoint;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;
import it.geosolutions.fra2015.mvc.model.Pagination;
import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.exception.InternalErrorServiceEx;
import it.geosolutions.fra2015.services.utils.UserUtil;

import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Tobia Di Pisa at tobia.dipisa@geo-solutions.it
 * 
 */
@Controller
public class SummaryStatusController {

    @Autowired
    private SurveyServiceEntryPoint surveyService;

	private int pagesize = 20;

    Logger LOGGER = Logger.getLogger(SummaryStatusController.class);

    /**
     * Gets latest checksum for each country. Shows:
     *  * Country Name
     *  * Latest Contributor Submit
     *  * Latest Reviewer Submit
     *  * Latest Pending Fix Submit
     *  * Latest Acceptance Request
     *  * Current Status
     * 
     * @param model
     * @param session
     * @return String
     * @throws IllegalArgumentException
     * @throws InternalErrorServiceEx
     */
    @RequestMapping(value = "/summaryStatus/{page}", method = RequestMethod.GET)
    public String printWelcome(@PathVariable(value = "page") int page, Model model,
            HttpSession session, Locale locale) throws IllegalArgumentException, InternalErrorServiceEx {
    	model.addAttribute("context", "summaryStatus");
    	
    	User user = (User) session.getAttribute("sessionUser");
        if (user == null) {
            return "redirect:/login";
        }
        
        String[] countries = null;
        
        if(user.getRole().equalsIgnoreCase(Profile.ADMIN.toString())){
        	List<Country> countriesList = surveyService.getCountries();
        	
        	countries = new String[countriesList.size()];
        	Iterator<Country> iterator = countriesList.iterator();
        	
        	int i = 0;
        	while(iterator.hasNext()){
        		Country ctry = (Country)iterator.next();
        		
        		if(ctry != null){
        			String ctryIso3 = ctry.getIso3();
        			countries[i] = ctryIso3;
        		}
        		
        		i++;
        	}
        }else{
        	countries = UserUtil.getIso3Array(user);
        }
        
        String countryName = "name_" + locale;
        List<SurveyInstance> surveys = surveyService.getSurveysByCountry(countries, page, pagesize, countryName);
        
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
			pagination.setLastPage(totalPage-1);
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
        
        if (user.getRole().equalsIgnoreCase(Profile.ADMIN.toString())) {
        	return "admin";
        } else if (user.getRole().equalsIgnoreCase(Profile.EDITOR.toString())) {
        	return "editor";
        } else if (user.getRole().equalsIgnoreCase(Profile.REVIEWER.toString())) {
        	return "reviewer";
        } else {
        	return "redirect:/login";
        }
    }    
}
