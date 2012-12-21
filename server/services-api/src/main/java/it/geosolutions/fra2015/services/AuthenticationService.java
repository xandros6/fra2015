/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.services;

import it.geosolutions.fra2015.server.model.user.Token;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.IllegalAccessServiceException;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;

/**
 *
 * @author marco
 */
public interface AuthenticationService {
   
    public Token login(String username, String password) throws BadRequestServiceEx, NotFoundServiceEx,IllegalAccessServiceException;
    
    public Boolean verify(String token) throws BadRequestServiceEx, NotFoundServiceEx;

    
    public Boolean invalidate(String token) throws BadRequestServiceEx, NotFoundServiceEx;     
}
