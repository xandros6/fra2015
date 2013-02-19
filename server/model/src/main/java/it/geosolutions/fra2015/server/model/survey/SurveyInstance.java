/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.model.survey;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * a survey instance is a particular survey associated to a country
 * I need it to distinguish a survey "entity" from the xml template
 *  
 * @author marco
 */
@Entity(name = "SurveyInstance")
@Table(name = "fra_survey" )
public class SurveyInstance implements Serializable {
    
    @Id
    @GeneratedValue
    private Long id;
    
    @OneToOne(cascade= CascadeType.ALL, optional=false)
    private Status status;
    
    @OneToOne
    private Country country;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }
    
    
    
    
}
