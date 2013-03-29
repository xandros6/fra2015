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
import it.geosolutions.fra2015.entrypoint.model.Update;
import it.geosolutions.fra2015.entrypoint.model.Updates;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices;
import it.geosolutions.fra2015.mvc.controller.utils.VariableNameUtils;
import it.geosolutions.fra2015.server.model.survey.CompactValue;
import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.EntryItem;
import it.geosolutions.fra2015.server.model.survey.NumberValue;
import it.geosolutions.fra2015.server.model.survey.TextValue;
import it.geosolutions.fra2015.server.model.xmlexport.BasicValue;
import it.geosolutions.fra2015.server.model.xmlexport.SurveyInfo;
import it.geosolutions.fra2015.server.model.xmlexport.XmlSurvey;
import it.geosolutions.fra2015.services.BulkModelEntitiesLoader;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
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

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author DamianoG
 * 
 */
@Controller
public class XmlExportController {

    @Autowired
    private BulkModelEntitiesLoader bulkLoader;
    
    @Autowired
    private ControllerServices utils;
    
    @Autowired
    private SurveyServiceEntryPoint surveyService;

    Logger LOGGER = Logger.getLogger(PrintController.class);

    @RequestMapping(value = "/export/{country}", method = RequestMethod.GET)
    public @ResponseBody XmlSurvey handleGet(
            @PathVariable(value = "country") String country, Model model, HttpSession session)
            throws IllegalArgumentException {

        SurveyInfo surveyInfo = new SurveyInfo();
        surveyInfo.setCountry(country);
        Calendar cal = GregorianCalendar.getInstance(TimeZone.getTimeZone("UTC"));
        surveyInfo.setTimestamp(cal.getTime());

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
        return survey;
        
//        for (EntryItem el : entryItems) {
//
//            valList.add(buildBasicValue("", composeEntryItemName(el)));
//        }

        
        // TODO Code for explicity marshall the XmlSurvey... do more tests then remove it 
//        ByteArrayOutputStream result = new ByteArrayOutputStream();
//        try {
//
//            JAXBContext context = null;
//            try {
//
//                context = JAXBContext.newInstance(XmlSurvey.class);
//                Marshaller marshaller = context.createMarshaller();
//                marshaller.marshal(survey, result);
//                result.flush();
//                result.close();
//            } catch (JAXBException e) {
//
//                LOGGER.error(e.getMessage(), e);
//            }
//            model.addAttribute("outSurvey", StringEscapeUtils.escapeXml(result.toString()));
//
//        } catch (IOException e) {
//            
//            LOGGER.error(e.getMessage(), e);
//        } finally {
//
//            if (result != null) {
//
//                try {
//                    result.close();
//                } catch (IOException e) {
//                    LOGGER.error(e.getMessage(), e);
//                }
//            }
//        }
//        return "/admin/exportxml";
    }
    
    private static String composeEntryItemName(EntryItem el){
        
        CompactValue cv = new CompactValue();
        if (el != null && el.getEntry() != null && el.getEntry().getVariable() != null) {
            cv.setVariable(el.getEntry().getVariable());
        }
        cv.setRowNumber(el.getRowNumber());
        cv.setColumnNumber(el.getColumnNumber());
        String entryItemName = VariableNameUtils.buildVariableAsShortText(cv);
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

    @RequestMapping(value = "/import", headers = "Accept=application/xml", method = RequestMethod.GET)
    public void importFromXML() {

        
        JAXBContext jc = null;
        XmlSurvey survey = null;
        Updates updates = new Updates();
        List<Update> updateList = new ArrayList();
        Updates removes = new Updates();
        
        try {

            jc = JAXBContext.newInstance(XmlSurvey.class);
            Unmarshaller um = jc.createUnmarshaller();
            // TODO Test add multipart support
            survey = (XmlSurvey) um.unmarshal(new FileReader(
                    "C:\\Users\\geosolutions\\Desktop\\surveyExample.xml"));    
        } catch (JAXBException e) {

            LOGGER.error(e.getMessage(), e);
        } catch (FileNotFoundException e) {

            LOGGER.error(e.getMessage(), e);
        }
        
        SurveyInfo info = survey.getInfo();
        String country = info.getCountry();
        Country countryInstance = surveyService.findCountryByISO3(country);
        if(countryInstance == null){
            
            throw new IllegalStateException("Country '" + country + "' doesn't exist.");
        }
        
        for(BasicValue el : survey.getBasicValues()){
            
            String reference = (el.getReference().startsWith("_fraVariable_"))?el.getReference():"_fraVariable_"+el.getReference();
            VariableNameUtils.VariableName varName = VariableNameUtils.buildVariable(reference, el.getContent());
            Update up = new Update();
            up.setColumn(varName.col);
            up.setCountry(country);
            up.setRow(varName.row);
            up.setValue(varName.value);
            up.setVariable(varName.variableName);
            
            updateList.add(up);
        }
        
        updates.setUpdates(updateList);
        utils.updateValuesService(updates, removes);
        
    }

    public static void main(String[] args) {

        XmlExportController export = new XmlExportController();
        export.importFromXML();
    }


}