package it.geosolutions.fra2015.webapp.actions.login;

import it.geosolutions.fra2015.core.model.user.User;
import it.geosolutions.fra2015.webapp.RequestObject;
import it.geosolutions.fra2015.webapp.ResponseObject;
import it.geosolutions.fra2015.webapp.actions.AbstractAction;
import it.geosolutions.fra2015.webapp.actions.HomeAction;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author francesco
 */
public class LogoutAction extends AbstractAction {

    public LogoutAction() {
    }

    @Override
    public ResponseObject call(RequestObject request) {
        ResponseObject response = new HomeAction().call(request);

        User user = (User) request.getSessionMap().get(User.class.getName());

        if (user == null) {
            Logger.getLogger(LogoutAction.class.getName()).log(Level.WARNING, "nessun utente attualmente connesso");
            return response;
        }
        
        response.getSessionMap().put(User.class.getName(), null);
        
        Logger.getLogger(LogoutAction.class.getName()).log(Level.INFO, "{0} logged out",user.getUsername());
        
        return response;
        
    }
}
