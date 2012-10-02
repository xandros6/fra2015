package it.geosolutions.fao.core.model.user;

import java.io.Serializable;
import java.util.Calendar;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.*;

/**
 *
 * @author francesco
 */
@Entity
public class User implements Serializable {

    @Id
    private String username;
    @Embedded
    private Password password;
    @Temporal(TemporalType.DATE)
    private Calendar loginDate;
    @Temporal(TemporalType.DATE)
    private Calendar lastUpdate;
    @Temporal(TemporalType.DATE)
    private Calendar creationDate;
    @Enumerated
    private Privilege privilege;
    
    private int loginCount = 0;

    @PrePersist
    public void prePersist() {
        this.creationDate = Calendar.getInstance();
    }

    @PreUpdate
    public void preUpdate() {
        this.lastUpdate = Calendar.getInstance();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Password getPassword() {
        return password;
    }

    public void setPassword(Password password) {
        this.password = password;
    }

    public Calendar getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Calendar loginDate) {
        this.loginDate = loginDate;
    }

    public Calendar getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(Calendar lastUpdate) {
        this.lastUpdate = lastUpdate;
    }

    public Calendar getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Calendar creationDate) {
        this.creationDate = creationDate;
    }

    public Privilege getPrivilege() {
        return privilege;
    }

    public void setPrivilege(Privilege privilege) {
        this.privilege = privilege;
    }

    public int getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(int loginCount) {
        this.loginCount = loginCount;
    }
    
    
}
