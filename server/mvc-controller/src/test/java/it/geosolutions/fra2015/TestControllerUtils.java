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
package it.geosolutions.fra2015;

import it.geosolutions.fra2015.mvc.controller.utils.LoggingUtils;
import it.geosolutions.fra2015.server.model.user.User;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;

import junit.framework.TestCase;

/**
 * 
 * Tests for classes in it.geosolutions.fra2015.mvc.controller.utils package
 * 
 * @author DamianoG
 *
 */
public class TestControllerUtils extends TestCase{

    public void testPrintUsernames(){
        List<User> users = new ArrayList<User>();
        
        User u1 = new User();
        u1.setUsername("u1");
        u1.setEmail("email");
        
        User u2 = new User();
        u2.setUsername("u2");
        u2.setEmail("email");
        
        User u3 = new User();
        u3.setUsername("u3");
        u3.setEmail("email");
        
        users.add(u1);
        users.add(u2);
        users.add(u3);
        
        System.out.println(LoggingUtils.printUsernames(users));
        Assert.assertEquals("UserNames List: ['u1','u2','u3',]", LoggingUtils.printUsernames(users));
        
        List<User> usersVoid = new ArrayList<User>();
        System.out.println(LoggingUtils.printUsernames(usersVoid));
        Assert.assertEquals("No users find in the List provided...", LoggingUtils.printUsernames(usersVoid));
        
        System.out.println(LoggingUtils.printUsernames(null));
        Assert.assertEquals("No users find in the List provided...", LoggingUtils.printUsernames(null));
    }
}
