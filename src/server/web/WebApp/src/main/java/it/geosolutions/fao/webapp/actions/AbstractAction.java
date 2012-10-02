package it.geosolutions.fao.webapp.actions;

import com.lidlesslabs.enterprise.Action;
import com.lidlesslabs.enterprise.ContextObjectFactory;
import com.lidlesslabs.enterprise.ResponseObject;

/**
 *
 * @author francesco
 */
public abstract class AbstractAction implements Action {

    protected ResponseObject getResponseObject(String view) {

        ResponseObject ro = ContextObjectFactory.getResponseObject();
        ro.setView(view);
        return ro;

    }
}
