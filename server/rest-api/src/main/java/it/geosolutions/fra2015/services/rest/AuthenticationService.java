/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.services.rest;

import it.geosolutions.fra2015.server.model.user.Token;
import it.geosolutions.fra2015.services.rest.exception.NotFoundWebEx;
import javax.annotation.security.RolesAllowed;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.SecurityContext;

/**
 *
 * @author marco
 */
public interface AuthenticationService {
    
    @GET
    @Path("/login")
    @Produces({MediaType.TEXT_PLAIN, MediaType.TEXT_XML, MediaType.APPLICATION_JSON})
    @RolesAllowed({"ADMIN"})
    public Token login(
    		@Context SecurityContext sc, 
    		@QueryParam("username") String username, @QueryParam("password") String password) throws NotFoundWebEx;
        
            @GET
    @Path("/check")
    @Produces({MediaType.TEXT_PLAIN, MediaType.TEXT_XML, MediaType.APPLICATION_JSON})
    @RolesAllowed({"ADMIN"})
    public Boolean validate(
    		@Context SecurityContext sc, 
    		@QueryParam("token") String token) throws NotFoundWebEx;
            
                @GET
    @Path("/invalidate")
    @Produces({MediaType.TEXT_PLAIN, MediaType.TEXT_XML, MediaType.APPLICATION_JSON})
    @RolesAllowed({"ADMIN"})
    public Boolean invalidate(
    		@Context SecurityContext sc, 
    		@QueryParam("token") String token) throws NotFoundWebEx;
}
