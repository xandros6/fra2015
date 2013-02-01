/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.model.survey;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlRootElement;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.IndexColumn;

/**
 *
 * @author marco
 */
@Entity(name = "Survey")
@Table(name = "fra_survey" )
@XmlRootElement(name = "Survey")
@XmlAccessorType(XmlAccessType.NONE)
public class Survey implements Serializable {
    
    @Id
    @GeneratedValue
    @XmlElement
    private Long id;
    
    @Column(nullable = false, updatable = false, unique=true)
    @XmlElement
    private String name;
    
    
    @OneToMany(mappedBy = "survey", cascade= javax.persistence.CascadeType.PERSIST, fetch = FetchType.EAGER)
    @Cascade({CascadeType.SAVE_UPDATE})
    @JoinColumn(name="survey_id", referencedColumnName="id")
    @IndexColumn(name="id", base=0)
    private List<Element> elements;
    
    public Survey(){
        elements = new ArrayList<Element>();
    } 
    
  
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @XmlElementWrapper(name = "Elements")
    @XmlElements({
        @XmlElement(name = "session", type = Session.class),
        @XmlElement(name = "question", type = Question.class)})
    public List<Element> getElements() {
        return elements;
    }

    public void setEntries(List<Element> elements) {
        this.elements = elements;
    }
    
    
}
