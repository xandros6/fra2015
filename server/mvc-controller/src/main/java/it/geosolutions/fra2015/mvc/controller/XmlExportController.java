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
import it.geosolutions.fra2015.mvc.controller.utils.VariableNameUtils;
import it.geosolutions.fra2015.server.model.survey.CompactValue;
import it.geosolutions.fra2015.server.model.survey.EntryItem;
import it.geosolutions.fra2015.server.model.survey.NumberValue;
import it.geosolutions.fra2015.server.model.survey.TextValue;
import it.geosolutions.fra2015.server.model.survey.Value;
import it.geosolutions.fra2015.server.model.xmlexport.BasicValue;
import it.geosolutions.fra2015.server.model.xmlexport.SurveyInfo;
import it.geosolutions.fra2015.server.model.xmlexport.XmlSurvey;
import it.geosolutions.fra2015.services.BulkModelEntitiesLoader;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

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
    private BulkModelEntitiesLoader bulkLoader;

    Logger LOGGER = Logger.getLogger(PrintController.class);

    @RequestMapping(value = "/export/{country}", headers = "Accept=application/xml", method = RequestMethod.GET)
    public/* @ResponseBody List<Value> */String handleGet(
            @PathVariable(value = "country") String country, Model model, HttpSession session)
            throws IllegalArgumentException {

        SurveyInfo surveyInfo = new SurveyInfo();
        surveyInfo.setCountry(country);
        Calendar cal = GregorianCalendar.getInstance();
        cal.setTimeInMillis(System.currentTimeMillis());
        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy.MM.dd 'at' hh:mm:ss a zzz");
        dateFormatter.setTimeZone(TimeZone.getTimeZone("UTC"));
        surveyInfo.setTime(dateFormatter.format(cal.getTime()));

        XmlSurvey survey = new XmlSurvey();
        survey.setInfo(surveyInfo);
        List<BasicValue> valList = new ArrayList<BasicValue>();
        survey.setBasicValues(valList);

        List<EntryItem> entryItems = bulkLoader.loadAllEntryItem();
        List<TextValue> textValues = bulkLoader.loadAllTextValues();
        List<NumberValue> numberValues = bulkLoader.loadAllNumericValues();
        
        for (TextValue el : textValues) {
            
            valList.add(buildBasicValue(el.getValue(), composeEntryItemName(el.getEntryItem()),"text"));
        }
        
        for (NumberValue el : numberValues) {
            
            valList.add(buildBasicValue(String.valueOf(el.getValue().doubleValue()), composeEntryItemName(el.getEntryItem()),"numeric"));
        }
        
//        for (EntryItem el : entryItems) {
//
//            valList.add(buildBasicValue("", composeEntryItemName(el)));
//        }

        ByteArrayOutputStream result = new ByteArrayOutputStream();
        try {

            JAXBContext context = null;
            try {

                context = JAXBContext.newInstance(XmlSurvey.class);
                Marshaller marshaller = context.createMarshaller();
                marshaller.marshal(survey, result);
                result.flush();
                result.close();
            } catch (JAXBException e) {

                LOGGER.error(e.getMessage(), e);
            }
            model.addAttribute("outSurvey", StringEscapeUtils.escapeXml(result.toString()));

        } catch (IOException e) {
            
            LOGGER.error(e.getMessage(), e);
        } finally {

            if (result != null) {

                try {
                    result.close();
                } catch (IOException e) {
                    LOGGER.error(e.getMessage(), e);
                }
            }
        }
        return "/admin/exportxml";
    }
    
    private static String composeEntryItemName(EntryItem el){
        
        CompactValue cv = new CompactValue();
        if (el != null && el.getEntry() != null && el.getEntry().getVariable() != null) {
            cv.setVariable(el.getEntry().getVariable());
        }
        cv.setRowNumber(el.getRowNumber());
        cv.setColumnNumber(el.getColumnNumber());
        String entryItemName = VariableNameUtils.buildVariableAsText(cv);
        // String entryItemShortName = entryItemName.replaceFirst("_fraVariable", "");
        return entryItemName;
    }
    
    private static BasicValue buildBasicValue(String content, String reference, String type){
        
        BasicValue val = new BasicValue();
        val.setContent(content);
        val.setReference(reference);
        val.setType(type);
        return val;
    }

//    public void importFromXML() {
//
//        JAXBContext jc;
//        try {
//
//            jc = JAXBContext.newInstance(Value.class);
//            Unmarshaller um = jc.createUnmarshaller();
//            Values logElement = (Values) um.unmarshal(new FileReader(
//                    "C:\\Users\\geosolutions\\Documents\\surveyExportExample.xml"));
//        } catch (JAXBException e) {
//
//            LOGGER.error(e.getMessage(), e);
//        } catch (FileNotFoundException e) {
//
//            LOGGER.error(e.getMessage(), e);
//        }
//    }
//
//    public static void main(String[] args) {
//
//        XmlExportController export = new XmlExportController();
//        export.importFromXML();
//    }
//
//    @XmlRootElement(name = "Values")
//    class Values {
//
//        @XmlElement(name = "value")
//        List<Value> list;
//
//        public Values() {
//
//            list = new ArrayList<Value>();
//        }
//
//        /**
//         * @return the list
//         */
//        public List<Value> getList() {
//            return list;
//        }
//
//        /**
//         * @param list the list to set
//         */
//        public void setList(List<Value> list) {
//            this.list = list;
//        }
//
//    }
}