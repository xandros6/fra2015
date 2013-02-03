/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.services.rest.model;

import it.geosolutions.fra2015.server.model.survey.CompactValue;
import it.geosolutions.fra2015.server.model.survey.Survey;
import java.io.Serializable;
import java.util.List;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * An extended survey is a survey template plus answer values for a given user
 * @author marco
 */
@XmlRootElement(name = "ExtendedSurvey")
public class ExtendedSurvey implements Serializable{
    
    private Survey survey;
    private List<CompactValue> values; 

    public Survey getSurvey() {
        return survey;
    }

    public void setSurvey(Survey survey) {
        this.survey = survey;
    }

    @XmlElementWrapper(name="Values")
    @XmlElements({
        @XmlElement(name = "value", type = CompactValue.class)})
    public List<CompactValue> getValues() {
        return values;
    }

    public void setValues(List<CompactValue> values) {
        this.values = values;
    }
    
    
    
}
