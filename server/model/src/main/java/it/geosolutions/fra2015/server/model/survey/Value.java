/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.model.survey;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlSeeAlso;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

/**
 *
 * @author marco
 */
@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
@XmlRootElement(name = "Value")
@XmlSeeAlso({TextValue.class, NumberValue.class})
public abstract class Value implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    private Long id;

    /**
     * fixme: value should refer to a survey, not to a country
     */
    @ManyToOne(fetch = FetchType.LAZY)
    private Country country;
    
    @Transient
    private String content;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @Fetch(value=FetchMode.JOIN)
    @JoinColumn(name="item_id", nullable=false)
    private EntryItem entryItem;

//    /**
//     * The id of a question is the concatenation of Country(in the iso3 form) and The question number
//     */
//    @Column(nullable = true, updatable = false)
//    private String questionId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public EntryItem getEntryItem() {
        return entryItem;
    }

    public void setEntryItem(EntryItem entryItem) {
        this.entryItem = entryItem;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

//    public String getQuestionNumber() {
//        return questionId;
//    }
//
//    public void setQuestionNumber(String questionId) {
//        this.questionId = questionId;
//    }
    
    
    
}
