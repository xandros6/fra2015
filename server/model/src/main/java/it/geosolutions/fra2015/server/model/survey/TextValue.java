/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.model.survey;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * This class represents a textual value
 * @author marco
 */
@Entity(name = "TextValue")
@Table(name = "fra_txt_value" )
@XmlRootElement(name = "TextValue")
public class TextValue extends Value {
   
    @Column(name="fra_value", nullable = false, updatable = true)
    private String value;

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
   


    
      
}
