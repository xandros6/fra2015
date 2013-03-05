/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.model.survey;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.IndexColumn;

@Entity(name = "Question")
@Table(name = "fra_question" )
@XmlRootElement(name = "Question")
public class Question extends Session {

	private static final long serialVersionUID = -2007983638031336392L;

	@Id
	private Long id;
	
	@IndexColumn(name="id")
    @OneToMany(mappedBy = "question", cascade= javax.persistence.CascadeType.PERSIST, fetch = FetchType.EAGER)
	@Fetch(value=FetchMode.JOIN)
    @Cascade({CascadeType.SAVE_UPDATE})
    @JoinColumn(name="question_id", referencedColumnName="id")
	private List<Entry> entries = new ArrayList<Entry>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@XmlElementWrapper(name="entries")
	@XmlElement(name="entry")
	public List<Entry> getEntries() {
		return entries;
	}

	public void setEntries(List<Entry> entries) {
		this.entries = entries;
	}


}