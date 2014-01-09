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
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;
import it.geosolutions.fra2015.mvc.model.Pagination;
import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.exception.InternalErrorServiceEx;
import it.geosolutions.fra2015.services.model.CountryFilter;
import it.geosolutions.fra2015.services.utils.UserUtil;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

/**
 * @author Tobia Di Pisa at tobia.dipisa@geo-solutions.it
 * 
 */
@Controller
@RequestMapping("/summaryStatus")
@SessionAttributes("summaryFilter")
public class SummaryStatusController {

    @Autowired
    private SurveyServiceEntryPoint surveyService;
    
	@Autowired
	private ControllerServices utils;

	private int pagesize = 20;

    Logger LOGGER = Logger.getLogger(SummaryStatusController.class);

	public class SurveyInstanceExt{
		
	    public Long id;
	    
	    public Status status;
	    
	    public Country country;
	    
	    public String reviewerSubmissions;
	    
		/**
		 * @param id
		 * @param status
		 * @param country
		 * @param reviewerSubmissions
		 */
		public SurveyInstanceExt(Long id, Status status, Country country,
				String reviewerSubmissions) {
			super();
			this.id = id;
			this.status = status;
			this.country = country;
			this.reviewerSubmissions = reviewerSubmissions;
		}

		/**
		 * @return the id
		 */
		public Long getId() {
			return id;
		}

		/**
		 * @param id the id to set
		 */
		public void setId(Long id) {
			this.id = id;
		}

		/**
		 * @return the status
		 */
		public Status getStatus() {
			return status;
		}

		/**
		 * @param status the status to set
		 */
		public void setStatus(Status status) {
			this.status = status;
		}

		/**
		 * @return the country
		 */
		public Country getCountry() {
			return country;
		}

		/**
		 * @param country the country to set
		 */
		public void setCountry(Country country) {
			this.country = country;
		}

		/**
		 * @return the reviewerSubmissions
		 */
		public String getReviewerSubmissions() {
			return reviewerSubmissions;
		}

		/**
		 * @param reviewerSubmissions the reviewerSubmissions to set
		 */
		public void setReviewerSubmissions(String reviewerSubmissions) {
			this.reviewerSubmissions = reviewerSubmissions;
		}

	}

    /**
     * @param summaryFilter
     * @param model
     * @param sessionStatus
     * @return String
     */
    @RequestMapping(value = "/filter", method = RequestMethod.POST)
	public String updateFilter(@ModelAttribute("summaryFilter") CountryFilter summaryFilter, ModelMap model , SessionStatus sessionStatus) {
		model.addAttribute("summaryFilter", summaryFilter);
		return "forward:/summaryStatus/0";
	}
	
	/**
	 * @param model
	 * @param sessionStatus
	 * @return String
	 */
	@RequestMapping(value = "/filter", method = RequestMethod.GET)
	public String reloadFilter(ModelMap model , SessionStatus sessionStatus) {
		return "redirect:/summaryStatus/0";
	}
	
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
    @RequestMapping(value = "/{page}")
    public String getStausPage(@PathVariable(value = "page") int page, ModelMap model,
            HttpSession session, Locale locale) throws IllegalArgumentException, InternalErrorServiceEx {
    	
    	model.addAttribute("context", "summaryStatus");
    	
    	User user = (User) session.getAttribute("sessionUser");
        if (user == null) {
            return "redirect:/login";
        }
        
        CountryFilter summaryFilter = (CountryFilter) model.get("summaryFilter");
         
        String[] countries = null;
        if(summaryFilter != null && summaryFilter.getCountry() != null && !summaryFilter.getCountry().isEmpty()){
        	countries = new String[1];
        	countries[0] = summaryFilter.getCountry();
        }else{        	
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
        }
        
        String countryName = "name_" + locale;
        List<SurveyInstance> surveys = surveyService.getSurveysByCountry(countries, page, pagesize, countryName);
        
        if(user.getRole().equalsIgnoreCase(Profile.EDITOR.toString())){
        	// /////////////////////////////////////////////////
        	// Calculate a list with reviewer submissions stats
        	// /////////////////////////////////////////////////
        	List<SurveyInstanceExt> surveyExtList = surveyInstanceToSurveyInstanceExt(surveys);
        	model.addAttribute("surveys", surveyExtList);
        }else{
    		model.addAttribute("surveys", surveys);
        }
        
        summaryFilter = (model.get("summaryFilter") != null ? (CountryFilter) model.get("summaryFilter") : new CountryFilter());
		model.addAttribute("summaryFilter", summaryFilter);
		
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
		
		String country = summaryFilter.getCountry();
		if(country != null && !country.isEmpty()){
			model.addAttribute("paginationEnable", false);
		}else{
			model.addAttribute("paginationEnable", true);
			model.addAttribute("pagination", pagination);
		}
		
		model.addAttribute("countries", surveyService.getCountries());
        
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
    
	/**
	 * @param surveys
	 * @return List<SurveyInstanceExt>
	 */
	private List<SurveyInstanceExt> surveyInstanceToSurveyInstanceExt(List<SurveyInstance> surveys){
		
		List<SurveyInstanceExt> list = new ArrayList<SurveyInstanceExt>();
		
		Iterator<SurveyInstance> iterator = surveys.iterator();
		while(iterator.hasNext()){
			SurveyInstance sInstance = iterator.next();
			
			List<User> reviewerList = utils.getUsersForCountry(sInstance.getCountry().getIso3(), "reviewer");	
			Status status = sInstance.getStatus();
			String reviewerSubmit = status.getReviewerSubmit();
			
			long revsSubmitLenght = 0;
			if(reviewerSubmit != null && !reviewerSubmit.isEmpty()){
				String[] revsSubmit = reviewerSubmit.split(";");
				
				for(int i=0; i<revsSubmit.length; i++){
					if(revsSubmit[i] != null && !revsSubmit[i].isEmpty()){
						revsSubmitLenght++;
					}
				}
			}

    		String reviewerSubmissions = revsSubmitLenght + "/" + reviewerList.size(); 
    		
    		SurveyInstanceExt surveyInstanceExt = new SurveyInstanceExt(sInstance.getId(), 
    				sInstance.getStatus(), sInstance.getCountry(), reviewerSubmissions);
    		
    		list.add(surveyInstanceExt);
		}
		
		return list;
	}
}
