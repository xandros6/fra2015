package it.geosolutions.fra2015.webapp.actions;

import it.geosolutions.fra2015.webapp.Action;
import it.geosolutions.fra2015.webapp.ContextObjectFactory;
import it.geosolutions.fra2015.webapp.LocalizationBundle;
import it.geosolutions.fra2015.webapp.ResourceBundleManager;
import it.geosolutions.fra2015.webapp.ResponseObject;

/**
 *
 * @author francesco
 */
public abstract class AbstractAction implements Action {

    protected ResponseObject getResponseObject(String view) {

        ResponseObject ro = ContextObjectFactory.getResponseObject();

        ro.setView(view);

        ro.getResponseMap().put("strings", getLocalizationBundle("strings"));

        return ro;

    }

    public LocalizationBundle getLocalizationBundle(String name) {
        return ResourceBundleManager.getInstance().getLocalizationBundle(name);
    }
}
