/*
 *  Copyright (C) 2007 - 2012 GeoSolutions S.A.S.
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

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author DamianoG (damiano.giampaoli at geo-solutions.it)
 */
public class UserDTO {
    private String name;

    private String password;

    private String username;

    private String email;

    private String language;

    private String role;

    private Boolean canSubmit;

    private List<Long> questionsId = new ArrayList<Long>();

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
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
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the language
     */
    public String getLanguage() {
        return language;
    }

    /**
     * @param language the language to set
     */
    public void setLanguage(String language) {
        this.language = language;
    }

    /**
     * @return the role
     */
    public String getRole() {
        return role;
    }

    /**
     * @param role the role to set
     */
    public void setRole(String role) {
        this.role = role;
    }

    /**
     * @return the canSubmit
     */
    public Boolean getCanSubmit() {
        return canSubmit;
    }

    /**
     * @param canSubmit the canSubmit to set
     */
    public void setCanSubmit(Boolean canSubmit) {
        this.canSubmit = canSubmit;
    }

    /**
     * @return the questions
     */
    public List<Long> getQuestionsId() {
        return questionsId;
    }

    /**
     * @param questions the questions to set
     */
    public void setQuestionsId(List<Long> questionsId) {
        this.questionsId = questionsId;
    }
    
    
}
