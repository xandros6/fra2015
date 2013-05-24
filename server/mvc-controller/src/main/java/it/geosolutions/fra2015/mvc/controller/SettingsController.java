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
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.UserService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;
import it.geosolutions.fra2015.services.utils.UserUtil;

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
 * Controller for personal user settings (for now only mail notification message)
 */
@Controller
public class SettingsController {
    private static final Logger LOGGER = Logger.getLogger(SettingsController.class);
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/usersettings", method = RequestMethod.GET)
    public String handleGet(Model model, HttpSession session) {


        User su = (User) session.getAttribute(SESSION_USER);
        if (su==null){
            return "redirect:/";
        }
        String language = su.getLanguage();
        model.addAttribute("mailfavoritelanguage",language);
        
        // Set the parameter operationWR, the domain is "WRITE" "READ"
        model.addAttribute("context","settings");
        

        return getTemplate(su);

    }
    private String getTemplate(User user) {
        if(user==null){ return "redirect:/";}
        String role = user.getRole();
        if(role.equals("contributor")){
            return "index";
        }
        if(role.equals("admin")){
            return "admin";
        }
        if(role.equals("reviewer")){
            return "reviewer";
        }
        if(role.equals("editor")){
            return "editor";
        }
        if(role.equals("validator")){
            return "validator";
        }
        return "redirect:/";
    }
    @RequestMapping(value = "/usersettings", method = RequestMethod.POST)
    public String handlePost(Model model, HttpSession session,HttpServletRequest request) {


        User su = (User) session.getAttribute(SESSION_USER);
        if (su==null){
            return "redirect:/";
        }

        String language = request.getParameter("mailfavoritelanguage");
        model.addAttribute("context","settings");
        User user = null;
        try {
            user = userService.get(su.getUsername());
            if(user==null){
                throw new BadRequestServiceEx("User not found");
            }
            user.setLanguage(language);
            userService.update(user);
            // Store the User in session
            session.setAttribute(SESSION_USER, user);
            model.addAttribute("messageType", "success");
            model.addAttribute("messageCode", "settings.success");
            model.addAttribute("mailfavoritelanguage",language);
            return getTemplate(user);
        } catch (NotFoundServiceEx e) {
            model.addAttribute("messageType", "error");
            model.addAttribute("messageCode", "settings.error");
            model.addAttribute("messageTimeout",10000);
            model.addAttribute("mailfavoritelanguage",su.getLanguage());
            LOGGER.error( e.getMessage(), e);
            return getTemplate(user);
            
        } catch (BadRequestServiceEx e) {
            model.addAttribute("messageType", "error");
            model.addAttribute("messageCode", "settings.error");
            model.addAttribute("messageTimeout",10000);
            model.addAttribute("mailfavoritelanguage",su.getLanguage());
            LOGGER.error( e.getMessage(), e);
            return getTemplate(user);
        }
        

    }
}
