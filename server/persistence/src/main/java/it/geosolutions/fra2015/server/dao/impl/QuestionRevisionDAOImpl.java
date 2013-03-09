/*
 *  fra2015
 *  https://github.com/geosolutions-it/fra2015
 *  Copyright (C) 2007-2012 GeoSolutions S.A.S.
 *  http://www.geo-solutions.it
 *
 *  GPLv3 + Classpath exception
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package it.geosolutions.fra2015.server.dao.impl;

import it.geosolutions.fra2015.server.dao.QuestionRevisionDAO;
import it.geosolutions.fra2015.server.model.survey.QuestionRevision;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.googlecode.genericdao.search.ISearch;

/**
 * 
 * @author DamianoG
 */
@Transactional(value = "fra2015TransactionManager")
public class QuestionRevisionDAOImpl extends BaseDAO<QuestionRevision, Long> implements QuestionRevisionDAO {

    @Override
    public List<QuestionRevision> search(ISearch search) {
        return super.search(search);
    }
    
    @Override
    public void persist(QuestionRevision... entities) {
        super.persist(entities);
    }

    @Override
    public QuestionRevision[] save(QuestionRevision... entities) {
        return super.save(entities);
    }

    @Override
    public QuestionRevision merge(QuestionRevision entity) {
        return super.merge(entity);
    }

    @Override
    public boolean remove(QuestionRevision entity) {
        return super.remove(entity);
    }

}
