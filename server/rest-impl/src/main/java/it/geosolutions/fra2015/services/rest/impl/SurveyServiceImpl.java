/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.services.rest.impl;

import it.geosolutions.fra2015.entrypoint.SurveyServiceEntryPoint;
import it.geosolutions.fra2015.entrypoint.model.CountryValues;
import it.geosolutions.fra2015.entrypoint.model.Update;
import it.geosolutions.fra2015.entrypoint.model.Updates;
import it.geosolutions.fra2015.server.model.survey.CompactValue;
import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.Element;
import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.server.model.survey.EntryItem;
import it.geosolutions.fra2015.server.model.survey.Question;
import it.geosolutions.fra2015.server.model.survey.QuestionRevision;
import it.geosolutions.fra2015.server.model.survey.Session;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.survey.Survey;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;
import it.geosolutions.fra2015.services.SurveyCatalog;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;
import it.geosolutions.fra2015.services.rest.exception.BadRequestWebEx;
import it.geosolutions.fra2015.services.rest.exception.InternalErrorWebEx;
import it.geosolutions.fra2015.services.rest.exception.NotFoundWebEx;
import it.geosolutions.fra2015.services.rest.model.ExtendedSurvey;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.core.SecurityContext;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import org.apache.log4j.Logger;
import org.springframework.core.io.Resource;

/**
 * 
 * This class implements the SurveyServiceEntryPoint Interface.
 * This implementation uses the Interface it.geosolutions.fra2015.services.SurveyServices
 * 
 * @author marco
 */
public class SurveyServiceImpl implements SurveyServiceEntryPoint {

    private final static Logger LOGGER = Logger.getLogger(SurveyServiceImpl.class);

    private it.geosolutions.fra2015.services.SurveyService surveyService;

    private Resource templateResource; // quick fix by etj on 20130221. This file will be injected in webapp. Needs to be injected in tests too.
    
    public void setSurveyService(it.geosolutions.fra2015.services.SurveyService surveyService) {
        this.surveyService = surveyService;
    }

    @Override
    public List<Entry> updateValues(Updates updates) {
        try {
            List<Entry> result = new ArrayList<Entry>();
            if (updates.getUpdates() != null) {
                for (Update update : updates.getUpdates()) {
                    Entry entry = surveyService.updateValues(update.getCountry(),
                            update.getVariable(), update.getRow(), update.getColumn(),
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
    public boolean removeValues(Updates removes) {
        
        try {
            
            if (removes.getUpdates() != null) {
                for (Update update : removes.getUpdates()) {
                    if (!surveyService.removeValues(update.getCountry(), update.getVariable(),
                            update.getRow(), update.getColumn(), update.getValue())) {
                        return false;
                    }
                }
            }
            return true;
        } catch (BadRequestServiceEx ex) {
            throw new BadRequestWebEx(ex.getMessage());
        } catch (NotFoundServiceEx ex) {
            throw new NotFoundWebEx(ex.getMessage());
        }

    }

    @Override
    public CountryValues getCountryAndQuestionValues(String iso3CountryId, Integer questionNumber)
            throws BadRequestServiceEx {

        if (iso3CountryId == null) {
            throw new BadRequestServiceEx("Missing parameter country");
        }
        
        try {
            CountryValues countryValues = new CountryValues();
            List<CompactValue> values = surveyService.getQuestionCountryValues(iso3CountryId, questionNumber);
            countryValues.setValues(values);
            return countryValues;

        } catch (BadRequestServiceEx ex) {
            throw new BadRequestWebEx(ex.getMessage());
        } 
    }

    @Override
    public Survey create(Survey survey) {
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

    @Override
    public String changeStatus(Status status) {
        try {
            return surveyService.changeStatus(status);
        } catch (BadRequestServiceEx ex) {
            throw new BadRequestWebEx(ex.getMessage());
        } catch (NotFoundServiceEx ex) {
            throw new NotFoundWebEx(ex.getMessage());
        }
    }
    
    @Override
    public QuestionRevision getQuestionRevisionNumber(Country country, Question questionNumber){
        
        return surveyService.findQuestionRevision(country, questionNumber);
    }
    
    @Override
    public boolean updateQuestionRevisionNumber(QuestionRevision revision){
        
        return surveyService.updateQuestionRevision(revision);
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
        } else if (obj instanceof Question) {
        	 surveyService.upsert((Question) obj);
        } else if (obj instanceof Session) {
            Session s = (Session) obj;
            save(s.getElements());
        } else if (obj instanceof Entry) {
            surveyService.upsert((Entry) obj);
        }
    }

    public void setTemplateResource(Resource templateResource) {
        this.templateResource = templateResource;
    }

    /* (non-Javadoc)
     * @see it.geosolutions.fra2015.entrypoint.SurveyServiceEntryPoint#insertQuestionRevisionNumber(it.geosolutions.fra2015.server.model.survey.QuestionRevision)
     */
    @Override
    public void insertQuestionRevisionNumber(QuestionRevision qr) {
        surveyService.insertQuestionRevision(qr);
    }

    /* (non-Javadoc)
     * @see it.geosolutions.fra2015.entrypoint.SurveyServiceEntryPoint#find(java.lang.Long)
     */
    @Override
    public Question findQuestion(Long questionNumber) {
        return surveyService.findQuestion(questionNumber);
    }

    /* (non-Javadoc)
     * @see it.geosolutions.fra2015.entrypoint.SurveyServiceEntryPoint#search(java.lang.String)
     */
    @Override
    public Country searchCountry(String iso3) {
        return surveyService.searchCountry(iso3);
    }

	@Override
	public List<SurveyInstance> getSurveysByCountry(String[] country,int page,int index) {
		return surveyService.getSurveysByCountry(country,page,index);
		
	}

}
