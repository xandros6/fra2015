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
package it.geosolutions.fra2015.mvc.controller;

import javax.servlet.http.HttpSession;

import it.geosolutions.fra2015.server.model.user.User;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author DamianoG
 *
 */
@Controller
@RequestMapping("/reviewersubmit")
public class ReviewerSubmitController {

    private final Logger LOGGER = Logger.getLogger(ReviewerSubmitController.class);
    
    @RequestMapping(method = RequestMethod.GET)
    public String handleGet(HttpSession session){
        
        User su = (User) session.getAttribute("sessionUser");
        if(su==null){
            return "redirect:/login";
        }
        
        su.getQuestions();
        
        return "eeeeeeee";
        
    }
}