/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.model.survey;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlRootElement;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.IndexColumn;

/**
 *
 * @author marco
 */
@Entity
@XmlRootElement(name = "Session")
public class Session extends Element {
    
    @Column(nullable = false, updatable = false)
    private String title;
    @Column(nullable = true, updatable = false)
    private String description;
    @Column(nullable = true, updatable = false)
    private String helpLink;
    @Column(nullable = true, updatable = false)
    private String tooltip;
    @Column(nullable = true, updatable = false)
    private Boolean noCount;
    
    @OneToMany(mappedBy = "parent", cascade= javax.persistence.CascadeType.PERSIST, fetch = FetchType.EAGER)
    @Cascade({CascadeType.SAVE_UPDATE})
    @JoinColumn(name="parent_id", referencedColumnName="id")
    @IndexColumn(name="id", base=0)
    List<Element> elements;

    @XmlElementWrapper(name="Elements")
    @XmlElements({
        @XmlElement(name = "entry", type = Entry.class),
        @XmlElement(name = "session", type = Session.class),
        @XmlElement(name = "question", type = Question.class)})
    public List<Element> getElements() {
        return elements;
    }

    public void setElements(List<Element> elements) {
        this.elements = elements;
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

    public String getHelpLink() {
        return helpLink;
    }

    public void setHelpLink(String helpLink) {
        this.helpLink = helpLink;
    }

    public String getTooltip() {
        return tooltip;
    }

    public void setTooltip(String tooltip) {
        this.tooltip = tooltip;
    }

    public Boolean getNoCount() {
        return noCount;
    }

    public void setNoCount(Boolean noCount) {
        this.noCount = noCount;
    }


    
}
