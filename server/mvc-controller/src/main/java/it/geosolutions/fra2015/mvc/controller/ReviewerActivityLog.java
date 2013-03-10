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

import it.geosolutions.fra2015.server.model.survey.ActivityLogEntry;
import it.geosolutions.fra2015.services.SurveyActivityLog;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
@RequestMapping("/revieweractivitylog")
public class ReviewerActivityLog {

    private static int page = 1;
    private static int entries = 2;
    
    
    @Autowired
    private SurveyActivityLog sal;

    @RequestMapping(method = RequestMethod.GET)
    public String handleGet(HttpServletRequest request, ModelMap model) {
        
        request.getAttribute("uu");
        model.addAttribute("context", "activitylog");
        List<ActivityLogEntry> l = sal.findByEntryItemName("ALB", "0", 1, 3);
        model.addAttribute("activityLogList", l);
        return "reviewer";

    }

    @RequestMapping(method = RequestMethod.POST)
    public String handlePost(HttpServletRequest request, ModelMap model) {
        
        String filter = request.getParameter("filter");
        filter = (filter != null)?filter:"";
        List<ActivityLogEntry> l = null;
        String c = request.getParameter("country");
        if(filter.equals("f1")){
            Long t1 = 0l;
            Long t2 = 0l;
            try{
                Long.parseLong(request.getParameter("t1"));
                Long.parseLong(request.getParameter("t2"));
            }
            catch(Exception e){
                throw new IllegalArgumentException("reviewerActivitylog: wrong parameter...");
            }
            l = sal.findByTimeInterval(c, t1, t2, page, entries);
        }else if(filter.equals("f2")){
            String username = request.getParameter("username");
            String question = request.getParameter("question");
            l = sal.findByQuestionAndUsername(c, question, username, page, entries);
        }else if(filter.equals("f3")){
            String country = request.getParameter("country");
            String entryItemName = request.getParameter("entryitemname");            
            l = sal.findByEntryItemName(country, entryItemName, page, entries);
        }else{
            throw new IllegalArgumentException("reviewerActivitylog: wrong parameter...");
        }
        model.addAttribute("context", "activitylog");
        model.addAttribute("activityLogList", l);
        return "reviewer";

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
