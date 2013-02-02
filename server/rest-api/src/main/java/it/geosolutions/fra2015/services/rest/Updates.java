/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.services.rest;

import java.io.Serializable;
import java.util.List;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author marco
 */
@XmlRootElement(name = "BatchUpdate")
public class Updates implements Serializable {
    
    private List<Update> updates;

    @XmlElementWrapper(name="Updates")
    @XmlElements({
        @XmlElement(name = "update", type = Update.class)})
    public List<Update> getUpdates() {
        return updates;
    }

    public void setUpdates(List<Update> updates) {
        this.updates = updates;
    }
    
    
    
    
}
