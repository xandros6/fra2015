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

import it.geosolutions.fra2015.mvc.model.Pagination;
import it.geosolutions.fra2015.server.model.survey.ActivityLogEntry;
import it.geosolutions.fra2015.services.SurveyActivityLog;
import it.geosolutions.fra2015.services.SurveyService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;

import it.geosolutions.fra2015.services.model.ActivityLogFilter;
import java.util.List;

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
 * @author Lorenzo Natali
 * 
 */
@Controller
@RequestMapping("/revieweractivitylog")
@SessionAttributes("logFilter")
public class ReviewerActivityLog {

	protected static Logger logger = Logger.getLogger(AdminActivityLog.class);
	
	private int pagesize = 10;
	
    @Autowired
    private SurveyActivityLog sal;

	@Autowired
	private SurveyService surveyService;
    
    @RequestMapping(value = "")
    public String handleGet(ModelMap model) {        
    	return "redirect:/adminactivitylog/0";
    }
    
    @RequestMapping(value = "/filter", method = RequestMethod.POST)
	public String updateFilter(@ModelAttribute("logFilter") ActivityLogFilter logFilter, ModelMap model , SessionStatus sessionStatus) {
		model.addAttribute("logFilter", logFilter);
		return "forward:/adminactivitylog/0";
	}
	
	@RequestMapping(value = "/filter", method = RequestMethod.GET)
	public String reloadFilter(ModelMap model , SessionStatus sessionStatus) {
		return "redirect:/adminactivitylog/0";
	}
    
    @RequestMapping(value = "/{page}")
	public String getLogPage(@PathVariable(value = "page") int page,
			ModelMap model) {
    	ActivityLogFilter logFilter = (ActivityLogFilter) model.get("logFilter");
		//add context for view
		//model.addAttribute("countries", surveyService.getCountries());
		//model.addAttribute("context", "users");
		List<ActivityLogEntry> activityLogList = this.getPage(page, logFilter);
		if(activityLogList.isEmpty() && page > 0){
			return "redirect:/adminactivitylog/"+(page-1);
		}
		model.addAttribute("page", page);
		//check prev and next pages presence
		long totalLog = 0;
		try {
			totalLog = sal.getCountFiltered(logFilter);
		}catch (BadRequestServiceEx e) {
			logger.error(e.getMessage(), e);
		}
		int totalPage = (int) (Math.ceil(((double)totalLog)/pagesize));
		Pagination pagination = new Pagination();
		pagination.setCurrentPage(page);
		if((page+1) < totalPage){
			pagination.setLastPage(totalPage);
		}
		if((page+1)*pagesize < totalLog){
			pagination.setNext1(page+1);
		}
		if((page+2)*pagesize < totalLog){
			pagination.setNext2(page+2);
		}
		if(page > 0 ){
			pagination.setFirstPage(0);
			pagination.setPrev1(page-1);
		}
		if((page-1) > 0 ){
			pagination.setPrev2(page-2);
		}
		logFilter = (model.get("logFilter")!=null ?  (ActivityLogFilter) model.get("logFilter") : new ActivityLogFilter());
		model.addAttribute("countries", surveyService.getCountries());
		model.addAttribute("logFilter", logFilter);
		model.addAttribute("context", "activitylog");
		model.addAttribute("pagination", pagination);
		model.addAttribute("activityLogList", activityLogList);
		return "admin";
	}
    
	private List<ActivityLogEntry> getPage(int page, ActivityLogFilter userFilter) {
		try {
			return sal.getAll(page, pagesize,userFilter);
		} catch (BadRequestServiceEx e) {
			logger.error(e.getMessage(), e);
		}
		return null;

	}
	
    /**
     * @return the sal
     */
    public SurveyActivityLog getSal() {
        return sal;
    }

    /**
     * @param sal the sal to set
     */
    public void setSal(SurveyActivityLog sal) {
        this.sal = sal;
    }

}
