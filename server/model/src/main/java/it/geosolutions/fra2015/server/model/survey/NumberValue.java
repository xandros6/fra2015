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
 * This class represents a numerical value
 * @author marco
 */
@Entity(name = "NumberValue")
@Table(name = "fra_num_value" )
@XmlRootElement(name = "NumberValue")
public class NumberValue extends Value {
    
   
    @Column(name="fra_value", nullable = false, updatable = true)
    private Number value;

    public Number getValue() {
        return value;
    }

    public void setValue(Number itemValue) {
        this.value = itemValue;
    }
   
    
    
    
}
