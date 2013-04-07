/*
 *  fra2015
 *  https://github.com/geosolutions-it/fra2015
 *  Copyright (C) 2012-2013 GeoSolutions S.A.S.
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

import com.googlecode.genericdao.search.Search;
import it.geosolutions.fra2015.server.dao.EntryDAO;
import it.geosolutions.fra2015.server.dao.QuestionDAO;
import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.server.model.survey.Question;
import java.util.Collection;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.InitializingBean;

import org.apache.log4j.Logger;

/**
 * @author DamianoG
 * @author ETj
 * 
 *         This class hold The whole Entry Set for the survey to avoid the need for load it everytime is needed.
 * 
 */
public class SurveyCatalog implements InitializingBean {

    private static final Logger LOGGER = Logger.getLogger(SurveyCatalog.class);

    private Map<String, Entry> entryMap;
    private Map<Long, List<Entry>> questionMap;
    private Set<Entry> allEntries;

    private EntryDAO entryDAO;
    private QuestionDAO questionDAO;


    public SurveyCatalog() {
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        reinit();
    }

    /**
     * May be called by the FRAInit when imorting the survey for the very first time.
     */
    public synchronized void reinit() {
        LOGGER.info("Caching catalog....");

        questionMap = new HashMap<Long, List<Entry>>();
        entryMap = new HashMap<String, Entry>();
        allEntries = new HashSet<Entry>();
        
        List<Question> questions = questionDAO.findAll();
        for (Question lazyQuestion : questions) {
            Search search = new Search(Question.class);
            search.addFetch("entries");
            search.addFilterEqual("id", lazyQuestion.getId());
            Question question = questionDAO.searchUnique(search);

            questionMap.put(question.getId(), question.getEntries());

            for (Entry entry : question.getEntries()) {
                entryMap.put(entry.getVariable(), entry);                
            }

            allEntries.addAll(question.getEntries());
        }

        LOGGER.info("Loaded " + questions.size() + " questions  and " + allEntries.size() + " entries");
    }

    /**
     * @return the catalog
     */
    public Set<Entry> getAllEntries() {

        return allEntries;
    }

    /**
     * Provide to the caller the entries stored in the catalog that are related to a given question
     * If questionNumber == null retrieve the full catalog
     * 
     * @param questionNumber
     * @return
     */
    public Collection<Entry> getEntriesForQuestion(Long questionNumber) {
        if(questionNumber == null){
            return getAllEntries();
        }

        return questionMap.get(questionNumber);
    }
    
    /**
     * Return the number of questions of this survey
     * @return
     */
    public int countAllSurveyQuestions(){
        
        return questionMap.keySet().size();
    }

    /**
     * Get the Entry stored in the catalog with entry.getVariable().equals(varName)
     * 
     * @param questionNumber
     * @return
     */
    public Entry getEntry(String varName) {
        return entryMap.get(varName);
    }


    /**
     * @param surveyDAO the surveyDAO to set
     */
    public void setEntryDAO(EntryDAO entryDAO) {
        this.entryDAO = entryDAO;
    }

    public void setQuestionDAO(QuestionDAO questionDAO) {
        this.questionDAO = questionDAO;
    }

}
