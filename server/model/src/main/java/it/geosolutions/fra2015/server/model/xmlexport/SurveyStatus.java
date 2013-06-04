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
package it.geosolutions.fra2015.server.model.xmlexport;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author DamianoG
 *
 */
@XmlRootElement(name="SurveyStatus")
public class SurveyStatus {
    
    private String message;
    
    private String status;
    
    private Long lastContributorSubmission;
    
    private String reviewerSubmit;
    
    private String coverage;
    
    private Long lastSurveyReview;
    
    private Long previousSurveyReview;
    
    private Integer revisionNumber;

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
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
     * @return the lastContributorSubmission
     */
    public Long getLastContributorSubmission() {
        return lastContributorSubmission;
    }

    /**
     * @param lastContributorSubmission the lastContributorSubmission to set
     */
    public void setLastContributorSubmission(Long lastContributorSubmission) {
        this.lastContributorSubmission = lastContributorSubmission;
    }

    /**
     * @return the reviewerSubmit
     */
    public String getReviewerSubmit() {
        return reviewerSubmit;
    }

    /**
     * @param reviewerSubmit the reviewerSubmit to set
     */
    public void setReviewerSubmit(String reviewerSubmit) {
        this.reviewerSubmit = reviewerSubmit;
    }

    /**
     * @return the coverage
     */
    public String getCoverage() {
        return coverage;
    }

    /**
     * @param coverage the coverage to set
     */
    public void setCoverage(String coverage) {
        this.coverage = coverage;
    }

    /**
     * @return the lastSurveyReview
     */
    public Long getLastSurveyReview() {
        return lastSurveyReview;
    }

    /**
     * @param lastSurveyReview the lastSurveyReview to set
     */
    public void setLastSurveyReview(Long lastSurveyReview) {
        this.lastSurveyReview = lastSurveyReview;
    }

    /**
     * @return the previousSurveyReview
     */
    public Long getPreviousSurveyReview() {
        return previousSurveyReview;
    }

    /**
     * @param previousSurveyReview the previousSurveyReview to set
     */
    public void setPreviousSurveyReview(Long previousSurveyReview) {
        this.previousSurveyReview = previousSurveyReview;
    }

    /**
     * @return the revisionNumber
     */
    public Integer getRevisionNumber() {
        return revisionNumber;
    }

    /**
     * @param revisionNumber the revisionNumber to set
     */
    public void setRevisionNumber(Integer revisionNumber) {
        this.revisionNumber = revisionNumber;
    }
    
    
}
