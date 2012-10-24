package it.geosolutions.fra2015.core.model.user.dao;

import it.geosolutions.fra2015.core.model.GenericDAO;
import it.geosolutions.fra2015.core.model.user.User;
import javax.ejb.Local;



/**
 *
 * @author Francesco Rogo <f.rogo@computernopanic.com>
 */
@Local
public interface UserDAO extends GenericDAO<User, String>{

}
