/*
 *  Copyright (C) 2007 - 2011 GeoSolutions S.A.S.
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
package it.geosolutions.fra2015.services.rest.utils;

import java.security.Principal;
import org.apache.cxf.security.SecurityContext;
import org.apache.log4j.Logger;

/**
 * Class fra2015SecurityContext.
 *
 * @author ETj (etj at geo-solutions.it)
 * @author Tobia di Pisa (tobia.dipisa at geo-solutions.it)
 */
public class Fra2015SecurityContext implements SecurityContext {

    private final static Logger LOGGER = Logger.getLogger(Fra2015SecurityContext.class);
    private Fra2015Principal principal;

    /**
     * @param principal
     */
    public void setPrincipal(Fra2015Principal principal) {
        this.principal = principal;
    }

    @Override
    public Principal getUserPrincipal() {
        return principal;
    }

    /**
     * @todo implement this method
     * @param string
     * @return 
     */
    @Override
    public boolean isUserInRole(String string) {
        return true;
    }

    
}
