package it.geosolutions.fra2015.webapp;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

/**
 *
 * @author francesco
 */
public class ResourceBundleManager {

    private final boolean debug = true;
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

    public synchronized void reloadCache() {

        if (debug) {
            Locale locale = Locale.getDefault();
            System.out.println("loading resources for locale " + locale.toString());
        }

        for (String key : cache.keySet()) {
            ResourceBundle rb = getResourceBundle(key, true);
            if (debug) {
                System.out.println("\tkey:" + key);
                for (String s : rb.keySet()) {
                    System.out.println("\t\t" + s + ":" + rb.getString(s));
                }
            }
        }
    }
}
