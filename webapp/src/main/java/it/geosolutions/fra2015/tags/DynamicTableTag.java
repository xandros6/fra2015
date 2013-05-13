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
package it.geosolutions.fra2015.tags;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.LocaleResolver;

/**
 * Custom Tag that handle the dynamic table. print the html needed for the rows and coloumn of the table
 * The user is responsible for write explicitally handle <table> tag and the header of the table
 * 
 * @author DamianoG
 * 
 */
@SuppressWarnings("serial")
public class DynamicTableTag extends SurveyEntry {

    private Logger LOGGER = Logger.getLogger(this.getClass());

    private String entryItemName;

    private int numOfColoumn;
    
    /**
     * if the entry are in Write or Read mode
     */
    private String operation;
    
    /**
     * Use this field in order to set from outside the userProfile
     */
    private String userProfile;
    
    /**
     * show or not the left numeric coloumn
     */
    private Boolean numericColoumn;
    
    private final int MIN_ROWS = 4;
    
    private ReloadableResourceBundleMessageSource messageSource;
    private LocaleResolver localeResolver;
    private WebApplicationContext springContext;
    
    
//    private enum Operations {READ, WRITE}
    
    public int doStartTag() {

        JspWriter out = null;
        try {
            
            if(numericColoumn == null){
                numericColoumn = true;
            }
            // Check the user profile
            this.chooseMode();
            boolean deleteButton = true;
            deleteButton &= this.edit;

            out = pageContext.getOut();
            Integer rows = (Integer) pageContext.getRequest().getAttribute(
                    "tableRowsCounter" + entryItemName);
            
            int filledRows = 0;
            for (int i = 1; i <= rows; i++) {
                
                boolean skipRow = true;
                StringBuilder sb = new StringBuilder();
                sb.append("<tr>");
                if(numericColoumn){
                    sb.append("<td>" + (filledRows+1) + "</td>");
                }
                
                for (int j = 0; j < numOfColoumn; j++) {
                    
                    String varName = "_fraVariable_" + entryItemName + "_" + i + "_" + j + "_";
                    String varValue = (String) pageContext.getRequest().getAttribute(varName);
                    String entryValue = (varValue == null || varValue.isEmpty()) ? "" : varValue;
                    if(!StringUtils.isBlank(entryValue)){
                        skipRow = false;
                    }
                    sb.append(" <td");
                    sb.append("         class=\"entry-item editable text\"");
                    sb.append("         style=\"background-color: rgb(242, 245, 169);\" entry-id=\""
                            + entryItemName + "\">");
                    sb.append("         <input type=\"hidden\"  name=\"" + varName + "\" value=\"" + entryValue + "\" />");
                    sb.append("         <div id=\"cell-content\" class=\"cell-content\">" + entryValue + "</div>");
                    sb.append(" </td>");
                }
                if(deleteButton){
                    sb.append(" <td class=\"action-column\" width=\"80px\"><a href=\"#\" class=\"btn delete-btn\">");
                    sb.append(localize("dyntable.delete"));
                    sb.append("</a></td>");                    
                }
                sb.append("</tr>");
                if(!skipRow){
                    out.print(sb.toString());
                    filledRows++;
                }
                
            }
            
            for(int i=0; i<MIN_ROWS-filledRows; i++){
                
                out.print(buildEmptyRow(deleteButton,filledRows+1+i,rows));
            }

        } catch (IOException ioe) {

            LOGGER.error("Error in DynamicTableTag: " + ioe);

        }
        return (SKIP_BODY);
    }
    
    private String buildEmptyRow(boolean deleteButton, int i, int rows){
        
        StringBuilder sb = new StringBuilder();
        sb.append("<tr>");
        if(numericColoumn){
            sb.append("<td>" + i + "</td>");
        }
        
        for (int j = 0; j < numOfColoumn; j++) {
            
            String varName = "_fraVariable_" + entryItemName + "_" + (rows+i) + "_" + j + "_";
            sb.append(" <td");
            sb.append("         class=\"entry-item editable text\"");
            sb.append("         style=\"background-color: rgb(242, 245, 169);\" entry-id=\""
                    + entryItemName + "\">");
            sb.append("         <input type=\"hidden\"  name=\"" + varName + "\" value=\"\" />");
            sb.append("         <div id=\"cell-content\" class=\"cell-content\"></div>");
            sb.append(" </td>");
        }
        if(deleteButton){
            sb.append(" <td class=\"action-column\" width=\"80px\"><a href=\"#\" class=\"btn delete-btn\">");
            sb.append(localize("dyntable.delete"));
            sb.append("</a></td>");            
        }
        sb.append("</tr>");
        return sb.toString();
    }
    
    private String localize(String code) {
        if (this.springContext == null) {
            this.springContext = WebApplicationContextUtils.getWebApplicationContext(pageContext
                    .getServletContext());
        }
        if (this.messageSource == null) {
            this.messageSource = (ReloadableResourceBundleMessageSource) springContext
                    .getBean("messageSource");
        }
        if (this.localeResolver == null) {
            this.localeResolver = (LocaleResolver) springContext.getBean("localeResolver");
        }
        return messageSource.getMessage(code, null,
                localeResolver.resolveLocale((HttpServletRequest) pageContext.getRequest()));

    }

	/**
     * @return the entryItemName
     */
    public String getEntryItemName() {
        return entryItemName;
    }

    /**
     * @param entryItemName the entryItemName to set
     */
    public void setEntryItemName(String entryItemName) {
        this.entryItemName = entryItemName;
    }

    /**
     * @return the colNumber
     */
    public int getNumOfColoumn() {
        return numOfColoumn;
    }

    /**
     * @param colNumber the colNumber to set
     */
    public void setNumOfColoumn(int colNumber) {
        this.numOfColoumn = colNumber;
    }

    /**
     * @return the operation
     */
    public String getOperation() {
        return operation;
    }

    /**
     * @param operation the operation to set
     */
    public void setOperation(String operation) {
        this.operation = operation;
    }

    /**
     * @return the userProfile
     */
    public String getUserProfile() {
        return userProfile;
    }

    /**
     * @param userProfile the userProfile to set
     */
    public void setUserProfile(String userProfile) {
        this.userProfile = userProfile;
    }

    /**
     * @return the numericColoumn
     */
    public Boolean getNumericColoumn() {
        return numericColoumn;
    }

    /**
     * @param numericColoumn the numericColoumn to set
     */
    public void setNumericColoumn(Boolean numericColoumn) {
        this.numericColoumn = numericColoumn;
    }
    
    
    
    
}
