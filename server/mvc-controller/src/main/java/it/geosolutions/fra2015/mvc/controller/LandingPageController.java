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
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;
import it.geosolutions.fra2015.server.model.user.User;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Lorenzo Natali
 *
 */
@Controller
@RequestMapping("/")
public class LandingPageController {
    
    @RequestMapping(method = RequestMethod.GET)
    public String printWelcome(HttpSession session) {
    		User user= (User) session.getAttribute(SESSION_USER);
    		String role = (user!=null)?user.getRole():null;
    		if(role == null){
    			return "redirect:login";
    			
    		}else if(Profile.CONTRIBUTOR.toString().equalsIgnoreCase(role)){
    			
    			return "redirect:survey/0";

    		}else if(Profile.REVIEWER.toString().equalsIgnoreCase(role)){
    			
    			return "redirect:revieweractivitylog";
                } else if (Profile.EDITOR.toString().equalsIgnoreCase(role)) {
        
                    return "redirect:editoractivitylog";
                }
    		else if(Profile.ADMIN.toString().equalsIgnoreCase(role)){
    			
    			return "redirect:users/";
    		}else if(Profile.VALIDATOR.toString().equalsIgnoreCase(role)){
    		return "redirect:acceptance/view/0";
    		}
    		return "redirect:login";
    		
            

    }
}
