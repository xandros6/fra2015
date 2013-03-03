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

import it.geosolutions.fra2015.entrypoint.model.CountryValues;
import it.geosolutions.fra2015.server.model.survey.CompactValue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author DamianoG
 *
 */
public class ActivityLogUtils {

    private enum Changes {UPDATE,NEW,DELETED}
    
    /**
     * Compares for changes a new values set retrieved from HTTP request with the set stored on DB (called oldSet because it will be updated)
     * This comparation is done in order to handle dynamic form tables (we want to find deleted values) and
     * for the implementation of the activity log.
     * 
     * This iteration Logic is similar (but not equals) to the logic used in the services but is replicated in order to decouple the
     * activity log implementation with the raw persistence stuff.
     * 
     * @param newSet
     * @param oldSet
     * @return Map<String, String[]> representing the values that must be deleted from DB
     */
    public static List<String> compareValueSet(Map<String, String[]> newSet, List<CompactValue> oldSet){
        
        // The return set
        List<String> removedSet = new ArrayList<String>(); 
        
        //Iterate on the oldSet and search for updated values
        for(CompactValue el : oldSet){
            
            String oldVariable = el.getVariable();
            
            String oldContent = el.getContent();
            String newContent = newSet.get(oldVariable)[0];
            if(newContent == null){
                activityLog(Changes.DELETED);
                removedSet.add(oldVariable);
            }
            if(!oldContent.equals(newContent)){
                activityLog(Changes.UPDATE);
            }
        }
        
        //Iterate on the remaining values of newSet log them as ADDED Values
        for(String el : newSet.keySet()){
            activityLog(Changes.NEW);
        }
        
        return removedSet;
        
    }
    
    /**
     * This the entry point for the activity log implementation.
     * @param status
     */
    // TODO inject an activity log implementation ???
    // TODO add also the parameter relative to values
    private static void activityLog(Changes status){
        
    }
    
    
    
}
