/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.dao.impl;

import com.googlecode.genericdao.search.ISearch;
import it.geosolutions.fra2015.server.dao.NumberValueDAO;
import it.geosolutions.fra2015.server.model.survey.NumberValue;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author marco
 */
@Transactional(value = "fra2015TransactionManager")
public class NumberValueDAOImpl extends BaseDAO<NumberValue, Long> implements NumberValueDAO{
        @Override
    public List<NumberValue> search(ISearch search) {
        return super.search(search);
    }

    @Override
    public void persist(NumberValue... entities) {
        super.persist(entities);
    }

    @Override
    public NumberValue merge(NumberValue entity) {
        return super.merge(entity);
    }

    @Override
    public boolean remove(NumberValue entity) {
        return super.remove(entity);
    }

    @Override
    public boolean removeById(Long id) {
        return super.removeById(id);
    }
}
