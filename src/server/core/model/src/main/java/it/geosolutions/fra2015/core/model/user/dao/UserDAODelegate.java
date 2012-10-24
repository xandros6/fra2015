package it.geosolutions.fra2015.core.model.user.dao;

import it.geosolutions.fra2015.core.model.AbstractDelegate;
import it.geosolutions.fra2015.core.model.user.User;
import java.util.List;

/**
 *
 * @author Francesco Rogo <f.rogo@computernopanic.com>
 * @date $(time)
 */
public class UserDAODelegate extends AbstractDelegate implements UserDAO {

    @Override
    public String getServiceName() {
        return SERVICE_PREFIX + "ejb/UserDAO";
    }

    @Override
    public void create(User entity) {
        ((UserDAO) getService()).create(entity);
    }

    @Override
    public User read(String key) {
        return ((UserDAO) getService()).read(key);
    }

    @Override
    public List<User> readAll() {
        return ((UserDAO) getService()).readAll();
    }

    @Override
    public User update(User user) {
        return ((UserDAO) getService()).update(user);
    }

    @Override
    public void delete(User user) {
        ((UserDAO) getService()).delete(user);
    }
}
