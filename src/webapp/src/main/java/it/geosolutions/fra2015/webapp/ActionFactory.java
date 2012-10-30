package it.geosolutions.fra2015.webapp;

import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Francesco
 */
public class ActionFactory {

    protected static Map<String, Action> cache = new HashMap<String, Action>();

    public static Action createAction(RequestObject req) {

        return createAction(req.getRequestCommand());
       
        
    }

    public static Action createAction(String command) {

        Action action = cache.get(command);

        if (action == null) {

            String className = ConfigurationManager.getAction(command);

            if (className == null) {
                throw new RuntimeException(command + " is not implemented yet.");
            }

            try {

                Class clazz = Class.forName(className);

                Object instance = clazz.newInstance();

                if (instance != null && instance instanceof Action) {
                    action = (Action) instance;
                }

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InstantiationException ex) {
                Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IllegalAccessException ex) {
                Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
            }

            if (action == null) {
                throw new RuntimeException("Error while loading " +className);
            }

            cache.put(command, action);

        }

        return action;

    }
    
}
