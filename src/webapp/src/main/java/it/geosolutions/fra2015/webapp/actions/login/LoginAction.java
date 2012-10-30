package it.geosolutions.fra2015.webapp.actions.login;

import it.geosolutions.fra2015.server.model.User;
import it.geosolutions.fra2015.server.model.enums.UserGroup;
import it.geosolutions.fra2015.webapp.RequestObject;
import it.geosolutions.fra2015.webapp.ResponseObject;
import it.geosolutions.fra2015.webapp.actions.AbstractAction;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;

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

        Logger.getLogger(LoginAction.class.getName()).log(Level.INFO, "check username {0}", username);

        if (username == null) {
            return page();
        }

//        User user = null; // UserDAO.load(username);
//
//        if (user == null) {
//            return fail();
//        }



        String password = request.getString("password");
        
        /*
         * @todo remove from here
         */

        Logger.getLogger(LoginAction.class.getName()).log(Level.INFO, "password:{0}", password);


        if (true) {

            if ("admin".equals(username) && "admin".equals(password)) {
                return success(createUser(username, UserGroup.ADMINISTRATOR));
            } else if ("reviser".equals(username) && "reviser".equals(password)) {
                return success(createUser(username, UserGroup.SUPERUSER));
            } else if ("user".equals(username) && "user".equals(password)) {
                return success(createUser(username, UserGroup.USER));
            } else if ("guest".equals(username) && "guest".equals(password)) {
                return success(createUser(username, UserGroup.GUEST));
            }

        }
        /*
         * @todo to here
         */

//        if (user.getPassword().check(password)) {
//            return success(user);
//        }



        return fail();

    }

    protected ResponseObject page() {
        ResponseObject responseObject = getResponseObject("login");
        return responseObject;
    }

    protected ResponseObject fail() {
        ResponseObject responseObject = getResponseObject("false");
        responseObject.getSessionMap().put(User.class.getName(), null);
        responseObject.getResponseMap().put("message", "login.fail");
        return responseObject;
    }

    protected ResponseObject success(User user) {

//        user.setLoginDate(Calendar.getInstance());
//        user.setLoginCount(user.getLoginCount() + 1);

        // UserDao.update(user);

        ResponseObject responseObject = getResponseObject("true");
        responseObject.getSessionMap().put(User.class.getName(), user);

        return responseObject;
    }

    protected User createUser(String username, UserGroup group) {
        User user = new User();
        user.setName(username);
        user.setUserGroup(group);
        return user;
    }
}
