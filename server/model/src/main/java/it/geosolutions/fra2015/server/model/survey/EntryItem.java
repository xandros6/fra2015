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
    
    
    
}
