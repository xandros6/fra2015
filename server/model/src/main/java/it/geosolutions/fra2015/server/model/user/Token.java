/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.model.user;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.UniqueConstraint;
import javax.xml.bind.annotation.XmlRootElement;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 *
 * @author marco
 */
@Entity(name = "Token")
@Table(name = "fra_token", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"token"})})
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE, region = "gs_token")
@XmlRootElement(name = "Token")
public class Token implements Serializable {
    
    @Id
    @GeneratedValue
    private Long id;
    @Column(nullable = false, updatable = false, length = 20)
    private String token;
    
    @Column(nullable = false, updatable = true)
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date expiringDate;
    
    @OneToOne
    private User user;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Date getExpiringDate() {
        return expiringDate;
    }

    public void setExpiringDate(Date expiringDate) {
        this.expiringDate = expiringDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    
    
}
