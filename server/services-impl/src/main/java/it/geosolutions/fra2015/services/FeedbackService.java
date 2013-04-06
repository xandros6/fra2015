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
import java.util.List;
import java.util.Collection;

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
     * If user is not null and harmonized is null, load the feedbacks for the user and also the harmonized feedback related to question and surv
     *  
     * @param user
     * @param survey
     * @param question
     * @param harmonized
     * @return
     * @throws BadRequestServiceEx
     */
    public List<Feedback> loadFeedback(User user, SurveyInstance survey, Long question, Boolean harmonized) throws BadRequestServiceEx{

        List<Feedback> list = new ArrayList<Feedback>();
        List<Feedback> harmonizedList = new ArrayList<Feedback>();
        try {
            
            Search search = new Search();
            if(user != null){
                search.addFilterEqual("user", user);
            }
            if(harmonized != null){
                search.addFilterEqual("harmonized", harmonized);
            }
            search.addFilterEqual("survey", survey);
            search.addFilterEqual("entry.question.id", question);
            search.addFilterGreaterThan("timestamp", survey.getStatus().getLastContributorSubmission());
            list = feedbackDAO.search(search);
            //workaround
            if(user != null && harmonized == null){
                search = new Search();
                search.addFilterEqual("harmonized", true);                
                search.addFilterEqual("survey", survey);
                search.addFilterEqual("entry.question.id", question);
                search.addFilterGreaterThan("timestamp", survey.getStatus().getLastContributorSubmission());
                harmonizedList = feedbackDAO.search(search);
            }
        }
        catch (Exception e) {
            
            LOGGER.error(e.getLocalizedMessage());
            throw new BadRequestServiceEx(e.getLocalizedMessage());
        }
        list.addAll(harmonizedList);
        return list;
    }
    
    public boolean checkQuestionFeedbackStatus(User user, SurveyInstance survey, Long question){
        
        Collection<Entry> entries = catalog.getEntriesForQuestion(question);
        
        Search search = new Search();
        search.addFilterEqual("user", user);
        search.addFilterEqual("harmonized", false);
        search.addFilterEqual("survey", survey);
        search.addFilterEqual("entry.question.id", question);
        search.addFilterEqual("status", "ok");
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
        
        search.addFilterEqual("survey", survey);
        search.addFilterEqual("entry.question.id", q);
        search.addFilterGreaterThan("timestamp", survey.getStatus().getLastContributorSubmission());
        counts[q] = feedbackDAO.count(search);
        }
        return counts;
    }
}
