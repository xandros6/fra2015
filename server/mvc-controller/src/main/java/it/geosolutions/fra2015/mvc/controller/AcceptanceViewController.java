/*
 *  fra2015
 *  https://github.com/geosolutions-it/fra2015
 *  Copyright (C) 2007-2013 GeoSolutions S.A.S.
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
package it.geosolutions.fra2015.mvc.controller;

import static it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.SESSION_USER;
import static it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.TEXT_STATIC_TABLE;
import it.geosolutions.fra2015.entrypoint.model.CountryValues;
import it.geosolutions.fra2015.entrypoint.model.Update;
import it.geosolutions.fra2015.entrypoint.model.Updates;
import it.geosolutions.fra2015.mvc.concurrency.BasicConcurrencyHandler;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices;
import it.geosolutions.fra2015.mvc.controller.utils.FeedbackHandler;
import it.geosolutions.fra2015.mvc.controller.utils.SessionUtils;
import it.geosolutions.fra2015.mvc.controller.utils.StatusUtils;
import it.geosolutions.fra2015.mvc.controller.utils.VariableNameUtils;
import it.geosolutions.fra2015.mvc.controller.utils.VariableNameUtils.VariableName;
import it.geosolutions.fra2015.server.model.survey.CompactValue;
import it.geosolutions.fra2015.server.model.survey.Feedback;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.FeedbackService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.InternalErrorServiceEx;
import it.geosolutions.fra2015.services.utils.UserUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Lorenzo Natali
 * 
 * This is the Country Acceptance controller 
 * 
 * 
 */
@Controller
public class AcceptanceViewController{ 

    @Autowired
    private ControllerServices utils;

    @Autowired
    private FeedbackService feedbackService;
    
    @Autowired
    private BasicConcurrencyHandler concurencyHandler;
    
    private final Logger LOGGER = Logger.getLogger(AcceptanceViewController.class);
    
    /**
     * This value is used in select box for mark an Empty Value. 
     * Note if this value is added in a text cell the meaning is the same: the value on DB will be erased.
     */
    private static final String ERASE_VALUE = "---";
    
    @RequestMapping(value = "/acceptance/view/{question}", method = RequestMethod.GET)
    public String handleGet(@PathVariable(value = "question") String question, Model model,
            HttpSession session) {

        concurencyHandler.loadQuestionRevision(session, Long.parseLong(question));
        
        Long questionLong = Long.parseLong(question); 
        try{
            Integer.parseInt(question);
        }
        catch(Exception e){
            model.addAttribute("context", "survey");
            model.addAttribute("question", 0);
            session.invalidate();
            return "login";
        }
        User su = (User) session.getAttribute(SESSION_USER);
        if(su ==null){
            return "login";
        }
        model.addAttribute("question", question);
        model.addAttribute("context", "survey");
        
       
        String iso3 = UserUtil.getSingleIso3(su);
        String status = utils.getStatusByCountry(iso3);
        model.addAttribute("profile", ControllerServices.Profile.VALIDATOR.toString());
        
        String statusLocale= StatusUtils.getStatusLocaleCode(status);
        // Set the parameter operationWR, the domain is "WRITE" "READ"
        model.addAttribute("statuscode",statusLocale);
        model.addAttribute("country", iso3);
        model.addAttribute("status",status);    
        CountryValues cv = SessionUtils.retrieveQuestionValueAndStoreInSession(utils, session, questionLong, iso3);
        utils.prepareHTTPRequest(model, question, cv, false);

        return "validator";

    }
    
    


}
