/*
 * ====================================================================
 *
 * Copyright (C) 2012 - 2013 GeoSolutions S.A.S.
 * http://www.geo-solutions.it
 *
 * GPLv3 + Classpath exception
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by developers
 * of GeoSolutions.  For more information on GeoSolutions, please see
 * <http://www.geo-solutions.it/>.
 *
 */
package it.geosolutions.fra2015.server.model.user;

import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.Question;
import it.geosolutions.fra2015.server.model.user.enums.UserGroup;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.ForeignKey;
import org.hibernate.annotations.Index;

/**
 * Class User, models a FRA2015 User. 
 * The roles of an User are: CONTRIBUTOR, REVIEWER, REVIEWEREDITOR, COUNTRYACCEPTANCE, ADMIN
 *
 * @author DamianoG
 */
@Entity(name = "User")
@Table(name = "fra_user", uniqueConstraints = {@UniqueConstraint(columnNames = {"username"})})
@XmlRootElement(name = "User")
public class User implements Serializable {

    /**
     * The Constant serialVersionUID.
     */
    private static final long serialVersionUID = -138056245004697133L;
    /**
     * The id.
     */
    @Id
    @GeneratedValue
    private Long id;
    @Column(nullable = false, updatable = true, length = 128)
    @Index(name = "idx_user_name")
    private String name;

    private transient String newPassword = null;
    
    @Column(nullable = false, updatable = true)
    private String password;
    
    @Column(nullable = false, updatable = false)
    private String username;
    
    @Column(nullable = false, updatable = true)
    private String email;
    
    @Column(nullable =true,updatable =true)
    private String language;
    
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name="fra_users_countries", joinColumns={@JoinColumn(name="user_id")}, inverseJoinColumns={@JoinColumn(name="country_id")})
   	@Fetch(value=FetchMode.JOIN)
    @ForeignKey(name = "fk_uc_user", inverseName = "fk_uc_country")
	private Set<Country> countriesSet  = new HashSet<Country>();
        
    @Column(nullable = false, updatable = false)
    private String role;
    
    @Column(nullable = true, updatable = true)
    private Boolean canSubmit;

    @Enumerated
    protected UserGroup userGroup = UserGroup.GUEST;
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name="fra_questions_reviewers", joinColumns={@JoinColumn(name="reviewers_id")}, inverseJoinColumns={@JoinColumn(name="question_id")})
   	@Fetch(value=FetchMode.JOIN)
    @ForeignKey(name = "fk_uq_user", inverseName = "fk_uq_question")
	private Set<Question> questions  = new HashSet<Question>();
    
    public Set<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(Set<Question> questions) {
		this.questions = questions;
	}

	/**
     * @return the id
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Long id) {
        this.id = id;
    }

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
    
    @XmlTransient
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    public UserGroup getUserGroup() {
        return userGroup;
    }

    public void setUserGroup(UserGroup userGroup) {
        this.userGroup = userGroup;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

	public Set<Country> getCountriesSet() {
		return countriesSet;
	}

	public void setCountriesSet(Set<Country> countriesSet) {
		this.countriesSet = countriesSet;
	}

	public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
    
    public Boolean getCanSubmit() {
        return canSubmit;
    }

    public void setCanSubmit(Boolean canSubmit) {
        this.canSubmit = canSubmit;
    }
    
    @Override
    public int hashCode() {
        int hash = 5;
        hash = 43 * hash + (this.id != null ? this.id.hashCode() : 0);
        hash = 43 * hash + (this.name != null ? this.name.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final User other = (User) obj;
        if (this.id != other.id && (this.id == null || !this.id.equals(other.id))) {
            return false;
        }
        if ((this.name == null) ? (other.name != null) : !this.name.equals(other.name)) {
            return false;
        }
        return true;
    }
    
    public String getLanguage() {
        return this.language==null ? "en" : this.language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", name=" + name + '}';
    }

}
