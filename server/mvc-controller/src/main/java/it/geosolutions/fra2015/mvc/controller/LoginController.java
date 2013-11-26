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
import static it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.SURVEY_INSTANCES;
import it.geosolutions.fra2015.mvc.concurrency.BasicConcurrencyHandler;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices;
import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.UserService;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

    Logger LOGGER = Logger.getLogger(LoginController.class);
    
    @Autowired
    @Qualifier("userService")
    private UserService userService;
    
    @Autowired
    private ControllerServices controllerServices;
    
    @Autowired
    private BasicConcurrencyHandler concurencyHandler;
    
    @RequestMapping(value = "/dologin", method = RequestMethod.GET)
    public String processForm(@ModelAttribute("login") User user, BindingResult result, Map model,
            HttpSession session, Locale locale) {

        // Retrieve the UserDetails from SecurityContext
        UserDetails userDetails = null;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
             userDetails = (UserDetails) auth.getPrincipal();
        }
        // Retrieve the user userDetails.getUsername() from DB
        User storedUser = null;
        try {
            storedUser = userService.get(userDetails.getUsername());
        } catch (NotFoundServiceEx e) {
            LOGGER.error(e.getMessage(), e);
            return "login";
        }
        if (result.hasErrors()) {
            return "login";
        }
        
        //if(Profile.REVIEWER.toString().toLowerCase().equals(storedUser.getRole())){

            // Retrieve all the SurveyInstances from DB and put in session as Map indexed by iso3 country            
            if(storedUser.getCountriesSet() !=null && !storedUser.getCountriesSet().isEmpty()){
                
                List<String> countries = new ArrayList<String>();
                for(Country el : storedUser.getCountriesSet()){
                    
                    countries.add(el.getIso3());
                }
                String [] countriesArr = new String[countries.size()];
                
                // Retrieve all SurveyInstances
                String countryName = "name_" + locale;
                List<SurveyInstance> surveyInstanceList = controllerServices.retriveSurveyListByCountries(countries.toArray(countriesArr), -1, -1, countryName);
                
                Map<String, SurveyInstance> surveyInstancesMap = new HashMap<String, SurveyInstance>();
                for(SurveyInstance el : surveyInstanceList){
                    
                    surveyInstancesMap.put(el.getCountry().getIso3(), el);
                }
                session.setAttribute(SURVEY_INSTANCES, surveyInstancesMap);
            }
        //}
        
        
        // Store the User in session
        session.setAttribute(SESSION_USER, storedUser);

        if(LOGGER.isInfoEnabled()) {
            String c = "";
            if (storedUser.getCountriesSet()!= null && storedUser.getCountriesSet().size()==1) {
                c =  " ("+storedUser.getCountriesSet().iterator().next().getIso3()+")";
            }

            LOGGER.info("User " + storedUser.getUsername() + c + " is logging in" );
        }
        
        return "redirect:/";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap model) {

        return "login";

    }

    @RequestMapping(value = "/loginfailed", method = RequestMethod.GET)
    public String loginerror(ModelMap model) {

        model.addAttribute("error", "true");
        return "login";

    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(ModelMap model, HttpSession session) {

        //User su = (User) session.getAttribute(SESSION_USER);
        //concurencyHandler.purgeDataForUser(su);
        session.invalidate();
        return "login";

    }

}
