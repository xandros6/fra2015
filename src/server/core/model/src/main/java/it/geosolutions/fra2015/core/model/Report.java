
package it.geosolutions.fra2015.core.model;

import it.geosolutions.fra2015.core.model.data.Person;
import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

/**
 *
 * @author Francesco Rogo <f.rogo@computernopanic.com>
 * @date $(time)
 */
@Entity
public class Report implements Serializable {
    @Id
    private Long id;
    
    @OneToMany(mappedBy="report", cascade=CascadeType.ALL)
    private List<Question> questions;
        
    @OneToOne
    private Country country;
    
    @OneToMany(cascade=CascadeType.ALL)
    List<Person> editors;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    
    
    
}
