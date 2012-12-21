/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.dao.impl;

import com.googlecode.genericdao.search.ISearch;
import it.geosolutions.fra2015.server.dao.TokenDAO;
import it.geosolutions.fra2015.server.model.user.Token;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author marco
 */
@Transactional(value = "fra2015TransactionManager")
public class TokenDAOImpl extends BaseDAO<Token, Long> implements TokenDAO{

    @Override
    public List<Token> search(ISearch search) {
        return super.search(search);
    }

    @Override
    public void persist(Token... entities) {
        super.persist(entities);
    }

    @Override
    public Token merge(Token entity) {
        return super.merge(entity);
    }

    @Override
    public boolean remove(Token entity) {
        return super.remove(entity);
    }

    @Override
    public boolean removeById(Long id) {
        return super.removeById(id);
    }
}
