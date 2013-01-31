/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.dao.demo;

import it.geosolutions.fra2015.server.model.survey.Element;
import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.server.model.survey.EntryItem;
import it.geosolutions.fra2015.server.model.survey.Question;
import it.geosolutions.fra2015.server.model.survey.Session;
import it.geosolutions.fra2015.server.model.survey.Survey;
import java.io.File;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

/**
 *
 * @author marco
 */
public class Demo {
    
    public static void main(String[] args) throws JAXBException{
        JAXBContext jc = JAXBContext.newInstance(
                            Survey.class, Element.class, Session.class, 
                            Question.class, Entry.class, EntryItem.class);

        Unmarshaller unmarshaller = jc.createUnmarshaller();
        File xml = new File("test.xml");
        Survey survey = (Survey) unmarshaller.unmarshal(xml);

        Marshaller marshaller = jc.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        marshaller.marshal(survey, System.out);
    }
    
}
