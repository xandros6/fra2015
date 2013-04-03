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

import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.exception.InternalErrorServiceEx;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author DamianoG
 * 
 */
@Controller
public class PrintController {

    @Autowired
    private ControllerServices utils;

    Logger LOGGER = Logger.getLogger(PrintController.class);

    @RequestMapping(value = "/survey/print/{country}/{mode}", method = RequestMethod.GET)
    public String printWelcome(@PathVariable(value = "country") String country, @PathVariable(value = "mode") String mode, Model model,
            HttpSession session) throws IllegalArgumentException, InternalErrorServiceEx{

        model.addAttribute("context", "survey");        
        model.addAttribute("profile", ControllerServices.Profile.PRINT.toString());

        if(mode.equalsIgnoreCase("allschema")){
            
            utils.prepareHTTPRequestOnlyVariablesName(model, country);            
        }
        else if(mode.equalsIgnoreCase("onlyvalues")){
            
            utils.prepareHTTPRequest(model, null, utils.retrieveValues(null, country), false);
        }
        else if(mode.equalsIgnoreCase("onlynames")){
            
            utils.prepareHTTPRequest(model, null, utils.retrieveValues(null, country), true);
        }
        else{
            throw new IllegalArgumentException("the mode: '" + mode + "' doesn't exist, valid ones are 'allschema', 'onlyvalues' and 'onlynames'");
        }

        return "survey/print";

    }
}
