package it.geosolutions.fra2015.webapp;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;

/**
 *
 * @author Francesco
 */
public class ConfigurationManager {

    protected static Properties views;
    protected static Properties actions;

    public static void init(ServletConfig config) {

        views = new Properties();
        actions = new Properties();

        try {
            InputStream is = null;
            try {
                is = config.getServletContext().getResourceAsStream("/WEB-INF/views.properties");
                views.load(is);
            } finally {
                if (is != null) {
                    is.close();
                }
            }
        } catch (IOException ex) {
            Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
        }

        try {
            InputStream is = null;
            try {
                is = config.getServletContext().getResourceAsStream("/WEB-INF/actions.properties");
                actions.load(is);
            } finally {
                if (is != null) {
                    is.close();
                }
            }
        } catch (IOException ex) {
            Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
        }

        File tmpDir = new File(config.getServletContext().getRealPath("/tmp"));

        if (!tmpDir.exists()) {

            if (!tmpDir.mkdir()) {
                Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, "impossibile creare la cartella temporanea /tmp");
            }

        }


    }

    public static String getView(String view) {
        return views.getProperty(view);
    }

    public static String getAction(String action) {
        return actions.getProperty(action);
    }
}
