package it.geosolutions.fra2015.webapp.actions.admin;

import it.geosolutions.fra2015.webapp.RequestObject;
import it.geosolutions.fra2015.webapp.ResponseObject;
import it.geosolutions.fra2015.webapp.actions.AbstractAction;

/**
 *
 * @author francesco
 */
public class AdministrationAction extends AbstractAction {

    @Override
    public ResponseObject call(RequestObject request) {
        ResponseObject responseObject = getResponseObject("admin");
        return responseObject;
    }
}
