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
 * This class represents a textual value
 * @author marco
 */
@Entity(name = "TextValue")
@Table(name = "fra_txt_value" )
@XmlRootElement(name = "TextValue")
public class TextValue implements Serializable {
    @Id
    @GeneratedValue
    private Long id;
    
    @Column(nullable = false, updatable = false)
    private String country;
    @Column(nullable = false, updatable = true)
    private String itemValue;
    @ManyToOne
    @JoinColumn(name="item_id", nullable=false)
    private EntryItem entryItem;
    @Column(nullable = true, updatable = false)
    private Integer rowNumber;

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

    public String getValue() {
        return itemValue;
    }

    public void setValue(String value) {
        this.itemValue = value;
    }

    public EntryItem getEntryItem() {
        return entryItem;
    }

    public void setEntryItem(EntryItem entryItem) {
        this.entryItem = entryItem;
    }

    public Integer getRow() {
        return rowNumber;
    }

    public void setRow(Integer row) {
        this.rowNumber = row;
    }
      
}
