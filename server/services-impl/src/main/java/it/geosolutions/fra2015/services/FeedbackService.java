/*
 *  fra2015
 *  https://github.com/geosolutions-it/fra2015
 *  Copyright (C) 2007-2012 GeoSolutions S.A.S.
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
package it.geosolutions.fra2015.services;

import it.geosolutions.fra2015.server.dao.FeedbackDAO;
import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.server.model.survey.Feedback;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.googlecode.genericdao.search.Search;

/**
 * @author DamianoG
 * 
 */
public class FeedbackService {

    @Autowired
    private FeedbackDAO feedbackDAO;
    
    @Autowired 
    private SurveyCatalog catalog;
    
    private final Logger LOGGER = Logger.getLogger(FeedbackService.class);

    public boolean storeFeedback(Feedback... feedback) throws BadRequestServiceEx{

        try {
            
            feedbackDAO.save(feedback);
        }
        catch (Exception e) {
            
            LOGGER.error(e.getLocalizedMessage());
            throw new BadRequestServiceEx(e.getLocalizedMessage());
        }
        return true;
    }
    
    /**
     * Load All feedbacks related to the Latest review / ReviewEditing.
     * The feedback is loaded only if his timestamp is > to the LastContributorSubmission field stored in the survey status
     *  
     * @param user
     * @param survey
     * @param question
     * @param harmonized
     * @return
     * @throws BadRequestServiceEx
     */
    public List<Feedback> loadFeedback(User user, SurveyInstance survey, Long question) throws BadRequestServiceEx{

        List<Feedback> list = new ArrayList<Feedback>();
        List<Feedback> harmonizedList = new ArrayList<Feedback>();
        try {
            
            Search search = new Search();
            if(user != null){
                search.addFilterEqual("user", user);
            }
            search.addFilterEqual("harmonized", false);
            search.addFilterEqual("survey", survey);
            search.addFilterEqual("entry.question.id", question);
            search.addFilterGreaterThan("timestamp", survey.getStatus().getLastSurveyReview());
            list = feedbackDAO.search(search);
        }
        catch (Exception e) {
            
            LOGGER.error(e.getLocalizedMessage());
            throw new BadRequestServiceEx(e.getLocalizedMessage());
        }
        list.addAll(harmonizedList);
        return list;
    }
    
    /**
     * Load all the harmonized feedbacks for a given question
     * 
     * @param survey
     * @param question
     * @return
     * @throws BadRequestServiceEx
     */
    public List<Feedback> loadHarmonizedfeedbacks(SurveyInstance survey, Long question) throws BadRequestServiceEx{
        
        List<Feedback> list = new ArrayList<Feedback>();
        List<Feedback> harmonizedList = new ArrayList<Feedback>();
        try {
            
            Search search = new Search();
            search.addFilterEqual("harmonized", true);
            search.addFilterEqual("survey", survey);
            search.addFilterEqual("entry.question.id", question);
            search.addFilterGreaterThan("timestamp", survey.getStatus().getLastContributorSubmission());
            list = feedbackDAO.search(search);
        }
        catch (Exception e) {
            
            LOGGER.error(e.getLocalizedMessage());
            throw new BadRequestServiceEx(e.getLocalizedMessage());
        }
        list.addAll(harmonizedList);
        return list;
    }
    
    /**
     * Load the feedbacks that are saved between the previous editor submission and the latest in order to 
     * allow the reviewer to see their previous comment for each entry.
     * 
     * @param user
     * @param survey
     * @param question
     * @param harmonized
     * @return
     * @throws BadRequestServiceEx
     */
    public List<Feedback> loadPreviousReviewFeedbacks(User user, SurveyInstance survey, Long question) throws BadRequestServiceEx{

        List<Feedback> list = new ArrayList<Feedback>();
        try {
            
            Search search = new Search();
            search.addFilterEqual("user", user);
            search.addFilterEqual("survey", survey);
            search.addFilterEqual("entry.question.id", question);
            Long prev = (survey.getStatus().getPreviousSurveyReview() != null)?survey.getStatus().getPreviousSurveyReview():0;
            Long last = (survey.getStatus().getLastSurveyReview() != null)?survey.getStatus().getLastSurveyReview():0;
            search.addFilterGreaterThan("timestamp", prev);
            search.addFilterLessThan("timestamp", last);
            list = feedbackDAO.search(search);
        }
        catch (Exception e) {
            
            LOGGER.error(e.getLocalizedMessage());
            throw new BadRequestServiceEx(e.getLocalizedMessage());
        }
        return list;
    }
    
    public boolean checkQuestionFeedbackStatus(User user, SurveyInstance survey, Long question){
        
        Collection<Entry> entries = catalog.getEntriesForQuestion(question);
        
        Search search = new Search();
        search.addFilterEqual("user", user);
        search.addFilterEqual("harmonized", false);
        search.addFilterEqual("survey", survey);
        search.addFilterEqual("entry.question.id", question);
        search.addFilterIn("status", "ok", "ko");
        search.addFilterGreaterThan("timestamp", survey.getStatus().getLastContributorSubmission());
        List<Feedback> list = feedbackDAO.search(search);
        return (list.size() == entries.size());
    }
    /**
     * Counts feedback for a survey
     * @param survey
     * @param harmonized
     * @return
     */
    public int[] getFeedbackCounter(SurveyInstance survey,boolean harmonized){
        List<Feedback> list = new ArrayList<Feedback>();
        int[] counts= new int[21];
       for(int q = 0 ;q<counts.length;q++){
        Search search = new Search();
        
        search.addFilterEqual("harmonized", harmonized);
        if(!harmonized){
            search.addFilterEqual("status","ko");
        }
        search.addFilterEqual("survey", survey);
        search.addFilterEqual("entry.question.id", q);
        
        search.addFilterGreaterThan("timestamp", survey.getStatus().getLastContributorSubmission());
        counts[q] = feedbackDAO.count(search);
        }
        return counts;
    }
}
