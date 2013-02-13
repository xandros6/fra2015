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
import javax.xml.bind.annotation.XmlTransient;

/**
 * This class represents a text area or a cell within a table.
 * @author marco
 */
@Entity(name = "EntryItem")
@Table(name = "fra_entry_item" )
@XmlRootElement(name = "EntryItem")
public class EntryItem implements Serializable {
    
    @Id
    @GeneratedValue
    private Long id;
    @Column(nullable = true, updatable = true)
    private Integer rowNumber;
    @Column(nullable = true, updatable = true)
    private Integer columnNumber;
    @ManyToOne
    @JoinColumn(name="entry_id", referencedColumnName="id")
    private Entry entry;
    
    @Column(nullable = true, updatable = false)
    private String rowName;
    @Column(nullable = true, updatable = false)
    private String columnName;
    
    @Column(nullable = true, updatable = false)
    String type;
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getRowNumber() {
        return rowNumber;
    }

    public void setRowNumber(Integer rowNumber) {
        this.rowNumber = rowNumber;
    }

    public Integer getColumnNumber() {
        return columnNumber;
    }

    public void setColumnNumber(Integer columnNumber) {
        this.columnNumber = columnNumber;
    }

    @XmlTransient
    public Entry getEntry() {
        return entry;
    }

    public void setEntry(Entry entry) {
        this.entry = entry;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getRowName() {
        return rowName;
    }

    public void setRowName(String rowName) {
        this.rowName = rowName;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }
    
    
    
}
