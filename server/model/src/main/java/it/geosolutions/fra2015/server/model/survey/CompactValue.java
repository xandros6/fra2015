/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.model.survey;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * Simple representation of values as tuple (entryid, row, col, value)
 * @author marco
 */
@XmlRootElement(name = "Value")
public class CompactValue implements Serializable {
    
    private String variable;
    private Integer rowNumber;
    private Integer columnNumber;
    private String content;

    public CompactValue(String variable, Integer rowNumber, Integer columnNumber, String content) {
        this.variable = variable;
        this.rowNumber = rowNumber;
        this.columnNumber = columnNumber;
        this.content = content;
    }

    public CompactValue() {
    }

    public String getVariable() {
        return variable;
    }

    public void setVariable(String variable) {
        this.variable = variable;
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

    /**
     *
     * @return
     */
    @XmlElement
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    
    
}
