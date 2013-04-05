/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.dao.impl;

import it.geosolutions.fra2015.server.dao.QuestionDAO;
import it.geosolutions.fra2015.server.model.survey.Question;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.googlecode.genericdao.search.ISearch;

/**
 *
 * @author marco
 */
@Transactional(value = "fra2015TransactionManager")
public class QuestionDAOImpl extends BaseDAO<Question, Long> implements QuestionDAO {

    @Override
    public List<Question> search(ISearch search) {
        return super.search(search);
    }

    @Override
    public Question searchUnique(ISearch search) {
        return super.searchUnique(search);
    }

    @Override
    public void persist(Question... entities) {
        super.persist(entities);
    }

    @Override
    public Question merge(Question entity) {
        return super.merge(entity);
    }

    @Override
    public boolean remove(Question entity) {
        return super.remove(entity);
    }

    @Override
    public boolean removeById(Long id) {
        return super.removeById(id);
    }
}
