/*
 *  fra2015
 *  https://github.com/geosolutions-it/fra2015
 *  Copyright (C) 2013 GeoSolutions S.A.S.
 *  http://www.geo-solutions.it
 *
 *  GPLv3 + Classpath exception
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package it.geosolutions.fra2015.server.model.survey;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import org.hibernate.annotations.Index;

/**
 * This class represents a numerical value
 */
@Entity(name = "NumberValue")
@Table(name = "fra_num_value" )
@XmlRootElement(name = "NumberValue")
@org.hibernate.annotations.Table(
   appliesTo = "fra_num_value",
   indexes = {
      @Index(name="idx_nvalue_item", columnNames = "item_id"),
      @Index(name="idx_nvalue_country", columnNames = "country_id"),
      @Index(name="idx_nvalue_ic", columnNames = {"item_id", "country_id"})
   })

public class NumberValue extends Value {
    
   
    @Column(name="fra_value", nullable = false, updatable = true)
    private Number value;

    public Number getValue() {
        return value;
    }

    public void setValue(Number itemValue) {
        this.value = itemValue;
    }
   
    
    
    
}
