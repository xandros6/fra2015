package it.geosolutions.fra2015.webapp;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Francesco
 */
public class ResponseObject {

    private final Map<String, Object> response = new HashMap<String, Object>();
    private final Map<String, Object> session = new HashMap<String, Object>();
    protected String view = "";

    /**
     * Get the value of view
     *
     * @return the value of view
     */
    public String getView() {
        return view;
    }

    /**
     * Set the value of view
     *
     * @param view new value of view
     */
    public void setView(String view) {
        this.view = view;
    }

    public Map<String, Object> getResponseMap() {
        return response;
    }

    public Map<String, Object> getSessionMap() {
        return session;
    }

    public Object getValue(String key) {
        Object value = response.get(key);

        if (value == null) {
            
            value = session.get(key);

        }

        return value;
    }
}
