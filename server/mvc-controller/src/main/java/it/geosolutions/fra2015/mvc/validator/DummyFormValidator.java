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
package it.geosolutions.fra2015.mvc.validator;

import it.geosolutions.fra2015.mvc.model.DummyFormModel;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * @author DamianoG
 * 
 */
public class DummyFormValidator implements Validator {

    @Override
    public boolean supports(Class clazz) {
        return DummyFormValidator.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {

        //Example validation
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "textbox", "required.textbox",
                "textbox field is required.");

        DummyFormModel model = (DummyFormModel) target;

        if (!(model.getPassword().equals(model.getConfirmPassword()))) {
            errors.rejectValue("password", "notmatch.password");
        }
        
        if(model.getRadioButtonList()==null || model.getRadioButtonList().isEmpty()){
            errors.rejectValue("radioButtonList", "required.radiobuttonsSelection");
        }

        if("NONE".equals(model.getDropdown())){
                errors.rejectValue("dropdown", "required.dropdown");
        }

    }

}
