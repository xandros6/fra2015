package it.geosolutions.fra2015.webapp.listeners;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author francesco
 */
public class WebApplicationListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Logger.getLogger(WebApplicationListener.class.getName()).log(Level.INFO, "context initialized");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        Logger.getLogger(WebApplicationListener.class.getName()).log(Level.INFO, "context destroyed");
        
    }
    
}
