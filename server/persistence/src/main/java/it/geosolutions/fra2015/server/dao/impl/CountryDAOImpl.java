/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.dao.impl;

import com.googlecode.genericdao.search.ISearch;
import it.geosolutions.fra2015.server.dao.CountryDAO;
import it.geosolutions.fra2015.server.model.survey.Country;
import java.util.List;

/**
 *
 * @author marco
 */
public class CountryDAOImpl extends BaseDAO<Country, Long> implements CountryDAO {

    @Override
    public List<Country> search(ISearch search) {
        return super.search(search);
    }

    @Override
    public void persist(Country... entities) {
        super.persist(entities);
    }

    @Override
    public Country merge(Country entity) {
        return super.merge(entity);
    }

    @Override
    public boolean remove(Country entity) {
        return super.remove(entity);
    }

    @Override
    public boolean removeById(Long id) {
        return super.removeById(id);
    }
}
