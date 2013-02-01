/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.model.survey;

import javax.persistence.Entity;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author marco
 */
@Entity
@XmlRootElement(name = "Question")
public class Question extends Session {
    
    
    /* @OneToMany(mappedBy = "parent", cascade= javax.persistence.CascadeType.PERSIST, fetch = FetchType.EAGER)
    @Cascade({CascadeType.SAVE_UPDATE})
    @JoinColumn(name="parent_id", referencedColumnName="id")
    @IndexColumn(name="id", base=0)
    private List<Entry> entries;
    
    @XmlElementWrapper(name = "Entries")
    @XmlElement(name="entry", type=Entry.class)
    public List<Entry> getEntries() {
        return entries;
    }

    public void setEntries(List<Entry> entries) {
        this.entries = entries;
    }*/

    
}
