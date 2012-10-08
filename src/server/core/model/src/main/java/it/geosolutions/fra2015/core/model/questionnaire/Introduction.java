package it.geosolutions.fra2015.core.model.questionnaire;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

/**
 *
 * @author francesco
 */
@Entity
public class Introduction implements Serializable {

    private static final long serialVersionUID = 1L;

    @PrePersist
    public void prePersist() {
    }

    @PreUpdate
    public void preUpdate() {
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    protected String body;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
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
        if (!(object instanceof Introduction)) {
            return false;
        }
        Introduction other = (Introduction) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "it.geosolutions.fra2015.core.model.questionnaire.Introduction[ id=" + id + " ]";
    }
}
