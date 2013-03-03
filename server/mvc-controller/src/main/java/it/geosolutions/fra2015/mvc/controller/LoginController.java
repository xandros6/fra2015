package it.geosolutions.fra2015.mvc.controller;
import it.geosolutions.fra2015.mvc.model.SessionUser;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.UserService;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Controller
@RequestMapping("login")
public class LoginController {
        
        Logger LOGGER = Logger.getLogger(LoginController.class);
    
        @Autowired
        @Qualifier("userService")
        private UserService userService;
        
        @RequestMapping(method = RequestMethod.GET)
        public String showForm(Map<String,User> model) {
        		
//                model.put("user", user);
                
                return "login";
        }

        @RequestMapping(method = RequestMethod.POST)
        public String processForm(@ModelAttribute("login") User user,BindingResult result,
                        Map model, HttpSession session) {
                
                User storedUser = null; 
            
                try {
                    storedUser = userService.get("User Algeria");
                } catch (NotFoundServiceEx e) {
                    // TODO Auto-generated catch block
                    LOGGER.error(e.getMessage(), e);
                }
                
                SessionUser us = new SessionUser();
                us.setCountry(storedUser.getCountries());
                session.setAttribute("sessionUser", us);
            
                if (result.hasErrors()) {
                        return "login";
                }
                user = (User) model.get("user");
                
                // check usr 
                
                //model.put("loginForm", loginForm);
                
                return "redirect:survey/0";
        }

}
