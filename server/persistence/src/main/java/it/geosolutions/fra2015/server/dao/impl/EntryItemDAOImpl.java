/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.dao.impl;

import com.googlecode.genericdao.search.ISearch;
import it.geosolutions.fra2015.server.dao.EntryItemDAO;
import it.geosolutions.fra2015.server.model.survey.EntryItem;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author marco
 */
@Transactional(value = "fra2015TransactionManager")
public class EntryItemDAOImpl extends BaseDAO<EntryItem, Long> implements EntryItemDAO{
  
    @Override
    public List<EntryItem> search(ISearch search) {
        return super.search(search);
    }

    @Override
    public void persist(EntryItem... entities) {
        super.persist(entities);
    }

    @Override
    public EntryItem merge(EntryItem entity) {
        return super.merge(entity);
    }

    @Override
    public boolean remove(EntryItem entity) {
        return super.remove(entity);
    }

    @Override
    public boolean removeById(Long id) {
        return super.removeById(id);
    }    
}
