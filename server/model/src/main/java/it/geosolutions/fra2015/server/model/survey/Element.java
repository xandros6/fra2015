/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.model.survey;

import java.io.Serializable;
import javax.persistence.Column;
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
    
    @Column(nullable = false, updatable = false)
    private String title;
    @Column(nullable = true, updatable = false)
    private String description;
    @Column(nullable = true, updatable = false)
    private String helpLink;
    @Column(nullable = true, updatable = false)
    private String tooltip;
    @Column(nullable = true, updatable = false)
    private Boolean noCount;
    
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getHelpLink() {
        return helpLink;
    }

    public void setHelpLink(String helpLink) {
        this.helpLink = helpLink;
    }

    public String getTooltip() {
        return tooltip;
    }

    public void setTooltip(String tooltip) {
        this.tooltip = tooltip;
    }

    public Boolean getNoCount() {
        return noCount;
    }

    public void setNoCount(Boolean noCount) {
        this.noCount = noCount;
    }

    @XmlTransient
    public Element getParent() {
        return parent;
    }

    public void setParent(Element parent) {
        this.parent = parent;
    }

    @XmlTransient
    public Survey getSurvey() {
        return survey;
    }

    public void setSurvey(Survey survey) {
        this.survey = survey;
    }
    
    
    
}
