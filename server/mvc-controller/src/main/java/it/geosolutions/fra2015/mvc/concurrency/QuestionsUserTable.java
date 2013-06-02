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
package it.geosolutions.fra2015.mvc.concurrency;

import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.utils.UserUtil;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.apache.commons.collections.keyvalue.MultiKey;

/**
 * @author DamianoG
 *
 * Store the current user that is working on a country/question
 *
 */
public class QuestionsUserTable {

    Map<MultiKey, List<User>> m = new Hashtable<MultiKey, List<User>>();
    
    public void addUser(User usr, int question){
        
        String iso3 = UserUtil.getSingleIso3(usr);
        MultiKey key = new MultiKey(question, iso3);
        List<User> users = m.get(key);
        if(users == null){
            users = new Vector<User>();
            m.put(key, users);
        }
        users.add(usr);
    }
    
    public void removeUser(User usr, int question) throws IllegalStateException{
        
        String iso3 = UserUtil.getSingleIso3(usr);
        MultiKey key = new MultiKey(question, iso3);
        List<User> users = m.get(key);
        if(users == null){
           return;
            // throw new IllegalStateException("The user " + usr.getUsername() + "is not stored for question " + iso3 + "-" + question);
        }
        boolean isRemoverd = users.remove(usr);
        m.toString();
    }
    
    public boolean amITheFirst(User usr, int question){
        
        String iso3 = UserUtil.getSingleIso3(usr);
        MultiKey key = new MultiKey(question, iso3);
        List<User> users = m.get(key);
        if(users == null || users.isEmpty()){
            return true;
        }
        return false;
    }
}
