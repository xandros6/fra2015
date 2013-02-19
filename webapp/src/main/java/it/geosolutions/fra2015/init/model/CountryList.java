/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.init.model;

import it.geosolutions.fra2015.server.model.survey.Country;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author etj
 */
@XmlRootElement(name="countries")
public class CountryList implements Iterable<Country> {
    private List<Country> countries = new ArrayList<Country>(200);

    @XmlElement(name="country")
    public List<Country> getCountries() {
        return countries;
    }

    public void setCountries(List<Country> countries) {
        this.countries = countries;
    }

    @Override
    public Iterator<Country> iterator() {
        return countries.listIterator();
    }
 
}
