package it.geosolutions.fra2015.webapp.actions.login;

import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.webapp.RequestObject;
import it.geosolutions.fra2015.webapp.ResponseObject;
import it.geosolutions.fra2015.webapp.actions.AbstractAction;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

/**
 *
 * @author francesco
 */
public class LogoutAction extends AbstractAction {

    public LogoutAction() {
    }

    @Override
    public ResponseObject call(RequestObject request) {
        ResponseObject response = getResponseObject("login");

        User user = (User) request.getSessionMap().get(User.class.getName());

        if (user == null) {
            Logger.getLogger(LogoutAction.class.getName()).log(Level.WARN, "nessun utente attualmente connesso");
            return response;
        }

        response.getSessionMap().put(User.class.getName(), null);

        Logger.getLogger(LogoutAction.class.getName()).log(Level.INFO, user.getName() + " logged out");

        return response;

    }
}
