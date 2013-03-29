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

import it.geosolutions.fra2015.server.dao.ActivityLogDAO;
import it.geosolutions.fra2015.server.model.survey.ActivityLogEntry;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.googlecode.genericdao.search.ISearch;
import com.googlecode.genericdao.search.Search;
import com.googlecode.genericdao.search.Sort;

/**
 * @author DamianoG
 * 
 */
@Transactional(value = "fra2015TransactionManager")
public class ActivityLogDAOImpl extends BaseDAO<ActivityLogEntry, Long> implements ActivityLogDAO{

    @Override
    public List<ActivityLogEntry> search(ISearch search) {
        return super.search(search);
    }
    
    @Override
    public void persist(ActivityLogEntry... entities) {
        super.persist(entities);
    }

    @Override
    public ActivityLogEntry[] save(ActivityLogEntry... entities) {
        return super.save(entities);
    }

    @Override
    public ActivityLogEntry merge(ActivityLogEntry entity) {
        return super.merge(entity);
    }

    @Override
    public boolean remove(ActivityLogEntry entity) {
        return super.remove(entity);
    }

    @Override
    public List<ActivityLogEntry> findByTimeInterval(String c, Long t1, Long t2, int page, int entries) {
        
        Search searchCriteria = new Search(ActivityLogEntry.class);
        searchCriteria.setMaxResults(entries);
        searchCriteria.setPage(page);
        //searchCriteria.setFirstResult(-100); // not needed: by default is -1
        searchCriteria.addFilterGreaterOrEqual("time", t1);
        searchCriteria.addFilterLessOrEqual("time", t2);
        
        return  this.search(searchCriteria);
    }

    @Override
    public List<ActivityLogEntry> findByEntryItemName(String c, String entryItemName, int page, int entries) {

        Search searchCriteria = new Search(ActivityLogEntry.class);
        searchCriteria.setMaxResults(entries);
        searchCriteria.setPage(page);
        //searchCriteria.setFirstResult(-100); // not needed: by default is -1
        searchCriteria.addFilterEqual("country", c);
        searchCriteria.addFilterEqual("varName", entryItemName);
        
        return  this.search(searchCriteria);
    }

    @Override
    public List<ActivityLogEntry> findByQuestionAndUsername(String c, String question, String username, int page,int entries) {
        
        Search searchCriteria = new Search(ActivityLogEntry.class);
        searchCriteria.setMaxResults(entries);
        searchCriteria.setPage(page);
        //searchCriteria.setFirstResult(-100); // not needed: by default is -1
        searchCriteria.addFilterEqual("country", c);
        searchCriteria.addFilterEqual("username", username);
        
        return  this.search(searchCriteria);
    }

    @Override
    public List<ActivityLogEntry> find(int page, int entries) {
    	Search searchCriteria = new Search(ActivityLogEntry.class);
    	searchCriteria.addSort(new Sort("time",true));
    	searchCriteria.setMaxResults(entries);
    	searchCriteria.setPage(page);  	
    	return  this.search(searchCriteria);
    }
    
}
