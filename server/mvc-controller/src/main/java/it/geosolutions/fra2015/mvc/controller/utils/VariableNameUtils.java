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

import it.geosolutions.fra2015.server.model.survey.CompactValue;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author DamianoG
 * 
 * Utility class used for retrieve the EntryItem and Feedback IDs from the plan text names used in the JSPs and viceversa.
 */
public class VariableNameUtils {

    
    public static String buildVariableAsText(CompactValue variable) {

        StringBuilder sb = new StringBuilder();
        sb.append("_fraVariable_");
        sb.append(variable.getVariable());
        if (!(variable.getRowNumber() == 0 && variable.getColumnNumber() == 0)) {
            sb.append("_");
            sb.append(variable.getRowNumber());
            sb.append("_");
            sb.append(variable.getColumnNumber());
        }
        sb.append("_");
        return sb.toString();
    }

    /**
     * A variable ID
     * 
     * @param param
     * @param value
     * @return
     */
    public static VariableName buildVariable(String param, String value) {

        VariableNameUtils vnu = new VariableNameUtils();
        VariableNameUtils.VariableName var = vnu.new VariableName();
        Pattern p = Pattern.compile("(?<=\\_)((\\p{Alnum})*?)(?=\\_)");
        Matcher m = p.matcher(param);
        
        boolean skip = false;
        for (int i =0; m.find(); i++) {
            switch(i){
                case 0 : 
                break;
                case 1 : var.variableName = m.group(0);
                break;
                case 2 : var.row = Integer.valueOf(m.group(0));
                break;
                case 3 : var.col = Integer.valueOf(m.group(0));
                break;
                default:
                return null;
            }
        } 
        var.value = value;

        return var;
    }
    
    /**
     * A feedback name is in the form _feedback_<varName>_
     * 
     * @param feedbackID
     * @return
     */
    public static String extractEntryIDfromFeedbackID(String feedbackID){
        
        Pattern p = Pattern.compile("(?<=\\_)((\\p{Alnum})*?)(?=\\_)");
        Matcher m = p.matcher(feedbackID);
        
        for (int i =0; m.find(); i++) {
            
            if(i==1){
                
                String varName = m.group(0);
                if(varName != null){
                    return varName;
                }
                return null;
            }
        }
        return null;
    }
    
    public static String buildfeedbackIDfromEntryID(String entryID){
        
        StringBuilder sb = new StringBuilder(); 
        sb.append("_feedback_").append(entryID).append("_");
        return sb.toString();
    }
    

    // TODO remove this ugly and useless class and use CompactValue directly
    public class VariableName {
        
        public VariableName(){}
        
        public String variableName;

        public int row;

        public int col;

        public String value;

        @Override
        public String toString() {
            StringBuilder sb = new StringBuilder();
            return sb.append("Istance of VariableName, values [").append(variableName).append("; ")
                    .append(row).append("; ").append(col).append("; ").append(value).append("]")
                    .toString();
        }
    }
    
    
    
}
