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
package it.geosolutions.fra2015.mvc.model;

/**
 * @author DamianoG
 *
 */
public class DummyFormModel {

    //textbox
    String textbox;
    
    //textarea
    String textarea;
    
    //password
    String password;
    String confirmPassword;
    
    //checkbox
    boolean checkbox;
    String [] checkboxList;
    
    //radio button
    String radioButton;
    String radioButtonList;
    
    //dropdown box
    String dropdown;
    
    //select box
    String select;
    
    //hidden value
    String secretValue;

    /**
     * @return the textbox
     */
    public String getTextbox() {
        return textbox;
    }

    /**
     * @param textbox the textbox to set
     */
    public void setTextbox(String textbox) {
        this.textbox = textbox;
    }

    /**
     * @return the textarea
     */
    public String getTextarea() {
        return textarea;
    }

    /**
     * @param textarea the textarea to set
     */
    public void setTextarea(String textarea) {
        this.textarea = textarea;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the confirmPassword
     */
    public String getConfirmPassword() {
        return confirmPassword;
    }

    /**
     * @param confirmPassword the confirmPassword to set
     */
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    /**
     * @return the checkbox
     */
    public boolean isCheckbox() {
        return checkbox;
    }

    /**
     * @param checkbox the checkbox to set
     */
    public void setCheckbox(boolean checkbox) {
        this.checkbox = checkbox;
    }

    /**
     * @return the checkboxList
     */
    public String[] getCheckboxList() {
        return checkboxList;
    }

    /**
     * @param checkboxList the checkboxList to set
     */
    public void setCheckboxList(String[] checkboxList) {
        this.checkboxList = checkboxList;
    }

    /**
     * @return the radioButton
     */
    public String getRadioButton() {
        return radioButton;
    }

    /**
     * @param radioButton the radioButton to set
     */
    public void setRadioButton(String radioButton) {
        this.radioButton = radioButton;
    }

    /**
     * @return the radioButtonList
     */
    public String getRadioButtonList() {
        return radioButtonList;
    }

    /**
     * @param radioButtonList the radioButtonList to set
     */
    public void setRadioButtonList(String radioButtonList) {
        this.radioButtonList = radioButtonList;
    }

    /**
     * @return the dropdown
     */
    public String getDropdown() {
        return dropdown;
    }

    /**
     * @param dropdown the dropdown to set
     */
    public void setDropdown(String dropdown) {
        this.dropdown = dropdown;
    }

    /**
     * @return the select
     */
    public String getSelect() {
        return select;
    }

    /**
     * @param select the select to set
     */
    public void setSelect(String select) {
        this.select = select;
    }

    /**
     * @return the secretValue
     */
    public String getSecretValue() {
        return secretValue;
    }

    /**
     * @param secretValue the secretValue to set
     */
    public void setSecretValue(String secretValue) {
        this.secretValue = secretValue;
    }

    
    
}
