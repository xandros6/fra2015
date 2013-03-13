/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.model.survey;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author marco
 */
@Entity(name = "Country")
@Table(name = "fra_country" )
@XmlRootElement(name = "country")
public class Country implements Serializable {

    public static enum Type {
        FRA,
        CFRQ;
    }

    @Id
    private Long id;
    
    @Column(unique=true, length=3, nullable=false)
    private String iso3;
    
    @Column(name = "name",unique=true, nullable=false)
    private String name;

    @Column(name = "ctype", nullable=false)
    @Enumerated(EnumType.STRING)
    private Type type;

    @Column(name="landarea")
    private Double landArea;
    
    @Column(name="countryarea")
    private Double countryArea;

    @XmlElement(name = "landarea")
    public Double getLandArea() {
		return landArea;
	}

	public void setLandArea(Double landArea) {
		this.landArea = landArea;
	}

    @XmlElement(name = "countryarea")
	public Double getCountryArea() {
		return countryArea;
	}

	public void setCountryArea(Double countryArea) {
		this.countryArea = countryArea;
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

    public String getIso3() {
        return iso3;
    }

    public void setIso3(String iso3) {
        this.iso3 = iso3;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Country[" + iso3 + ":" + id + ":" + name + ']';
    }

    
    
}
