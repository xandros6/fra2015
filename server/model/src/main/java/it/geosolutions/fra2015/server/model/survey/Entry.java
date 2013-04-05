/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.model.survey;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.ForeignKey;
import org.hibernate.annotations.Index;

/**
 * This class represents a whole table or a text area or a non editable text.
 * An Entry is also the minimal unit for access control rules.
 * @author marco
 */
@Entity(name = "Entry")
@Table(name = "fra_entry" )
@XmlRootElement(name = "Entry")
public class Entry extends Element {
    
    @Id
    @GeneratedValue
    private Long id;
    
    @Column(nullable = true, updatable = false)
    private String name;

    @Column(nullable = true, updatable = false)
    private String title;
    @Column(nullable = true, updatable = false)
    private String description;
    
    @Column(nullable = true, updatable = false)
    private String  variable;
    
    
    @Column(nullable = false, updatable = false)
    private String type;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="question_id", referencedColumnName="id")
    @ForeignKey(name = "fk_entry_question")
    @Index(name = "idx_entry_question")
    private Question question;
    
    @OneToMany(mappedBy = "entry", cascade= javax.persistence.CascadeType.PERSIST, fetch = FetchType.EAGER)
    @Fetch(value=FetchMode.JOIN)
    @Cascade({CascadeType.SAVE_UPDATE})
    @JoinColumn(name="entry_id", referencedColumnName="id")
    // see http://www.intertech.com/Blog/Post/Hibernate-Why-Are-there-nulls-in-my-collection.aspx
    // @IndexColumn(name="id", base=0)
    private List<EntryItem> entryItems;
    
    @Transient
    private String template;

    
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }


    @XmlElementWrapper(name="EntryItems")
    @XmlElement(name="entryItem", type=EntryItem.class)
    public List<EntryItem> getEntryItems() {
        return entryItems;
    }

    public void setEntryItems(List<EntryItem> entryItems) {
        this.entryItems = entryItems;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void addEntryItem(EntryItem item) {
        entryItems.add( item );
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template;
    }

    public String getVariable() {
        return variable;
    }

    public void setVariable(String variable) {
        this.variable = variable;
    }

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	} 

    @Override
    public String toString() {
        return "Entry{"
                + "var=" + variable
                + ", type=" + type
                + ", q=" + question
                + ", parent=" + ( parent == null? "" : getParent())
                + '}';
    }
}
