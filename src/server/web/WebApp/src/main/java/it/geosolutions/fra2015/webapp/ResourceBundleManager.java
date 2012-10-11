package it.geosolutions.fra2015.webapp;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

/**
 *
 * @author francesco
 */
public class ResourceBundleManager {

    public final static String RESOURCE_PATH_PREFIX = "META-INF.webapp.";
    private final static Map<String, ResourceBundle> cache = new HashMap<String, ResourceBundle>();

    private ResourceBundleManager() {
    }

    public static ResourceBundleManager getInstance() {
        return ResourceBundleManagerHolder.INSTANCE;
    }

    private static class ResourceBundleManagerHolder {

        private static final ResourceBundleManager INSTANCE = new ResourceBundleManager();
    }
    
    public ResourceBundle getResourceBundle(String name) {
        return this.getResourceBundle(name, false);
    }

    public synchronized ResourceBundle getResourceBundle(String name, boolean reloadCache) {


        ResourceBundle rb = null;
        
        if (!reloadCache) {
            rb = cache.get(name);
        }

        if (rb == null) {
            rb = ResourceBundle.getBundle(
                    RESOURCE_PATH_PREFIX
                    + name);
            cache.put(name, rb);
        }

        return rb;

    }
}
