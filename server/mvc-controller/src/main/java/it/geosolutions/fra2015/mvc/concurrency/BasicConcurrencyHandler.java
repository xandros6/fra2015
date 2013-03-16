/*
 *  fra2015
 *  https://github.com/geosolutions-it/fra2015
 *  Copyright (C) 2007-2012 GeoSolutions S.A.S.
 *  http://www.geo-solutions.it
 *
 *  GPLv3 + Classpath exception
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package it.geosolutions.fra2015.mvc.concurrency;

import static it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.SESSION_USER;
import it.geosolutions.fra2015.entrypoint.SurveyServiceEntryPoint;
import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.Question;
import it.geosolutions.fra2015.server.model.survey.QuestionRevision;
import it.geosolutions.fra2015.server.model.user.User;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author DamianoG
 * 
 *         This class is responsible for handle the concurrency write access to questions values.
 * 
 *         The logic is the most simple way to obtain a secure access: when the user call the service for RETRIEVE the data in WRITE MODE, obtain the
 *         current CountryUpdate version. When the write action is performed, before SAVE the data check if the last CountryUpdate is equals to that
 *         assigned during the retrival action.
 */
public class BasicConcurrencyHandler {

    @Autowired
    private SurveyServiceEntryPoint surveyService;
    
    private static final Logger LOGGER = Logger.getLogger(BasicConcurrencyHandler.class);

    public enum ConcurrencyKeys {
        COUNTRY_REVISION
    }

    public void loadQuestionRevision(HttpSession session, Long questionNumber){
        
        String countryrevision = ConcurrencyKeys.COUNTRY_REVISION.toString();
        
        User usr = (User)session.getAttribute(SESSION_USER);
        String country = usr.getCountries();
        
        session.removeAttribute(countryrevision);
        
        Question question = surveyService.findQuestion(questionNumber);
        Country countryEntity = surveyService.searchCountry(country);
            
        QuestionRevision qr = surveyService.getQuestionRevisionNumber(countryEntity, question);
        if(qr == null){
            QuestionRevision qrNew = new QuestionRevision();
            qrNew.setVersion(0l);
            qrNew.setQuestion(question);
            qrNew.setCountry(countryEntity);
            surveyService.insertQuestionRevisionNumber(qrNew);
            qr = surveyService.getQuestionRevisionNumber(countryEntity, question);
        }
        session.setAttribute(countryrevision, qr);            
        
        
        
    }
    
    public boolean updateQuestionRevision(HttpSession session, Long question){
        String countryVersion = ConcurrencyKeys.COUNTRY_REVISION.toString();
        
        QuestionRevision countryUpdate = (QuestionRevision)session.getAttribute(countryVersion);
        User user = (User)session.getAttribute("User");
        
        return surveyService.updateQuestionRevisionNumber(countryUpdate);
    }
    
    public static boolean genericEnumValidator(Class enumerator, String valueToCheck) {

        try {
            Enum.valueOf(enumerator, valueToCheck);
        } catch (Exception e) {
            LOGGER.error("The value '" + valueToCheck + "' don't match with domain specified by "
                    + enumerator);
            return false;
        }
        return true;
    }

}
