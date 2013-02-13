/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.services.rest.impl;

import it.geosolutions.fra2015.server.model.survey.CompactValue;
import it.geosolutions.fra2015.server.model.survey.Element;
import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.server.model.survey.EntryItem;
import it.geosolutions.fra2015.server.model.survey.Question;
import it.geosolutions.fra2015.server.model.survey.Session;
import it.geosolutions.fra2015.server.model.survey.Survey;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;
import it.geosolutions.fra2015.services.rest.SurveyService;
import it.geosolutions.fra2015.services.rest.exception.BadRequestWebEx;
import it.geosolutions.fra2015.services.rest.exception.NotFoundWebEx;
import it.geosolutions.fra2015.services.rest.model.ExtendedSurvey;
import it.geosolutions.fra2015.services.rest.model.Update;
import it.geosolutions.fra2015.services.rest.model.Updates;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import javax.ws.rs.core.SecurityContext;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import org.apache.log4j.Logger;

/**
 *
 * @author marco
 */
public class SurveyServiceImpl implements SurveyService {

    private final static Logger LOGGER = Logger.getLogger(SurveyServiceImpl.class);
    private it.geosolutions.fra2015.services.SurveyService surveyService;

    public void setSurveyService(it.geosolutions.fra2015.services.SurveyService surveyService) {
        this.surveyService = surveyService;
    }

    @Override
    public List<Entry> updateValues(SecurityContext sc, Updates updates) {
        try {
            List<Entry> result = new ArrayList<Entry>();
            if (updates.getUpdates() != null) {
                for (Update update : updates.getUpdates()) {
                    Entry entry = surveyService.updateValues(
                            update.getCountry(),
                            update.getVariable(),
                            update.getRow(),
                            update.getColumn(),
                            update.getValue());
                    if (entry != null) {
                        result.add(entry);
                    }

                }
            }
            return result;
        } catch (BadRequestServiceEx ex) {
            throw new BadRequestWebEx(ex.getMessage());
        } catch (NotFoundServiceEx ex) {
            throw new NotFoundWebEx(ex.getMessage());
        }

    }

    @Override
    public ExtendedSurvey getSurveyAndValues(SecurityContext sc, String countryId) throws BadRequestServiceEx, NotFoundServiceEx {

        if (countryId == null) {
            throw new BadRequestServiceEx("Missing parameter country");
        }

        try {

            // create a survey from template
            Survey survey = null;
            try {
                JAXBContext jc = JAXBContext.newInstance(
                        Survey.class, Element.class, Session.class,
                        Question.class, Entry.class, EntryItem.class);
                Unmarshaller unmarshaller = jc.createUnmarshaller();
                File xml = new File("template.xml");
                survey = (Survey) unmarshaller.unmarshal(xml);
            } catch (JAXBException ex) {
                java.util.logging.Logger.getLogger(SurveyServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }

            // returns a survey schema with along values
            ExtendedSurvey ext = new ExtendedSurvey();
            ext.setSurvey(survey);
            List<CompactValue> values = surveyService.getAllValues(countryId);
            ext.setValues(values);
            return ext;

        } catch (BadRequestServiceEx ex) {
            throw new BadRequestWebEx(ex.getMessage());
        } catch (NotFoundServiceEx ex) {
            throw new NotFoundWebEx(ex.getMessage());
        }
    }

    @Override
    public Survey create(SecurityContext sc, Survey survey) {
        try {
            // save or update entries in this survey
            save(survey.getElements());
            return survey;
        } catch (BadRequestServiceEx ex) {
            throw new BadRequestWebEx(ex.getMessage());
        } catch (NotFoundServiceEx ex) {
            throw new NotFoundWebEx(ex.getMessage());
        }
    }

    private void save(Object obj) throws BadRequestServiceEx, NotFoundServiceEx {

        if (obj == null) {
            return;
        }

        if (obj instanceof List) {
            List<Element> elements = (List<Element>) obj;
            for (Element e : elements) {
                save(e);
            }
        } else if (obj instanceof Session) {
            Session s = (Session) obj;
            save(s.getElements());
        } else if (obj instanceof Entry) {
            surveyService.upsert((Entry) obj);
        }
    }
}
