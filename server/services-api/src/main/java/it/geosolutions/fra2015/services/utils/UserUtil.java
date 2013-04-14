/*
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

package it.geosolutions.fra2015.services.utils;

import it.geosolutions.fra2015.server.model.user.User;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.apache.commons.beanutils.BeanToPropertyValueTransformer;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;

/**
 *
 * @author ETj (etj at geo-solutions.it)
 */
public class UserUtil {
	public static String getSpacedIso3(User user) {
        BeanToPropertyValueTransformer transformer = new BeanToPropertyValueTransformer( "iso3" );
		Collection<String> countriesIso3 = CollectionUtils.collect(user.getCountriesSet(), transformer);
		String country = StringUtils.join(countriesIso3,' ');
		return country;
	}
	public static String getSpacedIso3(User user,Boolean sorted){
	    if(!sorted) return getSpacedIso3(user);
	    BeanToPropertyValueTransformer transformer = new BeanToPropertyValueTransformer( "iso3" );
	    List<String> countriesIso3 = new ArrayList<String>();
	    CollectionUtils.collect(user.getCountriesSet(), transformer ,countriesIso3);
	    Collections.sort( countriesIso3 );
	    return StringUtils.join(countriesIso3,' ');
	}
	public static String[] getIso3Array(User user) {
        BeanToPropertyValueTransformer transformer = new BeanToPropertyValueTransformer( "iso3" );
		Collection<String> countriesIso3 = CollectionUtils.collect(user.getCountriesSet(), transformer );
        return countriesIso3.toArray(new String[user.getCountriesSet().size()]);
	}

	public static String getSingleIso3(User user) {
        if(user == null)
            return null;
        else if(user.getCountriesSet() == null)
            return null;
        else if(user.getCountriesSet().isEmpty()) {
            return null;
        }
        else if(user.getCountriesSet().size() > 1) {
            throw new IllegalStateException("User " + user + " has too many Countries associated ("+getSpacedIso3(user)+")");
        } else {
            return user.getCountriesSet().iterator().next().getIso3();
        }
	}

}
