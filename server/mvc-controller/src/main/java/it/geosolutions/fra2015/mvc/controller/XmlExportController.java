/*
 *  fra2015
 *  https://github.com/geosolutions-it/fra2015
 *  Copyright (C) 2013 GeoSolutions S.A.S.
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

import it.geosolutions.fra2015.entrypoint.SurveyServiceEntryPoint;
import it.geosolutions.fra2015.server.model.survey.Value;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

import org.apache.commons.lang.StringEscapeUtils;
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
public class XmlExportController {

    @Autowired
    private SurveyServiceEntryPoint surveyService;

    Logger LOGGER = Logger.getLogger(PrintController.class);

    @RequestMapping(value = "/export/{country}", headers="Accept=application/xml", method = RequestMethod.GET)
    public /*@ResponseBody List<Value>*/ String handleGet(@PathVariable(value = "country") String country, Model model, HttpSession session)
            throws IllegalArgumentException {

        // Return A list of EntryValues that represents the full dump of the survey for a given country
        // * Iterate over ALL EntryItem and build the name with the Help of VariableNameUtils.buildVariableAsText(...).

        List<Value> values = null;
        try {

            values = surveyService.getValues(country, null);
        } catch (BadRequestServiceEx e) {

            LOGGER.error(e.getMessage(), e);
        }

        ByteArrayOutputStream tmp = null;
        ByteArrayOutputStream result = new ByteArrayOutputStream();
        try {

            for (Value el : values) {

                tmp = new ByteArrayOutputStream();
                JAXBContext context;
                try {
                    
                    context = JAXBContext.newInstance(Value.class);
                    Marshaller marshaller = context.createMarshaller();
                    marshaller.setProperty("jaxb.fragment", Boolean.TRUE);
                    marshaller.marshal(el, tmp);
                    tmp.flush();
                    tmp.writeTo(result);
                    tmp.close();
                } catch (JAXBException e) {
                
                    LOGGER.error(e.getMessage(), e);
                }
            }
            result.flush();
            model.addAttribute("outSurvey",StringEscapeUtils.escapeXml(result.toString()));
            return "/admin/exportxml";
        } catch (IOException e) {

            LOGGER.error(e.getMessage(), e);
        } finally {

            if (tmp != null) {

                try {
                    tmp.close();
                } catch (IOException e) {
                    LOGGER.error(e.getMessage(), e);
                }
            }
            if (result != null) {

                try {
                    result.close();
                } catch (IOException e) {
                    LOGGER.error(e.getMessage(), e);
                }
            }
        }
        return null;
//        return values;

    }
}