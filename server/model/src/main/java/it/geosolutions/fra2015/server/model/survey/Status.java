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
 *
 * @author marco
 */
@Entity(name = "Status")
@Table(name = "fra_status" )
@XmlRootElement(name = "Status")
public class Status implements Serializable {
    
    @Id
    @GeneratedValue
    private Long id;
    
    @Column(nullable = true, updatable = true)
    private String message;
    @Column(nullable = false, updatable = true)
    private String status;
    
    @Column(nullable = true, updatable = true)
    private Long lastContributorSubmission;
    
    @Column(nullable = true, updatable = true)
    private String reviewerSubmit;
    
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
    
    
    
}
