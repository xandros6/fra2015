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
package it.geosolutions.fra2015.server.model.survey;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity(name = "Question")
@Table(name = "fra_question" )
@XmlRootElement(name = "Question")
public class Question extends Session {

	private static final long serialVersionUID = -2007983638031336392L;

	@Id
	private Long id;
	
    @Column(nullable = false, updatable = false)
    private String title;
    
    @Transient
    private Boolean selected;
	
//	@IndexColumn(name="id")
    @OneToMany(mappedBy = "question", cascade= javax.persistence.CascadeType.PERSIST, fetch = FetchType.LAZY)
//	@Fetch(value=FetchMode.JOIN)
    @Cascade({CascadeType.SAVE_UPDATE})
    @JoinColumn(name="question_id", referencedColumnName="id")
	private List<Entry> entries = new ArrayList<Entry>();
	
//	@ManyToMany
//    @JoinTable(name="fra_questions_reviewers", joinColumns={@JoinColumn(name="question_id")}, inverseJoinColumns={@JoinColumn(name="reviewers_id")})
//	private Set<User> reviewers  = new HashSet<User>();
//
//	public Set<User> getReviewers() {
//		return reviewers;
//	}
//
//	public void setReviewers(Set<User> reviewers) {
//		this.reviewers = reviewers;
//	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@XmlElementWrapper(name="entries")
	@XmlElement(name="entry")
	public List<Entry> getEntries() {
		return entries;
	}

	public void setEntries(List<Entry> entries) {
		this.entries = entries;
	}

	public Boolean getSelected() {
		return selected;
	}

	public void setSelected(Boolean selected) {
		this.selected = selected;
	}

    @Override
    public String toString() {
        return "Question{"+ id + '}';
    }

}