/* ====================================================================
 *
 * Copyright (C) 2007 - 2012 GeoSolutions S.A.S.
 * http://www.geo-solutions.it
 *
 * GPLv3 + Classpath exception
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. 
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by developers
 * of GeoSolutions.  For more information on GeoSolutions, please see
 * <http://www.geo-solutions.it/>.
 *
 */
package it.geosolutions.fra2015.services.rest.impl;

import it.geosolutions.fra2015.services.rest.RESTExtJsService;
import it.geosolutions.fra2015.services.rest.exception.BadRequestWebEx;

import javax.ws.rs.core.SecurityContext;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

/**
 * Class RESTExtJsServiceImpl.
 *
 * @author Tobia di Pisa (tobia.dipisa at geo-solutions.it)
 *
 */
public class RESTExtJsServiceImpl implements RESTExtJsService {

    private final static Logger LOGGER = Logger
            .getLogger(RESTExtJsServiceImpl.class);

    /*
     * (non-Javadoc)
     * 
     * @see
     * it.geosolutions.fra2015.services.rest.RESTExtJsService#getAllResources
     * (javax.ws.rs.core.UriInfo, javax.ws.rs.core.SecurityContext,
     * java.lang.String, java.lang.Integer, java.lang.Integer)
     */
    @Override
    public String getAllResources(SecurityContext sc, String nameLike,
            Integer start, Integer limit) throws BadRequestWebEx {

        if (start == null || limit == null) {
            throw new BadRequestWebEx("Request parameters are missing !");
        }

        if (LOGGER.isInfoEnabled()) {
            LOGGER.info("Retrieving the paginated resource list ... ");
        }

        JSONObject result = new JSONObject();

        return result.toString();

    }

}
