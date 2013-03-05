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

import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.UserService;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;

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
    
    @RequestMapping(value = "/dologin", method = RequestMethod.GET)
    public String processForm(@ModelAttribute("login") User user, BindingResult result, Map model,
            HttpSession session) {

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
        // Store the User in session
        session.setAttribute("sessionUser", storedUser);
        
        return "redirect:survey/0";
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
    public String logout(ModelMap model) {

        return "login";

    }

//     @Autowired
//     @Qualifier("userService")
//     private UserService userService;
//    
//     @RequestMapping(method = RequestMethod.GET)
//     public String showForm(Map<String,User> model) {
//    
//     // model.put("user", user);
//    
//     return "login";
//     }
//    
//     @RequestMapping(method = RequestMethod.POST)
//     public String processForm(@ModelAttribute("login") User user,BindingResult result,
//     Map model, HttpSession session) {
//    
//     User storedUser = null;
//    
//     try {
//     storedUser = userService.get("User Algeria");
//     } catch (NotFoundServiceEx e) {
//     // TODO Auto-generated catch block
//     LOGGER.error(e.getMessage(), e);
//     }
//    
//     SessionUser us = new SessionUser();
//     us.setCountry(storedUser.getCountries());
//     session.setAttribute("sessionUser", us);
//    
//     if (result.hasErrors()) {
//     return "login";
//     }
//     user = (User) model.get("user");
//    
//     // check usr
//    
//     //model.put("loginForm", loginForm);
//    
//     return "redirect:survey/0";
//     }

}
