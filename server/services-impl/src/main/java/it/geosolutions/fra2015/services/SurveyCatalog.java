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
import it.geosolutions.fra2015.server.dao.QuestionDAO;
import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.server.model.survey.Question;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author DamianoG
 * 
 *         This class hold The whole Entry Set for the survey to avoid the need for load it everytime is needed.
 * 
 */
public class SurveyCatalog {

    private EntryDAO entryDAO;

    private QuestionDAO questionDAO;

    private EntryItemDAO entryItemDAO;

    private List<Entry> catalog;

    private Map<String, Entry> catalogMap;

    /**
     * @param surveyDAO the surveyDAO to set
     */
    public void setEntryDAO(EntryDAO entryDAO) {
        this.entryDAO = entryDAO;
    }

    public void setQuestionDAO(QuestionDAO questionDAO) {
        this.questionDAO = questionDAO;
    }

    /**
     * @return the catalog
     */
    public List<Entry> getCatalog() {
        // Load the catalog when th first access to it is performed
        forceCatalogLoading();
        return catalog;
    }

    /**
     * Provide to the caller the entries stored in the catalog that are related to a given question
     * If questionNumber == null retrieve the full catalog
     * 
     * @param questionNumber
     * @return
     */
    public List<Entry> getEntriesForQuestion(Integer questionNumber) {
        if(questionNumber == null){
            return getCatalog();
        }
        forceCatalogLoading();
        Question question = questionDAO.find(questionNumber.longValue());
        List<Entry> questionEntryList = question.getEntries();
        return questionEntryList;
    }

    /**
     * Get the Entry stored in the catalog with entry.getVariable().equals(varName)
     * 
     * @param questionNumber
     * @return
     */
    public Entry getEntry(String varName) {
        return catalogMap.get(varName);
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

    private void forceCatalogLoading() {
        if (catalog == null) {
            // entryItemDAO.findAll();
            catalog = entryDAO.findAll();
            // build the catalog as HashMap
            catalogMap = new HashMap<String, Entry>();
            for (Entry el : catalog) {
                catalogMap.put(el.getVariable(), el);
            }
        }
    }

    public SurveyCatalog() {

    }

}
