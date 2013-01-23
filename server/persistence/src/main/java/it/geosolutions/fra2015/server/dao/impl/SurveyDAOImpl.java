/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.dao.impl;

import com.googlecode.genericdao.search.ISearch;
import it.geosolutions.fra2015.server.dao.SurveyDAO;
import it.geosolutions.fra2015.server.model.survey.Survey;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author marco
 */
@Transactional(value = "fra2015TransactionManager")
public class SurveyDAOImpl extends BaseDAO<Survey, Long> implements SurveyDAO{

    @Override
    public List<Survey> search(ISearch search) {
        return super.search(search);
    }

    @Override
    public void persist(Survey... entities) {
        super.persist(entities);
    }

    @Override
    public Survey merge(Survey entity) {
        return super.merge(entity);
    }

    @Override
    public boolean remove(Survey entity) {
        return super.remove(entity);
    }

    @Override
    public boolean removeById(Long id) {
        return super.removeById(id);
    }
}
