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

import it.geosolutions.fra2015.server.dao.EntryDAO;
import it.geosolutions.fra2015.server.dao.EntryItemDAO;
import it.geosolutions.fra2015.server.dao.impl.EntryItemDAOImpl;
import it.geosolutions.fra2015.server.model.survey.Entry;

import java.util.ArrayList;
import java.util.List;

/**
 * @author DamianoG
 * 
 * This class hold The whole Entry Set for the survey to avoid the need for load it everytime is needed. 
 * 
 */
public class SurveyCatalog {

    private EntryDAO entryDAO;
    private EntryItemDAO entryItemDAO;
    private List<Entry> catalog;
    
    
    /**
     * @param surveyDAO the surveyDAO to set
     */
    public void setEntryDAO(EntryDAO entryDAO) {
        this.entryDAO = entryDAO;
    }

    

    /**
     * @return the catalog
     */
    public List<Entry> getCatalog() {
        if(catalog == null){
//            entryItemDAO.findAll();
            catalog = entryDAO.findAll();
        }
        return catalog;
    }

    /**
     * Provide to the caller the entries stored in the catalog that are related to a given question
     * 
     * @param questionNumber
     * @return
     */
    public List<Entry> getCatalogForQuestion(Integer questionNumber) {
        
        List<Entry> questionEntryList = new ArrayList<Entry>();
        List<Entry> catalog = getCatalog();
        for(Entry el : catalog){
            if(el.getQuestionNumber()!=null){
                if(questionNumber.equals(Integer.parseInt(el.getQuestionNumber()))){
                    questionEntryList.add(el);
                }
            }
        }
        return questionEntryList;
    }


    /**
     * @param catalog the catalog to set
     */
    public void setCatalog(List<Entry> catalog) {
        this.catalog = catalog;
    }



    /**
     * @param entryItemDAO the entryItemDAO to set
     */
    public void setEntryItemDAO(EntryItemDAO entryItemDAO) {
        this.entryItemDAO = entryItemDAO;
    }



    public SurveyCatalog(){
        
    }

    
}
