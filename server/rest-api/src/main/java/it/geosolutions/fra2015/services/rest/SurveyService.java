/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.services.rest;

import it.geosolutions.fra2015.server.model.survey.Survey;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;
import it.geosolutions.fra2015.services.rest.exception.BadRequestWebEx;
import java.util.List;
import javax.annotation.security.RolesAllowed;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.SecurityContext;
import org.apache.cxf.jaxrs.ext.multipart.Multipart;

/**
 *
 * @author marco
 */
public interface SurveyService {
    
    @POST
    @Path("/")
    @Consumes({MediaType.APPLICATION_XML, MediaType.TEXT_XML})
    @Produces({MediaType.TEXT_PLAIN, MediaType.TEXT_XML, MediaType.APPLICATION_JSON})
    @RolesAllowed({"ADMIN"})
    public Survey create(
    		@Context SecurityContext sc, 
    		@Multipart("survey") Survey survey) throws BadRequestServiceEx, NotFoundServiceEx;
    
    @GET
    @Path("/")
    @RolesAllowed({"ADMIN"})
    public List<Survey> getAll(
    		@Context SecurityContext sc, 
            @QueryParam("page") Integer page,
            @QueryParam("entries") Integer entries)throws BadRequestWebEx;

}
