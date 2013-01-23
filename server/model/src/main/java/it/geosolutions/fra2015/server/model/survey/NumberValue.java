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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * This class represents a numerical value
 * @author marco
 */
@Entity(name = "NumberValue")
@Table(name = "fra_num_value" )
@XmlRootElement(name = "NumberValue")
public class NumberValue implements Serializable {
    
    @Id
    @GeneratedValue
    private Long id;
    
    @Column(nullable = false, updatable = false)
    private String country;
    @Column(nullable = false, updatable = true)
    private Number itemValue;
    @ManyToOne
    @JoinColumn(name="item_id", nullable=false)
    private EntryItem entryItem;

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

    public Number getValue() {
        return itemValue;
    }

    public void setValue(Number value) {
        this.itemValue = value;
    }

    public EntryItem getEntryItem() {
        return entryItem;
    }

    public void setEntryItem(EntryItem entryItem) {
        this.entryItem = entryItem;
    }
    
    
    
}
