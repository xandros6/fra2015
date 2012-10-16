package it.geosolutions.fra2015.webapp;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Locale;
import java.util.MissingResourceException;
import java.util.ResourceBundle;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Francesco Rogo <f.rogo@computernopanic.com>
 * @date $(time)
 */
public class LocalizationBundle {

    private final List<String> missing = new ArrayList<String>();
    final ResourceBundle bundle;
    final String name;

    public LocalizationBundle(String name, ResourceBundle bundle) {
        this.name = name;
        this.bundle = bundle;
    }

    public void clearMissingResources() {
        missing.clear();
    }

    public void dumpMissingResources() {

        StringBuilder sb = new StringBuilder();

        if (missing.isEmpty()) {
            sb.append("No missing keys in bundle ").append(name);
        } else {
            sb.append("\nMissing keys for ").append(name).append(" are:");
        }

        for (String key : missing) {
            sb.append("\n").append(key).append("=");
        }

        System.out.println(sb.toString());
    }

    public String[] getMissingResStrings() {
        return getMissingResource(null);
    }

    public String[] getMissingResource(String[] arr) {
        if (arr == null) {
            arr = new String[]{};
        }
        return missing.toArray(arr);
    }

    public final String getString(String key) {

        String str;

        try {
            str = bundle.getString(key);
        } catch (MissingResourceException ex) {
            str = "resource " + key + " is missing";
            Logger.getLogger(LocalizationBundle.class.getName()).log(Level.WARNING, str, ex);
            if (!missing.contains(key)) {
                missing.add(key);
            }
        }


        return str;
    }

    public final String[] getStringArray(String key) {
        String[] stringArray;

        try {
            stringArray = bundle.getStringArray(key);
        } catch (MissingResourceException ex) {
            String str = "resource " + key + " is missing";
            Logger.getLogger(LocalizationBundle.class.getName()).log(Level.WARNING, str, ex);
            stringArray = new String[]{};
            if (!missing.contains(key)) {
                missing.add(key);
            }
        }

        return stringArray;
    }

    public final Object getObject(String key) {
        Object object;

        try {

            object = bundle.getObject(key);

        } catch (Exception ex) {
            String str = "resource " + key + " is missing";
            Logger.getLogger(LocalizationBundle.class.getName()).log(Level.WARNING, str, ex);
            object = null;
            if (!missing.contains(key)) {
                missing.add(key);
            }
        }

        return object;
    }

    public Locale getLocale() {
        return bundle.getLocale();
    }

    public Enumeration<String> getKeys() {
        return bundle.getKeys();
    }

    public boolean containsKey(String key) {
        return bundle.containsKey(key);
    }

    public Set<String> keySet() {
        return bundle.keySet();
    }
}
