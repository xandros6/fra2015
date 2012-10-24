package it.geosolutions.fra2015.core.model.user;

import it.geosolutions.fra2015.core.model.enums.UserGroup;
import java.io.Serializable;
import java.util.Calendar;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author francesco
 */
@NamedQueries({
    @NamedQuery(name = "user.select.all", query = "SELECT i FROM User i")
})
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
    private UserGroup userGroup;
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

    public UserGroup getUserGroup() {
        return userGroup;
    }

    public void setUserGroup(UserGroup privilege) {
        this.userGroup = privilege;
    }

    public int getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(int loginCount) {
        this.loginCount = loginCount;
    }
}
