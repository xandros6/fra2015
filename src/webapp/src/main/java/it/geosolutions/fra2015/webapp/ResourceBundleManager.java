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
    private final static Map<String, LocalizationBundle> cache = new HashMap<String, LocalizationBundle>();

    private ResourceBundleManager() {
    }

    public static ResourceBundleManager getInstance() {
        return ResourceBundleManagerHolder.INSTANCE;
    }

    private static class ResourceBundleManagerHolder {

        private static final ResourceBundleManager INSTANCE = new ResourceBundleManager();
    }

    public LocalizationBundle getLocalizationBundle(String name) {
        return this.getLocalizationBundle(name, false);
    }

    public synchronized LocalizationBundle getLocalizationBundle(String name, boolean reloadCache) {


        LocalizationBundle lb = null;

        if (!reloadCache) {
            lb = cache.get(name);
        }

        if (lb == null) {
            ResourceBundle rb = ResourceBundle.getBundle(
                    RESOURCE_PATH_PREFIX
                    + name);
            lb = new LocalizationBundle(name, rb);
            cache.put(name, lb);
        }
        


        return lb;

    }

    public synchronized void reloadCache() {

        if (debug) {
            Locale locale = Locale.getDefault();
            System.out.println("loading resources for locale " + locale.toString());
        }

        for (String key : cache.keySet()) {
            LocalizationBundle rb = getLocalizationBundle(key, true);
            if (debug) {
                System.out.println("\tkey:" + key);
                for (String s : rb.keySet()) {
                    System.out.println("\t\t" + s + ":" + rb.getString(s));
                }
            }
        }
    }
}
