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
package it.geosolutions.fra2015.server.model.xmlexport;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 * @author DamianoG
 *
 */
@XmlRootElement(name="Survey")
@XmlType(propOrder={"info","basicValues","surveyStatus","users"})
public class XmlSurvey {

    private SurveyInfo info;
    
    private List<BasicValue> basicValues;
    
    private List<UserDTO> users;
    
    private SurveyStatus surveyStatus;

    public XmlSurvey(){}

    /**
     * @return the info
     */
    @XmlElement(name = "Info")
    public SurveyInfo getInfo() {
        return info;
    }

    /**
     * @param info the info to set
     */
    public void setInfo(SurveyInfo info) {
        this.info = info;
    }

    /**
     * @return the basicValues
     */
//    @XmlElementWrapper(name = "Values")
    @XmlElement(name = "Value")
    public List<BasicValue> getBasicValues() {
        return basicValues;
    }

    /**
     * @param basicValues the basicValues to set
     */
    public void setBasicValues(List<BasicValue> basicValues) {
        this.basicValues = basicValues;
    }

    /**
     * @return the surveyStatus
     */
    public SurveyStatus getSurveyStatus() {
        return surveyStatus;
    }

    /**
     * @param surveyStatus the surveyStatus to set
     */
    public void setSurveyStatus(SurveyStatus surveyStatus) {
        this.surveyStatus = surveyStatus;
    }

    /**
     * @return the users
     */
    @XmlElement(name = "Users")
    public List<UserDTO> getUsers() {
        return users;
    }

    /**
     * @param users the users to set
     */
    public void setUsers(List<UserDTO> users) {
        this.users = users;
    }
    
    
    
}
