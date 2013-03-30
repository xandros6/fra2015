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
package it.geosolutions.fra2015.services;

import it.geosolutions.fra2015.server.dao.EntryItemDAO;
import it.geosolutions.fra2015.server.dao.NumberValueDAO;
import it.geosolutions.fra2015.server.dao.TextValueDAO;
import it.geosolutions.fra2015.server.model.survey.EntryItem;
import it.geosolutions.fra2015.server.model.survey.NumberValue;
import it.geosolutions.fra2015.server.model.survey.TextValue;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.googlecode.genericdao.search.Search;

/**
 * @author DamianoG
 * 
 * This class expose services to controller that load all the items present for a certain persisted Entity
 *
 */
public class BulkModelEntitiesLoader {

    @Autowired
    private EntryItemDAO entryItemDAO;
    
    @Autowired
    private TextValueDAO textValueDAO;
    
    @Autowired
    private NumberValueDAO textNumberDAO;
    
    /**
     * Bulk loading of all persisted EntryItem 
     * @return
     */
    public List<EntryItem> loadAllEntryItem(){
        
        return entryItemDAO.findAll();
    }
    
    /**
     * Bulk loading of all persisted TextValue
     * @return
     */
    public List<TextValue> loadAllTextValues(String iso3){
        
        Search searchCriteria = new Search();
        searchCriteria.addFilterEqual("country.iso3", iso3);
        return textValueDAO.search(searchCriteria);
    }
    
    /**
     * Bulk loading of all persisted TextValue
     * @return
     */
    public List<NumberValue> loadAllNumericValues(String iso3){
        
        Search searchCriteria = new Search();
        searchCriteria.addFilterEqual("country.iso3", iso3);
        return textNumberDAO.search(searchCriteria);
    }
}
