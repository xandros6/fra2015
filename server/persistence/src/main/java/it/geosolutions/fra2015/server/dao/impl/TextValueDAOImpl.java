/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.dao.impl;

import com.googlecode.genericdao.search.ISearch;
import it.geosolutions.fra2015.server.dao.TextValueDAO;
import it.geosolutions.fra2015.server.model.survey.TextValue;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author marco
 */
@Transactional(value = "fra2015TransactionManager")
public class TextValueDAOImpl extends BaseDAO<TextValue, Long> implements TextValueDAO{

    @Override
    public List<TextValue> search(ISearch search) {
        return super.search(search);
    }

    @Override
    public void persist(TextValue... entities) {
        super.persist(entities);
    }

    @Override
    public TextValue merge(TextValue entity) {
        return super.merge(entity);
    }

    @Override
    public boolean remove(TextValue entity) {
        return super.remove(entity);
    }

    @Override
    public boolean removeById(Long id) {
        return super.removeById(id);
    }
    
}
