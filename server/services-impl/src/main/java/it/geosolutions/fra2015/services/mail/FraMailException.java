/*
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
package it.geosolutions.fra2015.services.mail;

import it.geosolutions.fra2015.server.model.user.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author DamianoG
 *
 */
public class FraMailException extends IOException{

    /**
     * This field holds a list of recipient Users that the mail has failed 
     */
    private List<User> failedRecipientsList;
    
    public FraMailException(){
        super();
        failedRecipientsList = new ArrayList<User>();
    }
    
    public FraMailException(String message){
        super(message);
        failedRecipientsList = new ArrayList<User>();
    }

    /**
     * @return the failedRecipientsList
     */
    public List<User> getFailedRecipientsList() {
        return failedRecipientsList;
    }

    /**
     * @param failedRecipientsList the failedRecipientsList to set
     */
    public void setFailedRecipientsList(List<User> failedRecipientsList) {
        this.failedRecipientsList = failedRecipientsList;
    }
    
    /**
     * Add an User to the FailedRecipient List
     * 
     * @param failedRecipientsList
     */
    public void addFailedRecipient(User usr) {
        failedRecipientsList.add(usr);
    }
    
    /**
     * Similar to {@link #getFailedRecipientsList()} but it returns just the names of the Users
     * 
     * @return
     */
    public String getFailedRecipientsNameList() {
        StringBuffer usernames = new StringBuffer();
        for(User user : failedRecipientsList){
            usernames.append("'");
            usernames.append(user.getUsername());
            usernames.append("(");
            usernames.append(user.getEmail());
            usernames.append(")");
            usernames.append("' - ");
        }
        return usernames.toString();
    }
}
