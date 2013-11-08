/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.model.survey;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author marco
 * @author Tobia Di Pisa at tobia.dipisa@geo-solutions.it
 * 
 */
@Entity(name = "Status")
@Table(name = "fra_status" )
@XmlRootElement(name = "Status")
public class Status implements Serializable {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = -7339102975419456453L;

	@Id
    @GeneratedValue
    private Long id;
    
    @Column(nullable = true, updatable = true, length = 4000)
    private String message;
    
    @Column(nullable = false, updatable = true)
    private String status;
    
    @Column(nullable = true, updatable = true)
    private Long lastContributorSubmission;
    
    /**
     * This field name is a bit ambiguos: it store the list (as CSV) of those reviewer that already has submitted their review.
     */
    @Column(nullable = true, updatable = true)
    private String reviewerSubmit;
    
    @Column(nullable = true, updatable = true)
    private String coverage;
    
    @Column(updatable = true)
    private Long lastSurveyReview;
    
    @Column(nullable = true, updatable = true)
    private Long previousPendingFix;
    
    @Column(nullable = true, updatable = true)
    private Integer revisionNumber;
    
    @Column(nullable = true, updatable = true)
    private Long lastPendingFixSubmit;
    
    @Column(nullable = true, updatable = true)
    private Long lastAcceptanceRequest;
    
    @Column(nullable = true, updatable = true)
    private Long lastStatusAccepted;

	@Transient
    private String country;

    public Status(){}
    
	public Status(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
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
     * @return the contributorSubmission
     */
    public Long getLastContributorSubmission() {
        return lastContributorSubmission;
    }

    /**
     * @param contributorSubmission the contributorSubmission to set
     */
    public void setLastContributorSubmission(Long lastContributorSubmission) {
        this.lastContributorSubmission = lastContributorSubmission;
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
     * @return the previousPendingFix
     */
    public Long getPreviousPendingFix() {
        return previousPendingFix;
    }

    /**
     * @param previousPendingFix the previousPendingFix to set
     */
    public void setPreviousPendingFix(Long previousPendingFix) {
        this.previousPendingFix = previousPendingFix;
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
    
    /**
	 * @return the lastPendingFixSubmit
	 */
	public Long getLastPendingFixSubmit() {
		return lastPendingFixSubmit;
	}

	/**
	 * @param lastPendingFixSubmit the lastPendingFixSubmit to set
	 */
	public void setLastPendingFixSubmit(Long lastPendingFixSubmit) {
		this.lastPendingFixSubmit = lastPendingFixSubmit;
	}

	/**
	 * @return the lastaceptanceRequest
	 */
	public Long getLastAcceptanceRequest() {
		return lastAcceptanceRequest;
	}

	/**
	 * @param lastaceptanceRequest the lastaceptanceRequest to set
	 */
	public void setLastAcceptanceRequest(Long lastacceptanceRequest) {
		this.lastAcceptanceRequest = lastacceptanceRequest;
	}
	
    /**
	 * @return the lastStatusAccepted
	 */
	public Long getLastStatusAccepted() {
		return lastStatusAccepted;
	}

	/**
	 * @param lastStatusAccepted the lastStatusAccepted to set
	 */
	public void setLastStatusAccepted(Long lastStatusAccepted) {
		this.lastStatusAccepted = lastStatusAccepted;
	}
}
