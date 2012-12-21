/*
 *  Copyright (C) 2007 - 2011 GeoSolutions S.A.S.
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
package it.geosolutions.fra2015.server.dao;

import it.geosolutions.fra2015.server.model.user.Password;
import it.geosolutions.fra2015.server.model.user.User;
import java.util.List;
import org.junit.Test;

/**
 * Class UserDAOTest.
 *
 * @author Tobia di Pisa (tobia.dipisa at geo-solutions.it)
 *
 */
public class UserDAOTest extends BaseDAOTest {

    private final static String PASSWORD = "password";
    private final static String PASSWORD_2 = "password_2";
    private final boolean debug = true;

    // @Test
    /*public void testCountUser() {

        int count = userDAO.count(null);

        assertEquals(0, count);

    }

    // @Test
    public void testCreateUser() throws Exception {

        User user = new User();
        user.setName("createUser");
        user.setPassword(new Password());
        user.getPassword().setPassword(PASSWORD.getBytes());
        userDAO.persist(user);

        assertNotNull("User id not set by persist()", user.getId());

    }

    // @Test
    public void testReadUser() throws Exception {


        User user = new User();
        user.setName("readUser");
        user.setPassword(new Password());
        user.getPassword().setPassword(PASSWORD.getBytes());

        userDAO.persist(user);

        assertNotNull("Id not set by persist()", user.getId());
        User loaded = userDAO.find(user.getId());

        assertNotNull(loaded);

        assertEquals("readUser", loaded.getName());
        assertTrue(loaded.getPassword().check(PASSWORD));


    }

    // @Test
    public void testReadAllUsers() throws Exception {

        if (debug) {
            log.info("test all user loading");
        }

        List<User> users = userDAO.findAll();

        assertNotNull(users);
        assertEquals(userDAO.count(null), users.size());

    }

    // @Test
    public void testUpdateUser() throws Exception {

        User user = new User();
        user.setName("updateUser1");
        user.setPassword(new Password());
        user.getPassword().setPassword(PASSWORD.getBytes());

        userDAO.persist(user);
        assertNotNull("Id not set by persist()", user.getId());

        user.setName("updateUser2");
        user.getPassword().setPassword(PASSWORD_2.getBytes());

        userDAO.merge(user);

        User loaded = userDAO.find(user.getId());

        assertNotNull(loaded);

        assertEquals("updateUser2", loaded.getName());

        assertTrue(loaded.getPassword().check(PASSWORD_2));

    }

    // @Test
    public void testDeleteUser() throws Exception {



        User user = new User();
        user.setName("deleteUser");
        user.setPassword(new Password());
        user.getPassword().setPassword(PASSWORD);


        userDAO.persist(user);
        assertNotNull("Id not set by persist()", user.getId());

        long id = user.getId();

        assertTrue(userDAO.remove(user));

        User loaded = userDAO.find(id);

        assertNull(loaded);

    }

    // @Test
    public void testDeleteByIdUser() throws Exception {


        User user = new User();
        user.setName("deleteByIdUser");
        user.setPassword(new Password());
        user.getPassword().setPassword(PASSWORD);

        userDAO.persist(user);
        assertNotNull("Id not set by persist()", user.getId());

        long id = user.getId();

        assertTrue(userDAO.removeById(id));

        User loaded = userDAO.find(id);

        assertNull(loaded);

    }

    // @Test
    public void testDeleteAll() throws Exception {

        List<User> users = userDAO.findAll();

        for (User user : users) {

            userDAO.remove(user);

        }

        int count = userDAO.count(null);

        assertEquals(0, count);

    }*/
}
