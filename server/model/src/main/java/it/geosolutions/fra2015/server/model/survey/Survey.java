/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.model.survey;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Embedded;
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
    
    @Column(nullable = false, updatable = false)
    @XmlElement
    private String name;
    
    
    @OneToMany(mappedBy = "survey", cascade= javax.persistence.CascadeType.PERSIST, fetch = FetchType.EAGER)
    @Cascade({CascadeType.SAVE_UPDATE})
    @JoinColumn(name="survey_id", referencedColumnName="id")
    @IndexColumn(name="id", base=0)
    private List<Entry> entries;
    
    public Survey(){
        entries = new ArrayList<Entry>();
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

    @XmlElementWrapper(name = "Entries")
    @XmlElement(name="entry", type=Entry.class)
    public List<Entry> getEntries() {
        return entries;
    }

    public void setEntries(List<Entry> entries) {
        this.entries = entries;
    }
    
    public void addEntry(Entry entry){
        entry.setSurvey(this);
        entries.add(entry);
    }
    
}
