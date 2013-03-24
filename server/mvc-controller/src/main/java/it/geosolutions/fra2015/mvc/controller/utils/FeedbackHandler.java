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
package it.geosolutions.fra2015.mvc.controller.utils;

import static it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.FEEDBACK;
import static it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.SESSION_USER;
import static it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.SURVEY_INSTANCES;
import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.server.model.survey.Feedback;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.FeedbackService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.list.UnmodifiableList;
import org.apache.cxf.common.util.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.ui.Model;

import com.ibm.wsdl.util.IOUtils;

/**
 * Hold the feedback management: take as input the req and session objects, build a Feedback Instance and add to a feedback list 
 * 
 * @author DamianoG
 *
 */
public class FeedbackHandler{
    
    private final Logger LOGGER = Logger.getLogger(FeedbackHandler.class);
    
    private ControllerServices controllerServiceUtils;
    
    private FeedbackService feedbackService;
    
    private List<Feedback> feedbackList;
    
    public FeedbackHandler(ControllerServices controllerServiceUtils, FeedbackService feedbackService){
        
        this.controllerServiceUtils = controllerServiceUtils;
        this.feedbackService = feedbackService;
        this.feedbackList = new ArrayList<Feedback>();
    }

    public List<Feedback> retrieveFeedbacks(String country, Long question,
            HttpSession session, User su, Boolean harmonized) throws BadRequestServiceEx {

        Map<String, SurveyInstance> surveyInstanceMap = (Map<String, SurveyInstance>) session
                .getAttribute(SURVEY_INSTANCES);
        SurveyInstance si = surveyInstanceMap.get(country);

        List<Feedback> feedbackList = null;
        try {

            feedbackList = feedbackService.loadFeedback(su, si, question, harmonized);
        } catch (BadRequestServiceEx e) {

           throw new BadRequestServiceEx("Errors loading feedbacks...");
        }
        return feedbackList;
    }
    
    public void storeFeedbacks() throws BadRequestServiceEx{
        
        if(this.feedbackList != null){
            feedbackService.storeFeedback(this.getFeedbackArray());
        }
        else{
            
            throw new BadRequestServiceEx("feedbackList equals to null");
        }
    }
    
    public void mergefeedbacks(List<Feedback> oldFeedbacks){
        
        List<Feedback> feedbacksMerged = new ArrayList<Feedback>();
        for(Feedback el : feedbackList){
            
            int oldFbIndex = oldFeedbacks.indexOf(el);
            if(oldFbIndex >= 0){
                Feedback oldFb = oldFeedbacks.get(oldFbIndex);
                oldFb.setFeedback(el.getFeedback());
                feedbacksMerged.add(oldFb);
            }
            else if(!StringUtils.isEmpty(el.getFeedback())){
                
                feedbacksMerged.add(el);
            }
        }
        feedbackList = feedbacksMerged;
        
    }
    
    public List<Feedback> packageFeedbacks(List<Feedback> feedbacks, boolean packageAlsoArmonized){
        
        List<Feedback> packagedFeedbacks = new ArrayList<Feedback>();
        Map<String, Feedback> packagedFeedbacksMap = new HashMap<String, Feedback>(); 
        
        for(Feedback el : feedbacks){
            
            Feedback f = new Feedback();
            if(!el.getHarmonized()){
                f = packagedFeedbacksMap.remove(el.getFeedbackId());
                if(f == null){
                    f = new Feedback();
                    BeanUtils.copyProperties(el, f);
                    f.setFeedback("");
                }
            }
            
            
            if(f.getHarmonized() != null && !f.getHarmonized() && !StringUtils.isEmpty(el.getFeedback())){
                
                User u = f.getUser();
                StringBuilder sb = new StringBuilder();
    //            sb.append(f.getFeedback());
                Calendar cal = GregorianCalendar.getInstance();
                cal.setTimeInMillis(f.getTimestamp());
                SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy.MM.dd 'at' hh:mm:ss a zzz");
                dateFormatter.setTimeZone(TimeZone.getTimeZone("UTC"));
                sb.append(f.getFeedback());
                String record = loadTemplatePackaged();
                record = record.replace("%{date}", dateFormatter.format(cal.getTime()));
                record = record.replace("%{username}", u.getUsername());
                record = record.replace("%{feedbackContent}", el.getFeedback());
                sb.append(record);
                f.setFeedback(sb.toString());
                packagedFeedbacksMap.put(f.getFeedbackId(), f);
            }
            else if(packageAlsoArmonized){
                BeanUtils.copyProperties(el, f);
                packagedFeedbacksMap.put(f.getFeedbackId()+"_Ed", f);
            }
            
        }
        
        packagedFeedbacks = new ArrayList<Feedback>(packagedFeedbacksMap.values());
        return packagedFeedbacks;
    }
    
    public void populateFeedbackList(HttpServletRequest request, HttpSession session, ControllerServices controllerServices, String countryIso3, Boolean harmonized){
        
        User user = (User)session.getAttribute(SESSION_USER);
        
        Map<String, SurveyInstance> surveyInstanceMap = (Map<String, SurveyInstance>)session.getAttribute(SURVEY_INSTANCES);
        SurveyInstance si = surveyInstanceMap.get(countryIso3);
        
        Enumeration<String> paramsNames = request.getParameterNames();
        
        while(paramsNames.hasMoreElements()){
            
            String feedbackName = (String)paramsNames.nextElement();
            if(feedbackName.startsWith(FEEDBACK)){
                
                String feedback = (String)request.getParameter(feedbackName);
                String entryID = null;
                // This check is made in mergeFeedback now...
//                if(!StringUtils.isEmpty(feedback)){
                    entryID = VariableNameUtils.extractEntryIDfromFeedbackID(feedbackName);
                    Entry entry = controllerServices.getEntry(entryID);
                    addToFeedbackList(entry, si, user, feedback, entryID, "", harmonized);
//                }
                
            }
        }
        
    }
    
    public void prepareFeedbackModel(Model model, List<Feedback> feedbackList){
        
        if(feedbackList != null){
            
            for(Feedback el : feedbackList){
                
                String feedbackId = el.getFeedbackId();
                feedbackId = (el.getHarmonized())?feedbackId+"_Ed":feedbackId;
                model.addAttribute(VariableNameUtils.buildfeedbackIDfromEntryID(feedbackId), el.getFeedback());
            }
        }
    }
    
    public List getFeedbackList(){
        
        return UnmodifiableList.decorate(feedbackList);
    }
    
    public Feedback[] getFeedbackArray(){
        
        if(feedbackList != null && !feedbackList.isEmpty()){
        
            Feedback[] array = new Feedback[feedbackList.size()]; 
            return feedbackList.toArray(array);
        }
        return null;
    }
    
    public void addToFeedbackList(Entry entry, SurveyInstance surveyInstance, User user, String feedback, String feedbackId, String status, Boolean harmonized){
        
        final Feedback f = new Feedback();
        f.setEntry(entry);
        f.setFeedback(feedback);
        f.setFeedbackId(feedbackId);
        f.setStatus("");
        f.setSurvey(surveyInstance);
        f.setTimestamp(System.currentTimeMillis());
        f.setUser(user);
        f.setHarmonized(harmonized);
        feedbackList.add(f);
    }
    
    public void addAllToFeedbackList(List<Feedback> list){
        
        this.feedbackList.addAll(list);
    }
    
    private String loadTemplatePackaged(){
        
        InputStream tmpltStream = this.getClass().getResourceAsStream("/packagedFeedbacksTemplate.tmplt");
        Reader r = new InputStreamReader(tmpltStream);
        try {
            
            return IOUtils.getStringFromReader(r);
        } catch (IOException e) {
            
            LOGGER.error(e.getMessage(), e);
        }
        finally{
            
            if(tmpltStream != null){
                try {
                    tmpltStream.close();
                } catch (IOException e) {
                    LOGGER.error(e.getMessage(), e);
                }
            }
            if(r != null){
                try {
                    r.close();
                } catch (IOException e) {
                    LOGGER.error(e.getMessage(), e);
                }
            }
        }
        return "%{date} - %{username} - %{feedbackContent} <br />";
    }
    
}