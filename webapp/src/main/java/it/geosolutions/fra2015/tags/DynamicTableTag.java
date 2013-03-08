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

import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.OperationWR;
import it.geosolutions.fra2015.server.model.user.User;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.log4j.Logger;

/**
 * Custom Tag that handle the dynamic table. print the html needed for the rows and coloumn of the table
 * The user is responsible for write explicitally handle <table> tag and the header of the table
 * 
 * @author DamianoG
 * 
 */
@SuppressWarnings("serial")
public class DynamicTableTag extends TagSupport {

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

//    private enum Operations {READ, WRITE}
    
    public int doStartTag() {

        JspWriter out = null;
        try {
            
            if(numericColoumn == null){
                numericColoumn = true;
            }
            // Check if the operation is valid
            OperationWR op = validate(operation);
            if(op == null){
                out.print("operation '" + operation + "' isn't a valid operation");
                return (SKIP_BODY);
            }
            boolean flagOp = op.compareTo(OperationWR.WRITE)==0;
            
            // Check the user profile
            boolean deleteButton = true;
            if(userProfile != null && !userProfile.isEmpty()){
                deleteButton = userProfile.equals("contributor");
            }
            else{
                User su = (User) pageContext.getSession().getAttribute("sessionUser");
                deleteButton = su.getRole().equals("contributor");
            }
            deleteButton &= flagOp;

            out = pageContext.getOut();
            Integer rows = (Integer) pageContext.getRequest().getAttribute(
                    "tableRowsCounter" + entryItemName);
            
            
            for (int i = 1; i <= rows; i++) {
                
                out.print("<tr>");
                if(numericColoumn){
                    out.print("<td>" + i + "</td>");
                }
                
                for (int j = 0; j < numOfColoumn; j++) {
                    
                    String varName = "_fraVariable_" + entryItemName + "_" + i + "_" + j + "_";
                    String varValue = (String) pageContext.getRequest().getAttribute(varName);
                    String entryValue = (varValue == null || varValue.isEmpty()) ? "" : varValue;
                    out.print(" <td");
                    out.print("         class=\"entry-item editable text\"");
                    out.print("         style=\"background-color: rgb(242, 245, 169);\" entry-id=\""
                            + entryItemName + "\">");
//                    out.print("         <span class=\"entry_item_placeholder\" id=\"" + varName
//                            + "\">&nbsp;</span>");
                    out.print("         <input type=\"hidden\"  name=\"" + varName + "\" value=\"" + entryValue + "\">");
                    out.print("         <div id=\"cell-content\" class=\"cell-content\">" + entryValue + "</div>");
                    out.print(" </td>");
                }
                if(deleteButton){
                    out.print(" <td class=\"action-column\" width=\"80px\"><a href=\"#\" class=\"btn delete-btn\">Delete</a></td>");
                    out.print("</tr>");
                }
            }

        } catch (IOException ioe) {

            LOGGER.error("Error in DynamicTableTag: " + ioe);

        }
        return (SKIP_BODY);
    }
    
    private OperationWR validate(String operation){
        
        OperationWR op = null;
        if(operation == null || operation.isEmpty()){
            return OperationWR.WRITE;
        }
        try{
            op = OperationWR.valueOf(operation);
        }
        catch(Exception e){
            return null;
        }
        return op;
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
