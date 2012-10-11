package it.geosolutions.fra2015.webapp.actions;

import it.geosolutions.fra2015.webapp.Action;
import it.geosolutions.fra2015.webapp.ContextObjectFactory;
import it.geosolutions.fra2015.webapp.ResourceBundleManager;
import it.geosolutions.fra2015.webapp.ResponseObject;
import java.util.ResourceBundle;

/**
 *
 * @author francesco
 */
public abstract class AbstractAction implements Action {


    protected ResponseObject getResponseObject(String view) {

        ResponseObject ro = ContextObjectFactory.getResponseObject();

        ro.setView(view);
        
        ro.getResponseMap().put("strings", getResourceBundle("strings"));
        
        return ro;

    }
    
    public ResourceBundle getResourceBundle(String name) {
        return ResourceBundleManager.getInstance().getResourceBundle(name);
    }

}
