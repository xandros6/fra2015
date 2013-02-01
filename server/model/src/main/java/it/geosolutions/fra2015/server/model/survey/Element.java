/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.model.survey;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author marco
 */
@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
@XmlRootElement(name = "Element")
@XmlSeeAlso({Question.class, Session.class, Entry.class})
public class Element implements Serializable {
    
    @Id   
    @GeneratedValue(strategy = GenerationType.TABLE)
    private Long id;
    

    
    @ManyToOne(optional=true)
    @JoinColumn(name="parent_id", referencedColumnName="id")
    protected Element parent;
    
    @ManyToOne(optional=true)
    @JoinColumn(name="survey_id", referencedColumnName="id")
    private Survey survey;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

  

    @XmlTransient
    public Survey getSurvey() {
        return survey;
    }

    public void setSurvey(Survey survey) {
        this.survey = survey;
    }
    @XmlTransient
    public Element getParent() {
        return parent;
    }

    public void setParent(Element parent) {
        this.parent = parent;
    }
    
    
    
}
