package it.geosolutions.fra2015.webapp.actions.admin;

import it.geosolutions.fra2015.server.model.enums.UserGroup;
import it.geosolutions.fra2015.webapp.RequestObject;
import it.geosolutions.fra2015.webapp.ResponseObject;
import it.geosolutions.fra2015.webapp.actions.AbstractAction;

/**
 *
 * @author francesco
 */
public class UsersAction extends AbstractAction {

    @Override
    public ResponseObject call(RequestObject request) {
        ResponseObject responseObject = getResponseObject("users");
        responseObject.getResponseMap().put(UserGroup.class.getName(), UserGroup.ADMINISTRATOR);
        return responseObject;
    }
    
}
