package it.geosolutions.fra2015.webapp.actions;

import it.geosolutions.fra2015.core.model.user.User;
import it.geosolutions.fra2015.core.model.enums.UserGroup;
import it.geosolutions.fra2015.webapp.RequestObject;
import it.geosolutions.fra2015.webapp.ResponseObject;
import it.geosolutions.fra2015.webapp.actions.admin.AdministrationAction;

/**
 *
 * @author francesco
 */
public class HomeAction extends AbstractAction {
    
    @Override
    public ResponseObject call(RequestObject request) {
        
        User user = (User)request.getSessionMap().get(User.class.getName());
        
        if (user.getUserGroup().equals(UserGroup.ADMINISTRATOR)) {
            return new AdministrationAction().call(request);
        }
        
        return getResponseObject("home");
        
    }
    
}
