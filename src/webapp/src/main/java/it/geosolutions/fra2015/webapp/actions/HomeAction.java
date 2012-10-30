package it.geosolutions.fra2015.webapp.actions;

import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.server.model.user.enums.UserGroup;
import it.geosolutions.fra2015.webapp.RequestObject;
import it.geosolutions.fra2015.webapp.ResponseObject;
import it.geosolutions.fra2015.webapp.actions.admin.AdministrationAction;
import it.geosolutions.fra2015.webapp.actions.login.LoginAction;

/**
 *
 * @author francesco
 */
public class HomeAction extends AbstractAction {
    
    @Override
    public ResponseObject call(RequestObject request) {
        
        User user = (User)request.getSessionMap().get(User.class.getName());
        
        if (user == null) {
            return new LoginAction().call(request);
        }
        
        if (user.getUserGroup().equals(UserGroup.ADMINISTRATOR)) {
            return new AdministrationAction().call(request);
        }
        
        return getResponseObject("home");
        
    }
    
}
