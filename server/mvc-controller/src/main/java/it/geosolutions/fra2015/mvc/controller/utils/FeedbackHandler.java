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
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;
import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.server.model.survey.Feedback;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.FeedbackService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.list.UnmodifiableList;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.CharUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.springframework.beans.BeanUtils;
import org.springframework.ui.Model;

/**
 * Hold the feedback management: take as input the req and session objects, build a Feedback Instance and add to a feedback list 
 * 
 * @author DamianoG
 * @author Tobia Di Pisa at tobia.dipisa@geo-solutions.it
 *
 */
public class FeedbackHandler{
    
    private static final Logger LOGGER = Logger.getLogger(FeedbackHandler.class);
    
    private static final String NO_COMMENT = "NO COMMENT PROVIDED...";
    
    private ControllerServices controllerServiceUtils;
    
    private FeedbackService feedbackService;
    
    private List<Feedback> feedbackList;
    
    private List<Feedback> feedbackListToRemove;
    
    public FeedbackHandler(ControllerServices controllerServiceUtils, FeedbackService feedbackService){
        
        this.controllerServiceUtils = controllerServiceUtils;
        this.feedbackService = feedbackService;
        this.feedbackList = new ArrayList<Feedback>();
        this.feedbackListToRemove = new ArrayList<Feedback>();
    }
   
    /**
     * @param country
     * @param question
     * @param session
     * @param su
     * @param harmonized
     * @return List<Feedback> 
     * @throws BadRequestServiceEx
     * @throws NotFoundServiceEx
     */
    public List<Feedback> retrieveFeedbacks(String country, Long question,
            HttpSession session, User su, Boolean harmonized) throws BadRequestServiceEx, NotFoundServiceEx {

        Map<String, SurveyInstance> surveyInstanceMap = (Map<String, SurveyInstance>) session
                .getAttribute(SURVEY_INSTANCES);
        SurveyInstance si = surveyInstanceMap.get(country);

        List<Feedback> feedbackList = null;
        List<Feedback> harmonizedFeedbackList = null;
        try {

            feedbackList = feedbackService.loadFeedback(su, si, question);
            harmonizedFeedbackList = feedbackService.loadHarmonizedfeedbacks(si, question);
        } catch (BadRequestServiceEx e) {

           throw new BadRequestServiceEx("Errors loading feedbacks...");
        }
        
        feedbackList.addAll(harmonizedFeedbackList);
        
        return feedbackList;
    }
    
    /**
     * @param entry
     * @param si
     * @param user
     * @return Feedback
     */
    private Feedback buildUnrevisionedFeedback(Entry entry, SurveyInstance si, User user){
		Feedback feedback = new Feedback();
		feedback.setEntry(entry);
		feedback.setFeedback("");
		feedback.setFeedbackId(entry.getVariable());
		feedback.setHarmonized(false);
		feedback.setStatus("notrevisioned");
		feedback.setSurvey(si);
		feedback.setTimestamp(System.currentTimeMillis());
		feedback.setUser(user);
		
		return feedback;
    }
    
    /**
     * @param session 
     * @param feedbackList
     * @param country 
     * @param question
     * @param si
     * @return List<Feedback>
     * @throws NotFoundServiceEx
     */
    public List<Feedback> addUnrevisionedFeedbacks(HttpSession session, List<Feedback> feedbackList, 
    		String country, Long question) throws NotFoundServiceEx{
    	
        Map<String, SurveyInstance> surveyInstanceMap = (Map<String, SurveyInstance>) session
                .getAttribute(SURVEY_INSTANCES);
        SurveyInstance si = surveyInstanceMap.get(country);
        
        // ------------------------------- //
        // Find unrevisioned entries       //
        // ------------------------------- //
        
        // List of question entries
    	Collection<Entry> entries = this.controllerServiceUtils.getEntriesForQuestion(question);
        
    	// ///////////////////////////////////////
        // List of submit users for the survey
    	// ///////////////////////////////////////
        Status status = si.getStatus();
        String reviewerSubmit = status.getReviewerSubmit();
        String[] reviewers = (reviewerSubmit!=null)?reviewerSubmit.split(";"):new String[]{""};
        
        List<User> reviewersForSurveyAndQuestion = null;
        if(question != null){
        	reviewersForSurveyAndQuestion = this.controllerServiceUtils.getReviewersForSurveyAndQuestion(country, question);
        }
        
        int size = reviewers.length;
        
        List<User> reviewersList = new ArrayList<User>();
        for(int i=0; i<size; i++){
        	String reviewer = reviewers[i];
        	if(reviewer != null && !reviewer.isEmpty()){
        		User userReviewer = this.controllerServiceUtils.getUser(reviewer);
        		
        		boolean contians = reviewersForSurveyAndQuestion != null ? reviewersForSurveyAndQuestion.contains(userReviewer) : true;
        		
        		if(userReviewer != null && 
        				userReviewer.getRole().equals(Profile.REVIEWER.toString().toLowerCase()) &&	contians){
        			reviewersList.add(userReviewer);
        		}
        	}
        }
        
        // ///////////////////////////////////////////////////////
        // get the list of entries and users in feedback list
        // ///////////////////////////////////////////////////////
    	List<Entry> feedbackEntryList = new ArrayList<Entry>();
    	List<User> feedbackUserList = new ArrayList<User>();
    	
    	Iterator<Feedback> iterator = feedbackList.iterator();
    	while(iterator.hasNext()){
    		Feedback f = (Feedback)iterator.next();
    		
    		Entry entry = f.getEntry();
    		User user = f.getUser();
    		
    		if(entry != null){
    			feedbackEntryList.add(entry);
    			feedbackUserList.add(user);
    		}
    	}
    	
    	Iterator<User> i = reviewersList.iterator();
    	while(i.hasNext()){
    		User user = (User)i.next();
    		
    		if(!feedbackUserList.contains(user)){
    			// ////////////////////////////////////////////
    			// The user have not revisioned any entry.
    			// Creare the dummy feedback for each entry.
    			// ////////////////////////////////////////////    			
    			Iterator<Entry> iterEntry = entries.iterator();
    			while(iterEntry.hasNext()){
    				Entry entry = (Entry)iterEntry.next();
    				
    				Feedback feedback = this.buildUnrevisionedFeedback(entry, si, user);    
    				feedbackList.add(feedback);
    			}
    		}else{
    			// ////////////////////////////////////////////////////////////////
    			// The user have revisioned at least one entry. Determine which 
    			// he have not revisioned and create the dummies feedback for each
    			// of these entries.
    			// ////////////////////////////////////////////////////////////////
    			Iterator<Entry> iterEntry = entries.iterator();
    			while(iterEntry.hasNext()){
    				Entry entry = (Entry)iterEntry.next();
    				
    				iterator = feedbackList.iterator();
    				boolean exists = false;
    				
    				while(iterator.hasNext()){
    					Feedback f = (Feedback)iterator.next();
    					
    					Entry e = f.getEntry();
    					User u = f.getUser();
    					
    					boolean eb = e.equals(entry);
    					boolean ub = u.equals(user);
    					if(eb && ub){
    						exists = true;
    					}
    				}
    				
    				if(!exists){
    					// ///////////////////////////////////////////////////////////
    					// Entry not revisioned. Add a dummy feedback for this.
    					// ///////////////////////////////////////////////////////////
        				Feedback feedback = this.buildUnrevisionedFeedback(entry, si, user);        				
        				feedbackList.add(feedback);
    				}
    			}
    		}
    	}
    	
    	return feedbackList;
    }
    
    /**
     * @param country
     * @param session
     * @param su
     * @return List<Feedback> 
     * @throws BadRequestServiceEx
     * @throws NotFoundServiceEx 
     */
    public List<Feedback> retrieveAllFeedbacks(String country, HttpSession session, User su) throws BadRequestServiceEx, NotFoundServiceEx {

        Map<String, SurveyInstance> surveyInstanceMap = (Map<String, SurveyInstance>) session
                .getAttribute(SURVEY_INSTANCES);
        SurveyInstance si = surveyInstanceMap.get(country);

        List<Feedback> feedbackList = null;
        List<Feedback> harmonizedFeedbackList = null;
        try {
            feedbackList = feedbackService.loadAllFeedback(su, si);
            harmonizedFeedbackList = feedbackService.loadAllHarmonizedfeedbacks(si);
        } catch (BadRequestServiceEx e) {

           throw new BadRequestServiceEx("Errors loading feedbacks...");
        }
        
        feedbackList.addAll(harmonizedFeedbackList);
        
        return feedbackList;
    }
    
    public void storeFeedbacks() throws BadRequestServiceEx {

        if (this.feedbackList != null) {
            if (!this.feedbackList.isEmpty()) {
                feedbackService.storeFeedback(this.getFeedbackArray());
            }
        } else {

            throw new BadRequestServiceEx("feedbackList equals to null");
        }
    }
    
    /**
     * This method remove all the feedbacks that are in the feedbackListToRemove instance var
     * and empty the feedbackListToRemove var too.
     * 
     * Usually It is used when a feedback come back to status "NOT revisioned": in that case the feedback should be removed by the DB.
     *  
     * @throws BadRequestServiceEx
     */
    public void removeFeedbacks() throws BadRequestServiceEx {
        if (this.feedbackListToRemove != null) {
            if (!this.feedbackListToRemove.isEmpty()) {
                feedbackService.removeFeedback(feedbackListToRemove);
            }
        } else {
            throw new BadRequestServiceEx("feedbackList equals to null");
        }
        this.feedbackListToRemove = new ArrayList<Feedback>();
    }
    
    /**
     * Create a feedback list to update the status on DB checking which feedback must be added, updated, deleted
     * 
     * @param oldFeedbacks The list of the feedback before the current REVIEWER or REVIEWEREDITOR changes
     * @param deleteNotRevised a flag that indicate basically if the current user is a REVIEWER or REVIEWER EDITOR
     */
    public void mergefeedbacks(List<Feedback> oldFeedbacks, boolean deleteNotRevised){
        
        List<Feedback> feedbacksMerged = new ArrayList<Feedback>();
        for(Feedback el : feedbackList){
            clearFeedbackValue(el);
            int oldFbIndex = oldFeedbacks.indexOf(el);
            if(oldFbIndex >= 0){
                // The feedback is present, so merge it
                Feedback oldFb = oldFeedbacks.get(oldFbIndex);
                oldFb.setStatus(el.getStatus());
                String feedbackValue = (el.getStatus().equals("ok"))?"":el.getFeedback();
                oldFb.setFeedback(feedbackValue);
                oldFb.setTimestamp(el.getTimestamp());
                feedbacksMerged.add(oldFb);
            }
            // The feedback is not present, so check if must be added            
            else if(checkIfMustBeAdded(el)){
                feedbacksMerged.add(el);
            }
        }
        // This loop check if some feedback has been transitioned from state OK or KO to state NOT REVISED
        // In that case the feedback must be removed. This loop must be executed only if the user is REVIEWER
        // and not with REVIEWEREDITOR: with reved we delete all feedbacks for that questions!
        if(deleteNotRevised){
            for(Feedback el : oldFeedbacks){
                int oldFbIndex = feedbackList.indexOf(el);
                if(oldFbIndex < 0){
                    feedbackListToRemove.add(el);
                }
            }
        }
        
        feedbackList = feedbacksMerged;
        
    }
    
    public List<Feedback> packageFeedbacks(List<Feedback> feedbacks, boolean packageAlsoArmonized, Status status){
        
        List<Feedback> packagedFeedbacks = new ArrayList<Feedback>();
        Map<String, Feedback> packagedFeedbacksMap = new HashMap<String, Feedback>(); 
        String recordKO = loadTemplatePackaged().get(0);
        String recordOK = loadTemplatePackaged().get(1);
        
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
            
            String record = (el.getStatus().equals("ko")) ? recordKO : recordOK;
            String colorClass = "";
            if(!StatusUtils.getReviewerSubmit(status).contains(el.getUser().getUsername())){
                       colorClass= "alert alert-warning";
            } else {
                if (el.getStatus().equals("ok")) {
                    colorClass = "alert alert-success";
                }else  if (el.getStatus().equals("ko")) {
                    colorClass = "alert alert-error";
                }else{
                    colorClass= "alert alert-warning";

                }
            }
            
            if(f.getHarmonized() != null && !f.getHarmonized()){
                
                StringBuilder sb = new StringBuilder();
                Calendar cal = GregorianCalendar.getInstance();
                cal.setTimeInMillis(el.getTimestamp());
                SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy.MM.dd 'at' hh:mm:ss a zzz");
                dateFormatter.setTimeZone(TimeZone.getTimeZone("UTC"));
                sb.append(f.getFeedback());
                record = record.replace("%{colorClass}", colorClass);
                record = record.replace("%{date}", dateFormatter.format(cal.getTime()));
                record = record.replace("%{username}", el.getUser().getUsername());
                record = record.replace("%{feedbackContent}", el.getFeedback());
                record = record.replace("%{status}", el.getStatus());
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
                String feedbackStatus = (String)request.getParameter("STATUS"+feedbackName);
                if(!harmonized && !checkIsOKorKO(feedbackStatus)){
                    continue;
                }
                feedbackStatus = (feedbackStatus != null)?feedbackStatus:"";
                String entryID = null;
                // This check is made in mergeFeedback now...
//                if(!StringUtils.isEmpty(feedback)){
                    entryID = VariableNameUtils.extractEntryIDfromFeedbackID(feedbackName);
                    Entry entry = controllerServices.getEntry(entryID);
                    addToFeedbackList(entry, si, user, feedback, entryID, feedbackStatus, harmonized);
//                }
                
            }
        }
        
    }
    
    public static void loadPreviousFeedbacks(Model model, FeedbackService feedbackService, HttpSession session, User su, Long question, String countryIso3){
        
        Map<String, SurveyInstance> surveyInstanceMap = (Map<String, SurveyInstance>) session.getAttribute(SURVEY_INSTANCES);
        SurveyInstance si = surveyInstanceMap.get(countryIso3);
        List<Feedback> previousFB = new ArrayList<Feedback>();
        try {
            
            previousFB = feedbackService.loadPreviousReviewFeedbacks(su, si, question);
        } catch (BadRequestServiceEx e1) {
            LOGGER.error(e1.getMessage(), e1);
        }
        for(Feedback el : previousFB){
            model.addAttribute(VariableNameUtils.buildfeedbackIDfromEntryID(el.getFeedbackId()+"_old"), el.getFeedback());
        }
    }
    
    public void prepareFeedbackModel(Model model, List<Feedback> feedbackList){
        
        if(feedbackList != null){            
            for(Feedback el : feedbackList){                
                String feedbackId = el.getFeedbackId();
                feedbackId = (el.getHarmonized())?feedbackId+"_Ed":feedbackId;
                model.addAttribute(VariableNameUtils.buildfeedbackIDfromEntryID(feedbackId), el.getFeedback());
                model.addAttribute(VariableNameUtils.buildfeedbackStatusIDfromEntryID(feedbackId), el.getStatus());
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
        feedback = (StringUtils.isBlank(feedback) && "ko".equals(status))?NO_COMMENT:feedback;
        f.setFeedback(feedback);
        f.setFeedbackId(feedbackId);
        f.setStatus(status);
        f.setSurvey(surveyInstance);
        f.setTimestamp(System.currentTimeMillis());
        f.setUser(user);
        f.setHarmonized(harmonized);
        feedbackList.add(f);
    }
    
    public void addAllToFeedbackList(List<Feedback> list){
        
        this.feedbackList.addAll(list);
    }
    
    private List<String> loadTemplatePackaged(){
        
        InputStream tmpltStream = this.getClass().getResourceAsStream("/packagedFeedbacksTemplate.tmplt");
        Reader r = new InputStreamReader(tmpltStream);
        List<String> templates = new ArrayList<String>();
        templates.add("%{date} - %{username} - %{feedbackContent} - %{status}<br />");
        templates.add("%{date} - %{username} - %{feedbackContent} - %{status}<br />");
        try {
            
            templates = IOUtils.readLines(r);
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
        return templates;
    }
    
    public int[] getFeedbackCounter(String country,HttpSession session,boolean harmonized){
        Map<String, SurveyInstance> surveyInstanceMap = (Map<String, SurveyInstance>) session
                .getAttribute(SURVEY_INSTANCES);
        SurveyInstance si = surveyInstanceMap.get(country);
        // Update the status in surveyIstance
        si.setStatus(controllerServiceUtils.getStatusInstanceByCountry(country));
        
        if(!harmonized){
            Status s = si.getStatus();
            StatusUtils.getReviewerSubmit(s);
            return feedbackService.getFeedbackCounter(si, harmonized,StatusUtils.getReviewerSubmit(s));
        }else{
            return feedbackService.getFeedbackCounter(si, harmonized);
        }
    }
    
    /**
     * This method basically check if the feedback is empty.
     * This check can't be done just with an isBlank method because some html tag can be present anyway, without any real content. (wrong Enter press, some button in ckeditor pressed)
     * So if no text is detected set the feedback value to ""
     * 
     * @param f the feedback to analyze
     */
    public static void clearFeedbackValue(Feedback f){
        if(checkIsOKorNOT(f.getStatus()) || StringUtils.isBlank(f.getFeedback())){
            return;
        }
        String s = f.getFeedback().replaceAll("\\s","");
        if(StringUtils.isBlank(s)){
            return;
        }
        s = Jsoup.parse(s).text();
        if(StringUtils.isBlank(s)){
            return;
        }
        for(int i=0; i<s.length(); i++){
            if(CharUtils.isAsciiPrintable(s.charAt(i)) && s.charAt(i) != 0 && s.charAt(i) != 32){
                return;
            }
        }
        if(f.getHarmonized()){
            f.setFeedback("");
        }
        else{
            f.setFeedback(NO_COMMENT);
        }
        
    }
    
    public static boolean checkIfMustBeAdded(Feedback f){
        boolean isBlank = StringUtils.isBlank(f.getFeedback());
        boolean isOKorKO = checkIsOKorKO(f);        
        return !isBlank || isOKorKO;
    }
    
    public static boolean checkIsOKorKO(Feedback f){
        return (StringUtils.equals(f.getStatus(), "ok") || StringUtils.equals(f.getStatus(), "ko"));
    }
    
    public static boolean checkIsOKorKO(String status){
        return (StringUtils.equals(status, "ok") || StringUtils.equals(status, "ko"));
    }
    
    public static boolean checkIsOKorNOT(String status){
        return (StringUtils.equals(status, "ok") || StringUtils.equals(status, "not"));
    }
}