
package it.geosolutions.fra2015.core.model.user.dao;

import it.geosolutions.fra2015.core.model.user.User;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Francesco Rogo <f.rogo@computernopanic.com>
 * @date $(time)
 */
@Stateless
public class UserDAOImpl implements UserDAO {
    
    @PersistenceContext(unitName="pu_fra2015")
    EntityManager em;

    @Override
    public void create(User entity) {
        em.persist(entity);
    }

    @Override
    public User read(String key) {
        return em.find(User.class, key);
    }

    @Override
    public List<User> readAll() {
        Query q = em.createNamedQuery("user.select.all");
        return q.getResultList();
    }

    @Override
    public User update(User user) {
        return em.merge(user);
    }

    @Override
    public void delete(User user) {
        em.remove(user);
    }

}
