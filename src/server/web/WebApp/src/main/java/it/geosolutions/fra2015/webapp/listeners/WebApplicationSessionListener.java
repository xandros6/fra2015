package it.geosolutions.fra2015.webapp.listeners;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 *
 * @author francesco
 */
public class WebApplicationSessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent hse) {
        Logger.getLogger(WebApplicationSessionListener.class.getName()).log(Level.INFO, "sessione creata");
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent hse) {
        Logger.getLogger(WebApplicationSessionListener.class.getName()).log(Level.INFO, "sessione chiusa");

    }
}
