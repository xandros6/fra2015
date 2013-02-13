/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.model.survey;

import java.io.Serializable;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author marco
 */
@XmlRootElement(name = "Survey")
@XmlAccessorType(XmlAccessType.NONE)
public class Survey implements Serializable {
    

    @XmlElement
    private String name;
    private List<Element> elements;
    
  

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @XmlElementWrapper(name = "Elements")
    @XmlElements({
        @XmlElement(name = "session", type = Session.class),
        @XmlElement(name = "question", type = Question.class)})
    public List<Element> getElements() {
        return elements;
    }

    public void setElements(List<Element> elements) {
        this.elements = elements;
    }
    

    
}
