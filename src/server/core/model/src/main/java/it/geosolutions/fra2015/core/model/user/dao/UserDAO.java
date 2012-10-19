package it.geosolutions.fra2015.core.model.user.dao;

import it.geosolutions.fra2015.core.model.user.User;
import java.util.List;

/**
 *
 * @author Francesco Rogo <f.rogo@computernopanic.com>
 */
public interface UserDAO {

    String create(String username, String password, String usergroup);

    User read(String username);

    void update(User user);

    void delete(User user);
    
    List<User> readAll();

}
