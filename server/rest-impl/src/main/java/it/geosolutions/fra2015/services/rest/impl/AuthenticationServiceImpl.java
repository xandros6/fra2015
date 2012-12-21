/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.services.rest.impl;

import it.geosolutions.fra2015.server.model.user.Token;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.IllegalAccessServiceException;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;
import it.geosolutions.fra2015.services.rest.AuthenticationService;
import it.geosolutions.fra2015.services.rest.exception.BadRequestWebEx;
import it.geosolutions.fra2015.services.rest.exception.IllegalAccessWebExpection;
import it.geosolutions.fra2015.services.rest.exception.NotFoundWebEx;
import javax.ws.rs.core.SecurityContext;
import org.apache.log4j.Logger;

/**
 *
 * @author marco
 */
public class AuthenticationServiceImpl implements AuthenticationService {

    private final static Logger LOGGER = Logger.getLogger(AuthenticationServiceImpl.class);
    private it.geosolutions.fra2015.services.AuthenticationService authService;

    public void setAuthenticationService(it.geosolutions.fra2015.services.AuthenticationService authService) {
        this.authService = authService;
    }

    @Override
    public Token login(SecurityContext sc, String username, String password) throws NotFoundWebEx {
        try {
            return authService.login(username, password);
        } catch (BadRequestServiceEx ex) {
            throw new BadRequestWebEx(ex.getMessage());
        } catch (NotFoundServiceEx ex) {
            throw new NotFoundWebEx(ex.getMessage());
        } catch (IllegalAccessServiceException ex) {
            throw new IllegalAccessWebExpection(ex.getMessage());
        }
    }

    @Override
    public Boolean validate(SecurityContext sc, String token) throws NotFoundWebEx {
        try {
            return authService.verify(token);
        } catch (BadRequestServiceEx ex) {
            throw new BadRequestWebEx(ex.getMessage());
        } catch (NotFoundServiceEx ex) {
            throw new NotFoundWebEx(ex.getMessage());
        }
    }

    @Override
    public Boolean invalidate(SecurityContext sc, String token) throws NotFoundWebEx {
        try {
            return authService.invalidate(token);
        } catch (BadRequestServiceEx ex) {
            throw new BadRequestWebEx(ex.getMessage());
        } catch (NotFoundServiceEx ex) {
            throw new NotFoundWebEx(ex.getMessage());
        }
    }
}
