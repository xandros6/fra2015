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

import freemarker.template.TemplateException;
import it.geosolutions.fra2015.mvc.controller.utils.FlashAttributesHandler;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.SurveyService;
import it.geosolutions.fra2015.services.UserService;
import it.geosolutions.fra2015.services.mail.FraMailException;
import it.geosolutions.fra2015.services.mail.NotificationSerivice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Lorenzo Natali
 * (for now only mail notification message test)
 */
@Controller
public class MailTestController {
    private static final Logger LOGGER = Logger.getLogger(MailTestController.class);
    @Autowired
    private UserService userService;
    
    @Autowired
    private NotificationSerivice notificationService;

    @Autowired
    private SurveyService surveyService;
    
   
    
    
    @RequestMapping(value = "/admin/mailer", method = RequestMethod.GET)
    public String handleGet(Model model, HttpSession session) {
       buildModel(model);
       return "admin";

    }
    private void buildModel(Model model){
        Map<String,Map<String,String>> messages =notificationService.getMessages();
        model.addAttribute("templates",messages);
        model.addAttribute("context","mailer");
        Map <String,String> roles = new HashMap<String,String>();
        roles.put("contributor","Contributor");
        roles.put("reviewer","Reviewer");
        roles.put("editor","Review Editor");
        roles.put("validator","Country Validator");
        model.addAttribute("roles",roles);
        model.addAttribute("countries", surveyService.getCountries());
        Map <String,String> lang = new HashMap<String,String>();
        lang.put("en","English");
        lang.put("fr","French");
        lang.put("es","Spanish");
        model.addAttribute("mailLanguage",lang);

    }
    @RequestMapping(value = "/admin/mailer", method = RequestMethod.POST)
    public String handlePost(Model model, HttpSession session,HttpServletRequest request) {
        model.addAttribute("context","mailer");
        String role = request.getParameter("role");
        String template = request.getParameter("template");
        String iso3 =request.getParameter("country");
        String customText = request.getParameter("customtext");
        String address = request.getParameter("address");
        String language = request.getParameter("userLang");
        List<User> receivers =null;
        if(role==null){
            if (address == null){
                composeErrorMessage(model,"reciver not specified");
                buildModel(model);
                return "admin";
            }else{
                receivers = new ArrayList<User>();
                User r = new User();
                r.setEmail(address);
                r.setUsername("TEST");
                r.setName("Test User");
                r.setLanguage(language);
                receivers.add(r);
            }
        }else{
            receivers = userService.getUsersToNotify(role, iso3, true);
        
        }if(receivers.size()==0){
            composeErrorMessage(model,"reciver not specified");
            buildModel(model);
            return "admin";
        }
        Status status = new Status();
        status.setCountry(iso3);
        status.setMessage(customText);
        User su = (User) session.getAttribute("sessionUser");
        try {
            
            notificationService.notifyUsers(su, status, receivers, template);
            composeSuccessMessage(model,receivers);
        } catch (IOException e) {
            if(e instanceof FraMailException){
                FlashAttributesHandler.addFlashAttribute(session, "warning", "recipients.not.valid", 10000, null, ((FraMailException) e).getFailedRecipientsNameList());
                LOGGER.error(
                        "Error sending Mail to the following recipients: " + ((FraMailException)e).getFailedRecipientsNameList(),
                        e);
            }
            else{
                LOGGER.error( e.getMessage(), e);
                composeErrorMessage(model,e);
            }
        } catch (TemplateException e) {
            LOGGER.error(e.getMessage(), e);
            composeErrorMessage(model,e);

        } catch(NullPointerException e){
            LOGGER.error(e.getMessage(), e);
            composeErrorMessage(model,e);
        } catch(Exception e ){
            LOGGER.error(e.getMessage(), e);
            composeErrorMessage(model,e);
        }
        buildModel(model);

        return "admin";
 
    }
    private void composeSuccessMessage(Model model, List<User> receivers) {
        model.addAttribute("messageType","success");
        model.addAttribute("messageCode","alert.savesuccess");
        model.addAttribute("notLocalizedMessage",receivers.toString());
        model.addAttribute("messageTimeout",10000);   
        
    }
    private void composeErrorMessage(Model model,Exception e) {
        model.addAttribute("messageType","alert");
        model.addAttribute("messageCode","alert.savefaliure");
        model.addAttribute("notLocalizedMessage",e);
        model.addAttribute("messageTimeout",10000);        
    }
    private void composeErrorMessage(Model model, String message){
        model.addAttribute("messageType","alert");
        model.addAttribute("messageCode","alert.savefaliure");
        model.addAttribute("notLocalizedMessage",message);
        model.addAttribute("messageTimeout",10000);    
    }
}
