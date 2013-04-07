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
package it.geosolutions.fra2015.mvc.controller.utils;

import it.geosolutions.fra2015.server.model.survey.Question;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.SurveyCatalog;
import it.geosolutions.fra2015.services.UserService;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @author DamianoG
 *
 */
public class ReviewerUtils {

    private SurveyCatalog catalog; 
    private UserService userServices;
    
    public ReviewerUtils(SurveyCatalog catalog, UserService userServices){
        
        this.catalog = catalog;
        this.userServices = userServices;
    }
    
    /**
     * 
     * @param reviewers a List of reviewers that has already been submit their revision
     * @return
     */
    public String getSurveyCoverage(List<String> reviewers){
        
        List<Question> revisionedQuestions = new ArrayList<Question>();
        for(String el : reviewers){
            
            User tmpUser = null;
            try {
                tmpUser = userServices.get(el);
            } catch (NotFoundServiceEx e) {
                continue;
            }
            if(tmpUser == null){
                continue;
            }
            Set<Question> questions = tmpUser.getQuestions();
            for(Question q : questions){

                if(!revisionedQuestions.contains(q)){
                    
                    revisionedQuestions.add(q);
                }
            }
        }
        StringBuilder sb = new StringBuilder();
        sb.append(revisionedQuestions.size()).append(" / ").append(catalog.countAllSurveyQuestions()-1);
        return sb.toString();
    } 
}
