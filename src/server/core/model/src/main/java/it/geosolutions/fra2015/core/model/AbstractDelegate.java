package it.geosolutions.fra2015.core.model;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author Francesco
 */
public abstract class AbstractDelegate {

    public final static String SERVICE_PREFIX = "java:comp/env/";

    public abstract String getServiceName();

    public Object getService() {
        try {
            InitialContext ic = new InitialContext();
            Object result = ic.lookup(getServiceName());
            return result;
        } catch (NamingException ex) {
            Logger.getLogger(AbstractDelegate.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException("Service "+getServiceName()+" is not available.");
        }
    }
}
