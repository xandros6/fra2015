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

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import it.geosolutions.fra2015.mvc.model.DummyFormModel;
import it.geosolutions.fra2015.mvc.validator.DummyFormValidator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

/**
 * @author DamianoG
 * 
 */
@Controller
@RequestMapping("/dummyForm")
public class DummyFormController {

    DummyFormValidator dummyFormValidator;

    @Autowired
    public void DummyController(DummyFormValidator dummyFormValidator) {
        this.dummyFormValidator = dummyFormValidator;
    }

    @RequestMapping(method = RequestMethod.POST)
    public String processSubmit(@ModelAttribute("dForm") DummyFormModel dummyFormModel,
            BindingResult result, SessionStatus status) {

        dummyFormValidator.validate(dummyFormModel, result);
        if (result.hasErrors()) {
            // if validator failed
            return "dummyForm";
        } else {
            status.setComplete();
            // form success
            return "dummyFormSuccess";
        }
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String initForm(ModelMap model){
            
            DummyFormModel dummyModel = new DummyFormModel();
            //Make "checkbox1" as default checked value
            dummyModel.setCheckboxList(new String []{"ckbx1"});
            
            //Make "" as default radio button selected value
            dummyModel.setRadioButton("A");
            
            //initilize a hidden value
            dummyModel.setSecretValue("I'm hidden value");
            
            //command object
            model.addAttribute("dForm", dummyModel);
            
            //return form view
            return "dummyForm";
    }
    
    @ModelAttribute("checkboxList")
    public List<String> populateCheckBoxList() {

            List<String> checkboxList = new ArrayList<String>();
            checkboxList.add("ckbx1");
            checkboxList.add("ckbx2");
            checkboxList.add("ckbx3");
            checkboxList.add("ckbx4");
            checkboxList.add("ckbx5");

            return checkboxList;
    }
    
    @ModelAttribute("radioButtonList")
    public List<String> populateRadioButtonList() {
            
            List<String> radioButtonList = new ArrayList<String>();
            radioButtonList.add("n1");
            radioButtonList.add("n2");
            radioButtonList.add("n3");
            radioButtonList.add("n4");
            radioButtonList.add("n5");
            
            return radioButtonList;
    }
    
    @ModelAttribute("dropdownList")
    public Map<String,String> populateDropdownList() {
            
            Map<String,String> dropdown = new LinkedHashMap<String,String>();
            dropdown.put("dd1", "dropdown1");
            dropdown.put("dd2", "dropdown2");
            dropdown.put("dd3", "dropdown3");
            dropdown.put("dd4", "dropdown4");
            
            return dropdown;
    }
    
    @ModelAttribute("select")
    public Map<String,String> populateSelectList() {
            
            //Data referencing for java skills list box
            Map<String,String> javaSkill = new LinkedHashMap<String,String>();
            javaSkill.put("s1", "select1");
            javaSkill.put("s2", "select2");
            javaSkill.put("s3", "select2");
            javaSkill.put("s4", "select3");
            
            return javaSkill;
    }
    
}
