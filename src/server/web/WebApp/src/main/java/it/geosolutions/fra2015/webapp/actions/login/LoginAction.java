/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.webapp.actions.login;

import com.lidlesslabs.enterprise.RequestObject;
import com.lidlesslabs.enterprise.ResponseObject;
import it.geosolutions.fra2015.core.model.user.User;
import it.geosolutions.fra2015.webapp.actions.AbstractAction;
import java.util.Calendar;

/**
 *
 * @author francesco
 */
public class LoginAction extends AbstractAction {

    @Override
    public ResponseObject call(RequestObject request) {

        User user = (User) request.getSessionMap().get(User.class.getName());

        if (user != null) {
            return new LogoutAction().call(request);
        }

        return check(request);

    }

    protected ResponseObject check(RequestObject request) {

        String username = request.getString("username");

        if (username == null) {
            return fail();
        }

        User user = null; // UserDAO.load(username);

        if (user == null) {
            return fail();
        }

        if (user.getPassword().check(request.getString("password"))) {
            return success(user);
        }

        return fail();

    }

    protected ResponseObject fail() {
        ResponseObject responseObject = getResponseObject("login");
        responseObject.getResponseMap().put(User.class.getName(), null);
        responseObject.getResponseMap().put("message", "login.fail");
        return responseObject;
    }

    protected ResponseObject success(User user) {

        user.setLoginDate(Calendar.getInstance());
        user.setLoginCount(user.getLoginCount() + 1);
        
        // UserDao.update(user);

        ResponseObject responseObject = getResponseObject("home");
        responseObject.getResponseMap().put(User.class.getName(), user);
        
        return responseObject;
    }
}
