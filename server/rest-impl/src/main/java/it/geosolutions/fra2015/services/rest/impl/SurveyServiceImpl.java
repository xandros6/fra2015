/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.services.rest.impl;

import it.geosolutions.fra2015.server.model.survey.Element;
import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.server.model.survey.EntryItem;
import it.geosolutions.fra2015.server.model.survey.Question;
import it.geosolutions.fra2015.server.model.survey.Session;
import it.geosolutions.fra2015.server.model.survey.Survey;
import it.geosolutions.fra2015.server.model.survey.Value;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;
import it.geosolutions.fra2015.services.rest.SurveyService;
import it.geosolutions.fra2015.services.rest.exception.BadRequestWebEx;
import it.geosolutions.fra2015.services.rest.exception.NotFoundWebEx;
import java.util.List;
import javax.ws.rs.core.SecurityContext;
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
    public Survey create(SecurityContext sc, Survey survey) throws BadRequestServiceEx, NotFoundServiceEx {
        try {
            // TODO refactor using JAXB
            // it is better to create a custom JAXB unmarshaller
            // which sets survey correctly
            // this is needed in order to create proper foreign keys
            for (Element el : survey.getElements()) {
                el.setSurvey(survey);
                backtrace(el);
            }


            return surveyService.create(survey);
        } catch (BadRequestServiceEx ex) {
            throw new BadRequestWebEx(ex.getMessage());
        } catch (NotFoundServiceEx ex) {
            throw new NotFoundWebEx(ex.getMessage());
        }
    }

    @Override
    public List<Survey> getAll(SecurityContext sc, Integer page, Integer entries) throws BadRequestWebEx {
        try {
            return surveyService.getAll();
        } catch (BadRequestServiceEx ex) {
            throw new BadRequestWebEx(ex.getMessage());
        } catch (NotFoundServiceEx ex) {
            throw new NotFoundWebEx(ex.getMessage());
        }
    }

    @Override
    public Entry addValue(SecurityContext sc, Long itemId, Value value) {
        try {
            return surveyService.addValue(itemId, value);
        } catch (BadRequestServiceEx ex) {
            throw new BadRequestWebEx(ex.getMessage());
        } catch (NotFoundServiceEx ex) {
            throw new NotFoundWebEx(ex.getMessage());
        }
    }

    @Override
    public List<Value> getEntryValues(SecurityContext sc, Long itemId, String countryId) throws BadRequestServiceEx, NotFoundServiceEx {

        if (countryId == null) {
            throw new BadRequestServiceEx("Missing parameter countryId");
        }

        try {
            return surveyService.getEntryValues(itemId, countryId);
        } catch (BadRequestServiceEx ex) {
            throw new BadRequestWebEx(ex.getMessage());
        } catch (NotFoundServiceEx ex) {
            throw new NotFoundWebEx(ex.getMessage());
        }
    }

    private void backtrace(Element el) {

        if (el instanceof Session) {
            Session s = (Session) el;
            List<Element> els = s.getElements();
            if (els != null) {
                for (Element e : els) {
                    e.setParent(el);
                    backtrace(e);
                }
            }

        } else if (el instanceof Entry) {
            Entry entry = (Entry) el;
            List<EntryItem> items = entry.getEntryItems();
            if (items != null) {
                for (EntryItem item : items) {
                    item.setEntry(entry);
                }
            }

        }

    }
}
