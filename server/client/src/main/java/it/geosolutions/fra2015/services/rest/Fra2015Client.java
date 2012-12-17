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
package it.geosolutions.fra2015.services.rest;

import javax.ws.rs.core.MediaType;
import org.apache.cxf.endpoint.Client;


/**
 *
 * @author ETj (etj at geo-solutions.it)
 */
public class Fra2015Client {

    private String username = null;
    private String password = null;
    private String fra2015RestUrl = null;

    public Fra2015Client() {
    }

    //==========================================================================
    //=== DATA
    //==========================================================================

    public String getData(Long id) {
        return getData(id, MediaType.WILDCARD_TYPE);
    }

    public String getData(Long id, MediaType acceptMediaType ) {
        String data = getBaseWebResource("data", id)
                .accept(acceptMediaType)
                .get(String.class);
        return data;
    }

    public void setData(Long id, String data ) {
        getBaseWebResource("data", id).put(data);
    }

    protected WebResource getBaseWebResource() {
        if(fra2015RestUrl == null)
            throw new IllegalStateException("fra2015 URL not set");

        Client c = Client.create();
        if (username != null || password != null) {
            c.addFilter(new HTTPBasicAuthFilter(username != null ? username : "", password != null ? password : ""));
        }

        WebResource wr = c.resource(fra2015RestUrl);
        return wr;
    }

    protected WebResource getBaseWebResource(Object ...path) {
        if(fra2015RestUrl == null)
            throw new IllegalStateException("fra2015 URL not set");

        Client c = Client.create();
        if (username != null || password != null) {
            c.addFilter(new HTTPBasicAuthFilter(username != null ? username : "", password != null ? password : ""));
        }

        WebResource wr = c.resource(fra2015RestUrl);

        for (Object o : path) {
            wr = wr.path(o.toString());
        }
        return wr;
    }

    protected WebResource getBaseWebResource(Object ...path) {
        if(fra2015RestUrl == null)
            throw new IllegalStateException("fra2015 URL not set");

        Client c = Client.create();
        if (username != null || password != null) {
            c.addFilter(new HTTPBasicAuthFilter(username != null ? username : "", password != null ? password : ""));
        }

        StringBuilder fullpath = new StringBuilder(fra2015RestUrl);
        for (Object o : path) {
            String p = o.toString();
            if(fullpath.charAt(fullpath.length()-1) != '/')
                fullpath.append('/');
            fullpath.append(p);
        }
        WebResource wr = c.resource(fullpath.toString());
        return wr;
    }

    //==========================================================================
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFra2015RestUrl() {
        return fra2015RestUrl;
    }

    public void setFra2015RestUrl(String fra2015RestUrl) {
        this.fra2015RestUrl = fra2015RestUrl;
    }

}
