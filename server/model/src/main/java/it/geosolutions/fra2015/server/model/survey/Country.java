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
import javax.persistence.UniqueConstraint;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import org.hibernate.annotations.Index;

/**
 * @author marco
 * @author Tobia Di Pisa at tobia.dipisa@geo-solutions.it
 * 
 */
@Entity(name = "Country")
@Table(name = "fra_country" ,
    uniqueConstraints=@UniqueConstraint(columnNames={"iso3","name"})
        
)
@XmlRootElement(name = "country")
public class Country implements Serializable {

    public static enum Type {
        FRA,
        CFRQ;
    }

    @Id
    private Long id;
    
    @Column(name="iso3", length=3, nullable=false, unique = true)
    @Index(name = "idx_country_iso3")
    private String iso3;
    
    @Column(name = "name", nullable=false)
    private String name;
    
    @Column(name = "name_en", nullable=false)
    private String name_en;
    
	@Column(name = "name_es", nullable=false)
    private String name_es;
    
    @Column(name = "name_fr", nullable=false)
    private String name_fr;

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

    /**
	 * @return the name_en
	 */
	public String getName_en() {
		return name_en;
	}

	/**
	 * @param name_en the name_en to set
	 */
	public void setName_en(String name_en) {
		this.name_en = name_en;
	}

	/**
	 * @return the name_es
	 */
	public String getName_es() {
		return name_es;
	}

	/**
	 * @param name_es the name_es to set
	 */
	public void setName_es(String name_es) {
		this.name_es = name_es;
	}

	/**
	 * @return the name_fr
	 */
	public String getName_fr() {
		return name_fr;
	}

	/**
	 * @param name_fr the name_fr to set
	 */
	public void setName_fr(String name_fr) {
		this.name_fr = name_fr;
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
