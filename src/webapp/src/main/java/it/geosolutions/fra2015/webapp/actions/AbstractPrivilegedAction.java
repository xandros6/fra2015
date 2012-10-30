package it.geosolutions.fra2015.webapp.actions;

import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.server.model.user.enums.UserGroup;
import it.geosolutions.fra2015.webapp.RequestObject;
import it.geosolutions.fra2015.webapp.ResponseObject;
import it.geosolutions.fra2015.webapp.actions.login.LoginAction;

/**
 *
 * @author Francesco Rogo <f.rogo@computernopanic.com>
 * @date $(time)
 */
public abstract class AbstractPrivilegedAction extends AbstractAction {

    public AbstractPrivilegedAction() {
    }

    public AbstractPrivilegedAction(UserGroup group) {
        this.userGroup = group;
    }

    public abstract ResponseObject privilegedCall(RequestObject request);

    @Override
    public ResponseObject call(RequestObject request) {

        User user = (User) request.getSessionMap().get(User.class.getName());

        if (user == null) {
            return new LoginAction().call(request);
        }

        if (!getUserGroup().check(user.getUserGroup())) {
            return getResponseObject("error");
        }


        return privilegedCall(request);
    }
    private UserGroup userGroup = UserGroup.GUEST;

    /**
     * Get the value of userGroup
     *
     * @return the value of userGroup
     */
    public UserGroup getUserGroup() {
        return userGroup;
    }

    /**
     * Set the value of userGroup
     *
     * @param userGroup new value of userGroup
     */
    public void setUserGroup(UserGroup userGroup) {
        if (userGroup == null) {
            throw new NullPointerException();
        }
        this.userGroup = userGroup;
    }
}
