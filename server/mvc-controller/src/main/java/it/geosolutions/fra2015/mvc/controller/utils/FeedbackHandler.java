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

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.list.UnmodifiableList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * Hold the feedback management: take as input the req and session objects, build a Feedback Instance and add to a feedback list 
 * 
 * @author DamianoG
 *
 */
public class FeedbackHandler{
    
    private ControllerServices controllerServiceUtils;
    
    private FeedbackService feedbackService;
    
    private List<Feedback> feedbackList;
    
    public FeedbackHandler(ControllerServices controllerServiceUtils, FeedbackService feedbackService){
        
        this.controllerServiceUtils = controllerServiceUtils;
        this.feedbackService = feedbackService;
        this.feedbackList = new ArrayList<Feedback>();
    }

    public void handleFeedbackForGetRequest(String country, Long question, Model model,
            HttpSession session, User su) throws BadRequestServiceEx {

        if (su == null) {
            throw new NullPointerException("User is null");
        }
        controllerServiceUtils.prepareHTTPRequest(model, question.toString(),
                controllerServiceUtils.retrieveValues(question.toString(), country), false);

        Map<String, SurveyInstance> surveyInstanceMap = (Map<String, SurveyInstance>) session
                .getAttribute(SURVEY_INSTANCES);
        SurveyInstance si = surveyInstanceMap.get(country);

        List<Feedback> feedbackList = null;
        try {

            feedbackList = feedbackService.loadFeedback(su, si, question);
        } catch (BadRequestServiceEx e) {

           throw new BadRequestServiceEx("Errors loading feedbacks...");
        }
        prepareFeedbackModel(model, feedbackList);
    }
    
    public void populateFeedbackList(HttpServletRequest request, HttpSession session, ControllerServices controllerServices, String countryIso3){
        
        User user = (User)session.getAttribute(SESSION_USER);
        
        Map<String, SurveyInstance> surveyInstanceMap = (Map<String, SurveyInstance>)session.getAttribute(SURVEY_INSTANCES);
        SurveyInstance si = surveyInstanceMap.get(countryIso3);
        
        Enumeration<String> paramsNames = request.getParameterNames();
        
        while(paramsNames.hasMoreElements()){
            
            String feedbackName = (String)paramsNames.nextElement();
            if(feedbackName.startsWith(FEEDBACK)){
                
                String feedback = (String)request.getParameter(feedbackName);
                
                String entryID = VariableNameUtils.extractEntryIDfromFeedbackID(feedbackName);
                Entry entry = controllerServices.getEntry(entryID);
                addToFeedbackList(entry, si, user, feedback, entryID, "");
            }
        }
        
    }
    
    private void prepareFeedbackModel(Model model, List<Feedback> feedbackList){
        
        if(feedbackList != null){
            
            for(Feedback el : feedbackList){
                
                model.addAttribute(VariableNameUtils.buildfeedbackIDfromEntryID(el.getFeedbackId()), el.getFeedback());
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
    
    public void addToFeedbackList(Entry entry, SurveyInstance surveyInstance, User user, String feedback, String feedbackId, String status){
        
        final Feedback f = new Feedback();
        f.setEntry(entry);
        f.setFeedback(feedback);
        f.setFeedbackId(feedbackId);
        f.setStatus("");
        f.setSurvey(surveyInstance);
        f.setTimestamp(System.currentTimeMillis());
        f.setUser(user);
        feedbackList.add(f);
    }
    
}