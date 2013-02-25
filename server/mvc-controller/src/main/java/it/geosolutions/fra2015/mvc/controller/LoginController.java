package it.geosolutions.fra2015.mvc.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.validation.BindingResult;

import it.geosolutions.fra2015.mvc.model.DummyFormModel;
import it.geosolutions.fra2015.server.model.user.Password;
import it.geosolutions.fra2015.server.model.user.User;

import java.util.Map;




@Controller
@RequestMapping("login")
public class LoginController {
        @RequestMapping(method = RequestMethod.GET)
        public String showForm(Map model) {
        		User user = new User();
                model.put("user", user);

                return "login";
        }

        @RequestMapping(method = RequestMethod.POST)
        public String processForm(@ModelAttribute("login") User user,BindingResult result,
                        Map model) {
                String userName = "UserName";
                String password = "password";
                if (result.hasErrors()) {
                        return "login";
                }
                //User user = (User) model.get("user");
                
                /* check usr 
                if (!loginForm.getUserName().equals(userName)
                                || !loginForm.getPassword().equals(password)) {
                        return "loginform";
                }
                */
                //model.put("loginForm", loginForm);
                System.out.println(user.toString());
                return "redirect:survey";
        }

}
