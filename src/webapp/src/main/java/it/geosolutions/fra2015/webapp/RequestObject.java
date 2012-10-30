package it.geosolutions.fra2015.webapp;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Francesco
 */
public class RequestObject {

    public RequestObject(HttpServletRequest request) {
        super();
        this.request = request;
        
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public Locale getLocale() {
        Locale locale = (Locale) sessionMap.get("session.locale");

        if (locale != null) {
            return locale;
        }
        
        if (request.getHeader("accept-language").startsWith("it")) {
            return Locale.ITALY;
        }
        
        return Locale.UK;
    }

    private final HttpServletRequest request;
    private final Map<String, Object> requestMap = new HashMap<String, Object>();
    private final Map<String, Object> sessionMap = new HashMap<String, Object>();
    protected String requestCommand;

    /**
     * Get the value of requestCommand
     *
     * @return the value of requestCommand
     */
    public String getRequestCommand() {
        return requestCommand;
    }

    /**
     * Set the value of requestCommand
     *
     * @param requestCommand new value of requestCommand
     */
    public void setRequestCommand(String requestCommand) {
        this.requestCommand = requestCommand;
    }

    public Map<String, Object> getRequestMap() {
        return requestMap;
    }

    public Map<String, Object> getSessionMap() {
        return sessionMap;
    }

    public Object getValue(String key) {
        Object value = requestMap.get(key);

        if (value == null) {
            value = sessionMap.get(key);
        }

        if (value instanceof Object[]) {
            value = ((Object[]) value)[0];
        }

        return value;
    }

    public String getString(String key) {
        Object value = getValue(key);
        if (value != null && value instanceof String) {
            return (String) value;
        }
        return null;
    }

    public Boolean getBoolean(String key) {
        try {
            String str = getString(key);
            if (str != null) {
                return Boolean.parseBoolean(getString(key));
            }
        } catch (NumberFormatException ex) {
            Logger.getLogger(RequestObject.class.getName()).log(Level.SEVERE, "invalid " + key, ex);
        }
        return null;
    }

    public Integer getInteger(String key) {
        try {
            String str = getString(key);
            if (str != null) {
                return Integer.parseInt(str);
            }
        } catch (NumberFormatException ex) {
            Logger.getLogger(RequestObject.class.getName()).log(Level.INFO, "invalid " + key, ex);
        }
        return null;
    }

    public Long getLong(String key) {
        try {
            String str = getString(key);
            if (str != null) {
                return Long.parseLong(getString(key));
            }
        } catch (NumberFormatException ex) {
            Logger.getLogger(RequestObject.class.getName()).log(Level.SEVERE, "invalid " + key, ex);
        }
        return null;
    }

    public Double getDouble(String key) {
        try {
            String str = getString(key);
            if (str != null) {
                return Double.parseDouble(str);
            }
        } catch (NumberFormatException ex) {
            Logger.getLogger(RequestObject.class.getName()).log(Level.SEVERE, "invalid " + key, ex);

        }
        return null;
    }

    public Float getFloat(String key) {
        try {
            String str = getString(key);
            if (str != null) {
                return Float.parseFloat(str);
            }
        } catch (NumberFormatException ex) {
            Logger.getLogger(RequestObject.class.getName()).log(Level.SEVERE, "invalid " + key, ex);

        }
        return null;
    }

    public Byte getByte(String key) {
        try {
            String str = getString(key);
            if (str != null) {
                return Byte.parseByte(str);
            }
        } catch (NumberFormatException ex) {
            Logger.getLogger(RequestObject.class.getName()).log(Level.SEVERE, "invalid key:" + key, ex);
        }

        return null;
    }

    public Object[] getArray(String key) {
        Object value = requestMap.get(key);

        if (value == null) {
            value = sessionMap.get(key);
        }

        return (Object[]) value;
    }

    public Integer[] getIntegerArray(String key) {

        try {

            Object[] arr = this.getArray(key);

            if (arr != null) {

                String[] tokens = (String[]) arr;
                Integer[] result = new Integer[tokens.length];
                for (int i = 0; i < tokens.length; i++) {
                    result[i] = Integer.parseInt(tokens[i]);
                }

                return result;
            }

        } catch (Exception ex) {
            Logger.getLogger(RequestObject.class.getName()).log(Level.SEVERE, null, ex);
        }

        return new Integer[]{};
    }

    public Long[] getLongArray(String key) {

        try {

            Object[] arr = this.getArray(key);

            if (arr != null) {

                String[] tokens = (String[]) arr;
                Long[] result = new Long[tokens.length];
                for (int i = 0; i < tokens.length; i++) {
                    result[i] = Long.parseLong(tokens[i]);
                }

                return result;
            }

        } catch (Exception ex) {
            Logger.getLogger(RequestObject.class.getName()).log(Level.SEVERE, null, ex);
        }

        return new Long[]{};
    }

    public Double[] getDoubleArray(String key) {

        try {

            Object[] arr = this.getArray(key);

            if (arr != null) {

                String[] tokens = (String[]) arr;
                Double[] result = new Double[tokens.length];
                for (int i = 0; i < tokens.length; i++) {
                    result[i] = Double.parseDouble(tokens[i]);
                }

                return result;
            }

        } catch (Exception ex) {
            Logger.getLogger(RequestObject.class.getName()).log(Level.SEVERE, null, ex);
        }

        return new Double[]{};
    }

    public Float[] getFloatArray(String key) {

        try {

            Object[] arr = this.getArray(key);

            if (arr != null) {

                String[] tokens = (String[]) arr;
                Float[] result = new Float[tokens.length];
                for (int i = 0; i < tokens.length; i++) {
                    result[i] = Float.parseFloat(tokens[i]);
                }

                return result;
            }

        } catch (Exception ex) {
            Logger.getLogger(RequestObject.class.getName()).log(Level.SEVERE, null, ex);
        }

        return new Float[]{};
    }

    public Byte[] getByteArray(String key) {

        try {

            Object[] arr = this.getArray(key);

            if (arr != null) {

                String[] tokens = (String[]) arr;
                Byte[] result = new Byte[tokens.length];
                for (int i = 0; i < tokens.length; i++) {
                    result[i] = Byte.parseByte(tokens[i]);
                }

                return result;
            }

        } catch (Exception ex) {
            Logger.getLogger(RequestObject.class.getName()).log(Level.SEVERE, null, ex);
        }

        return new Byte[]{};
    }

    public String[] getStringArray(String key) {
        Object[] arr = this.getArray(key);

        if (arr != null) {

            return (String[]) arr;

        }

        return new String[]{};
    }
    private final static SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmmss");

    public Calendar getCalendar(String key) {
        try {
            String str = getString(key);
            if (str != null) {
                Date date = inputFormat.parse(str);
                Calendar c = Calendar.getInstance();
                c.setTime(date);
                return c;
            }
        } catch (ParseException ex) {
            Logger.getLogger(RequestObject.class.getName()).log(Level.SEVERE, "invalid key:" + key, ex);
        }
        return null;
    }

}
