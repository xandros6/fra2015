package it.geosolutions.fra2015.core.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;

/**
 *
 * @author Francesco Rogo <f.rogo@computernopanic.com>
 * @date $(time)
 */
@Entity
public class Country implements Serializable {

    @OneToOne(mappedBy = "country")
    private Report report;
    @Id
    private Long id;
    private String name;
    private String tag;

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

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }
}
