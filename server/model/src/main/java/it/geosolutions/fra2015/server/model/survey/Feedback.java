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
package it.geosolutions.fra2015.server.model.survey;

import it.geosolutions.fra2015.server.model.user.User;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.Index;

/**
 * @author DamianoG
 *
 */
@Entity(name = "Feedback")
@Table(name = "fra_feedback")
public class Feedback {
    
    @Id
    @GeneratedValue
    private Long id;
    
    private String feedbackId;
    
    @ManyToOne(optional=false) 
    @JoinColumn(nullable=false, updatable=false)
    @Index(name = "idx_feedback_survey")
    private SurveyInstance survey;

    @ManyToOne(optional=false) 
    @JoinColumn(nullable=false, updatable=false)
    private User user;
    
    @ManyToOne(optional=false) 
    @JoinColumn(nullable=false, updatable=false)
    @Index(name = "idx_feedback_entry")
    private Entry entry;
    
    @Lob
    private String feedback;
    
    private String status;
    
    private Long timestamp;
    
    private Boolean harmonized;

    /**
     * @return the feedbackId
     */
    public String getFeedbackId() {
        return feedbackId;
    }

    /**
     * @param feedbackId the feedbackId to set
     */
    public void setFeedbackId(String feedbackId) {
        this.feedbackId = feedbackId;
    }

    /**
     * @return the survey
     */
    public SurveyInstance getSurvey() {
        return survey;
    }

    /**
     * @param survey the survey to set
     */
    public void setSurvey(SurveyInstance survey) {
        this.survey = survey;
    }

    /**
     * @return the user
     */
    public User getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * @return the entry
     */
    public Entry getEntry() {
        return entry;
    }

    /**
     * @param entry the entry to set
     */
    public void setEntry(Entry entry) {
        this.entry = entry;
    }

    /**
     * @return the feedback
     */
    public String getFeedback() {
        return feedback;
    }

    /**
     * @param feedback the feedback to set
     */
    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the timestamp
     */
    public Long getTimestamp() {
        return timestamp;
    }

    /**
     * @param timestamp the timestamp to set
     */
    public void setTimestamp(Long timestamp) {
        this.timestamp = timestamp;
    }

    /**
     * @return the harmonized
     */
    public Boolean getHarmonized() {
        return harmonized;
    }

    /**
     * @param harmonized the harmonized to set
     */
    public void setHarmonized(Boolean harmonized) {
        this.harmonized = harmonized;
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

    @Override
    public boolean equals(Object fb){
        
        Feedback castedFb = (Feedback)fb;
        if(this.feedbackId == null || this.harmonized == null){
            return false;
        }
        return (this.feedbackId.equals(castedFb.feedbackId) && this.harmonized.equals(castedFb.harmonized));
    }
    
    
}
