/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.services.rest.exception;

import javax.ws.rs.core.Response;

/**
 *
 * @author marco
 */
public class IllegalAccessWebExpection extends Fra2015WebEx {

    public IllegalAccessWebExpection(String message) {
        super(Response.Status.UNAUTHORIZED, message);
    }

    
 
    
}
