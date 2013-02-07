/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.model.survey;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.IndexColumn;

/**
 * This class represents a whole table or a text area.
 * An Entry is also the minimal unit for access control rules.
 * @author marco
 */
@Entity(name = "Entry")
@Table(name = "fra_entry" )
@XmlRootElement(name = "Entry")
public class Entry extends Element {

    @Column(nullable = true, updatable = false)
    private String title;
    @Column(nullable = true, updatable = false)
    private String description;
    
    
    @Column(nullable = false, updatable = false)
    private String type;
    
    @OneToMany(mappedBy = "entry", cascade= javax.persistence.CascadeType.PERSIST, fetch = FetchType.EAGER)
    @Cascade({CascadeType.SAVE_UPDATE})
    @JoinColumn(name="entry_id", referencedColumnName="id")
    // see http://www.intertech.com/Blog/Post/Hibernate-Why-Are-there-nulls-in-my-collection.aspx
    // @IndexColumn(name="id", base=0)
    private List<EntryItem> entryItems;
    
    @Column(nullable = true, updatable = false)
    @Lob
    private String template;


    public Entry(){
        entryItems = new ArrayList<EntryItem>();
    }
    
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

    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template;
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

  
    
    
}
