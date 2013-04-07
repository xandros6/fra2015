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
import it.geosolutions.fra2015.entrypoint.model.Update;
import it.geosolutions.fra2015.entrypoint.model.Updates;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices;
import it.geosolutions.fra2015.mvc.controller.utils.VariableNameUtils;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;
import it.geosolutions.fra2015.mvc.model.SurveyUpload;
import it.geosolutions.fra2015.server.model.survey.CompactValue;
import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.EntryItem;
import it.geosolutions.fra2015.server.model.survey.NumberValue;
import it.geosolutions.fra2015.server.model.survey.TextValue;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.server.model.xmlexport.BasicValue;
import it.geosolutions.fra2015.server.model.xmlexport.SurveyInfo;
import it.geosolutions.fra2015.server.model.xmlexport.XmlSurvey;
import it.geosolutions.fra2015.services.BulkModelEntitiesLoader;
import it.geosolutions.fra2015.services.SurveyService;
import it.geosolutions.fra2015.services.utils.UserUtil;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * @author Lorenzo Natali
 * 
 */
@Controller
public class ImportExportController {

    @Autowired
    private SurveyService surveyService;
    
    @Autowired
    private BulkModelEntitiesLoader bulkLoader;
    
    @Autowired
    private ControllerServices utils;

    private static Logger LOGGER = Logger.getLogger(ImportExportController.class);
    
    @RequestMapping(value = "/export", method = RequestMethod.GET)
    public String export(ModelMap model, HttpSession session) {
        
        model.addAttribute("context", "export");
        User user = (User) session.getAttribute(SESSION_USER);
        if (user == null){
            return "redirect:/";
        }
        String role = user.getRole();
        if ("reviewer".equals(role)) {
            
            return "reviewer";
        }
        
        if (Profile.VALIDATOR.toString().equalsIgnoreCase(role)){
            model.addAttribute("country", UserUtil.getSingleIso3(user));
            return "validator";
        }
        if ("admin".equals(role)) {

            return "redirect:/adminexport";
        }
        if (role.equals("contributor")) {
            model.addAttribute("country", UserUtil.getSingleIso3(user));
        }
        return "index";

    }

    @RequestMapping(value = "/adminexport", method = RequestMethod.GET)
    public String adminexport(ModelMap model, HttpSession session) {
        
        model.addAttribute("context", "export");
        User user = (User) session.getAttribute(SESSION_USER);
        if (user == null){
            
            return "redirect:/";
        }
        String role = user.getRole();
        if ("reviewer".equals(role)) {
            return "redirect:/export";
        }
        if ("admin".equals(role)) {
            model.addAttribute("countries", surveyService.getCountries());
            model.addAttribute("uploadItem", new SurveyUpload());
            return "admin";
        }
        return "/";

    }
    
    @RequestMapping(value = "/importXml", method = RequestMethod.POST)
    public String importXml(ModelMap model, SurveyUpload uploadItem, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                
                LOGGER.error("Error: " + error.getCode() + " - " + error.getDefaultMessage());
            }
            return "redirect:/adminexport";
        }
        if(uploadItem == null || uploadItem.getFileData() == null || uploadItem.getFileData().isEmpty() || StringUtils.isBlank(uploadItem.getCountryForImport())){
            
            model.addAttribute("messageType", "warning");
            model.addAttribute("messageCode", "import.resultKO");
            model.addAttribute("messageTimeout",10000);
        }
        else{
            Boolean outcome = importFromXML(uploadItem.getFileData(), uploadItem.getCountryForImport());
            if(outcome == null){
                
                model.addAttribute("messageType", "warning");
                model.addAttribute("messageCode", "import.resultKO");
                model.addAttribute("messageTimeout",10000);
            }
            else if(!outcome){
                
                model.addAttribute("messageType", "warning");
                model.addAttribute("messageCode", "import.countrynotmatch");
                model.addAttribute("messageTimeout",10000);
            }
            else{
                model.addAttribute("messageType", "success");
                model.addAttribute("messageCode", "import.resultOK");
                model.addAttribute("messageTimeout",10000);
            }
        }
        
        model.addAttribute("countries", surveyService.getCountries());
        model.addAttribute("uploadItem", new SurveyUpload());
        model.addAttribute("context","export");
        return "admin";
    }
    
    @RequestMapping(value = "/export/{country}", method = RequestMethod.GET)
    public @ResponseBody XmlSurvey handleGet(
            @PathVariable(value = "country") String country, Model model, HttpSession session, HttpServletResponse response)
            throws IllegalArgumentException {

        SurveyInfo surveyInfo = new SurveyInfo();
        surveyInfo.setCountry(country);
        Calendar cal = GregorianCalendar.getInstance(TimeZone.getTimeZone("UTC"));
        surveyInfo.setTimestamp(cal.getTime());

        XmlSurvey survey = new XmlSurvey();
        survey.setInfo(surveyInfo);
        List<BasicValue> valList = new ArrayList<BasicValue>();
        survey.setBasicValues(valList);

//        List<EntryItem> entryItems = bulkLoader.loadAllEntryItem();
        List<TextValue> textValues = bulkLoader.loadAllTextValues(country);
        List<NumberValue> numberValues = bulkLoader.loadAllNumericValues(country);
        
        for (TextValue el : textValues) {
            
            valList.add(buildBasicValue(el.getValue(), composeEntryItemName(el.getEntryItem()),"text"));
        }
        
        for (NumberValue el : numberValues) {
            
            valList.add(buildBasicValue(String.valueOf(el.getValue().doubleValue()), composeEntryItemName(el.getEntryItem()),"numeric"));
        }
        
        response.setContentType("application/force-download");
        response.setHeader("Content-Disposition","attachment; filename=\"" + country +  "-surveyExport.xml\"");
        
        return survey;
        
//        for (EntryItem el : entryItems) {
//
//            valList.add(buildBasicValue("", composeEntryItemName(el)));
//        }
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
    
    public Boolean importFromXML(CommonsMultipartFile file, String countryCheck) {

        JAXBContext jc = null;
        XmlSurvey survey = null;
        Updates updates = new Updates();
        List<Update> updateList = new ArrayList<Update>();
        Updates removes = new Updates();
        
        try {

            jc = JAXBContext.newInstance(XmlSurvey.class);
            Unmarshaller um = jc.createUnmarshaller();
            survey = (XmlSurvey) um.unmarshal(file.getInputStream());
        }
        catch (IOException e) {
            
            LOGGER.error(e.getMessage(), e);
            return null;
        }  catch (JAXBException e) {

            LOGGER.error(e.getMessage(), e);
            return null;
        }
        
        SurveyInfo info = survey.getInfo();
        String country = info.getCountry();
        if(!country.equals(countryCheck)){
            
            return false;
        }
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
        return true;
    }
}
