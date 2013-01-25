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
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author marco
 */
@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
@XmlRootElement(name = "Value")
public class Value implements Serializable {
    @Id
    @GeneratedValue
    private Long id;
    
    @Column(nullable = false, updatable = false)
    private String type;
    
    @Column(nullable = false, updatable = false)
    private String country;
    
    @Column(name="fra_value", nullable = false, updatable = true)
    private String value;
    
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public EntryItem getEntryItem() {
        return entryItem;
    }

    public void setEntryItem(EntryItem entryItem) {
        this.entryItem = entryItem;
    }

    public Integer getRowNumber() {
        return rowNumber;
    }

    public void setRowNumber(Integer rowNumber) {
        this.rowNumber = rowNumber;
    }
    
    
}
