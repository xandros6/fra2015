package it.geosolutions.fra2015.core.model;

import it.geosolutions.fra2015.core.model.user.User;
import java.io.Serializable;
import java.util.Calendar;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Francesco Rogo <f.rogo@computernopanic.com>
 * @date $(time)
 */
@Entity
public class Activity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Temporal(TemporalType.DATE)
    private Calendar creationDate;
    @Temporal(TemporalType.DATE)
    private Calendar lastUpdate;
    private String body;
    private String agent;
    private String report;
    private String question;
    private String fieldId;
    private String rowId;
    private String previousValue;
    private String updatedValue;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @PrePersist
    public void prePersist() {
        this.creationDate = Calendar.getInstance();
    }

    @PreUpdate
    public void preUpdate() {
        this.lastUpdate = Calendar.getInstance();
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Activity)) {
            return false;
        }
        Activity other = (Activity) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "it.geosolutions.fra2015.core.model.Activity[ id=" + id + " ]";
    }
}
