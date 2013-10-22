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
package it.geosolutions.fra2015.services.model;

import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.Question;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.server.model.user.enums.UserGroup;
import java.util.Set;
import org.springframework.beans.BeanUtils;

/**
 *
 * @author ETj (etj at geo-solutions.it)
 */
public class UserDTO {

    private User user = new User();

    private String questionsStr;
    private String selCountries;

    public void copyFrom(User src) {
        BeanUtils.copyProperties(src, this.user);
    }

    public void copyTo(User dst) {
        BeanUtils.copyProperties(this.user, dst);
    }

    public String getQuestionsStr() {
        return questionsStr;
    }

    public void setQuestionsStr(String questionsStr) {
        this.questionsStr = questionsStr;
    }

    /**
     * @return a space-separated list of ISO3 codes
     */
    public String getCountries() {
        return selCountries;
    }

    public void setCountries(String selCountries) {
        this.selCountries = selCountries;
    }

    /**
     * @deprecated use getCountries()
     */
    public String getSelCountries() {
        return selCountries;
    }

    /**
     * @deprecated use setCountries(String)
     */
    public void setSelCountries(String selCountries) {
        this.selCountries = selCountries;
    }

    // delegates

    public Set<Question> getQuestions() {
        return user.getQuestions();
    }

    public void setQuestions(Set<Question> questions) {
        user.setQuestions(questions);
    }

    public Long getId() {
        return user.getId();
    }

    public void setId(Long id) {
        user.setId(id);
    }

    public String getName() {
        return user.getName();
    }

    public void setName(String name) {
        user.setName(name);
    }

    public String getPassword() {
        return user.getPassword();
    }

    public void setPassword(String password) {
        user.setPassword(password);
    }

    public UserGroup getUserGroup() {
        return user.getUserGroup();
    }

    public void setUserGroup(UserGroup userGroup) {
        user.setUserGroup(userGroup);
    }

    public String getUsername() {
        return user.getUsername();
    }

    public void setUsername(String username) {
        user.setUsername(username);
    }

    public String getEmail() {
        return user.getEmail();
    }

    public void setEmail(String email) {
        user.setEmail(email);
    }

    public Set<Country> getCountriesSet() {
        return user.getCountriesSet();
    }

    public void setCountriesSet(Set<Country> countriesSet) {
        user.setCountriesSet(countriesSet);
    }

    public String getRole() {
        return user.getRole();
    }

    public void setRole(String role) {
        user.setRole(role);
    }

    public String getNewPassword() {
        return user.getNewPassword();
    }

    public void setNewPassword(String newPassword) {
        user.setNewPassword(newPassword);
    }

    public String getLanguage() {
        return user.getLanguage();
    }

    public void setLanguage(String language) {
        user.setLanguage(language);
    }
    
    public Boolean getCanSubmit() {
        return  user.getCanSubmit();
    }

    public void setCanSubmit(Boolean canSubmit) {
        user.setCanSubmit(canSubmit);
    }
    
	public Boolean getPreventContributorsEmails() {
		return user.getPreventContributorsEmails();
	}

	public void setPreventContributorsEmails(Boolean preventContributorsEmails) {
		user.setPreventContributorsEmails(preventContributorsEmails);
	}
}
