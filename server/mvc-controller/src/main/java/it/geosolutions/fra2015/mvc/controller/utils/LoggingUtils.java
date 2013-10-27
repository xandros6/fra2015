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
package it.geosolutions.fra2015.mvc.controller.utils;

import it.geosolutions.fra2015.server.model.user.User;

import java.util.List;

/**
 * @author DamianoG
 *
 * A class that provide some utilities static methods for logging
 *
 */
public class LoggingUtils {

    /**
     * Print the user names of all users inside a List<Users>
     * 
     * @param users
     * @return
     */
    public static String printUsernames(List<User> users){
        
        if(users == null || users.size() <= 0){
            return "No users find in the List provided...";
            
        }
        else{
            StringBuilder sb = new StringBuilder();
            sb.append("UserNames List: [");
            for(User u : users){
                sb.append("'");
                sb.append(u.getUsername());
                sb.append("',");
            }
            sb.append("]");
            return sb.toString();
        }
    }
}
