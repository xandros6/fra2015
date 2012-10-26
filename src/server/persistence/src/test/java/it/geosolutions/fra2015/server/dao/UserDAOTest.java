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

import it.geosolutions.fra2015.server.dao.util.PwEncoder;
import it.geosolutions.fra2015.server.model.User;
import java.util.List;
import java.util.logging.Level;
import org.junit.Test;

/**
 * Class UserDAOTest.
 *
 * @author Tobia di Pisa (tobia.dipisa at geo-solutions.it)
 *
 */
public class UserDAOTest extends BaseDAOTest {

    private final static String USERNAME = "user";
    private final static String PASSWORD = "password";
    private final static String USERNAME_2 = "user_2";
    private final static String PASSWORD_2 = "password_2";
    private final boolean debug = true;

    @Test
    public void testCountUser() {

        int count = userDAO.count(null);

        assertSame(0, count);

    }

    @Test
    public void testCreateUser() throws Exception {

        if (debug) {
            log.info("test user creation");
        }

        User user = new User();
        user.setName(USERNAME);
        user.setPassword(PwEncoder.encode(PASSWORD));
         userDAO.save(user);
         
         

        int count = userDAO.count(null);

        assertSame(1, count);

    }

    @Test
    public void testReadUser() throws Exception {

        if (debug) {
            log.info("test user loading by id");
        }

        User user = new User();
        user.setName(USERNAME);
        user.setPassword(PwEncoder.encode(PASSWORD));

        userDAO.persist(user);

        User loaded = userDAO.find(user.getId());

        assertNotNull(loaded);
        assertSame(USERNAME, loaded.getName());
        assertSame(PASSWORD, PwEncoder.decode(loaded.getPassword()));

    }

    @Test
    public void testReadAllUsers() throws Exception {

        if (debug) {
            log.info("test all user loading");
        }

        List<User> users = userDAO.findAll();

        assertNotNull(users);
        assertSame(userDAO.count(null), users.size());

    }

    @Test
    public void testUpdateUser() throws Exception {

        if (debug) {
            log.info("test user updating");
        }

        User user = new User();
        user.setName(USERNAME);
        user.setPassword(PwEncoder.encode(PASSWORD));

        userDAO.persist(user);

        user.setName(USERNAME_2);
        user.setPassword(PwEncoder.encode(PASSWORD_2));
        user = userDAO.merge(user);


        User loaded = userDAO.find(user.getId());

        assertNotNull(loaded);
        assertSame(USERNAME_2, loaded.getName());
        assertSame(PASSWORD_2, PwEncoder.decode(loaded.getPassword()));

    }

    @Test
    public void testDeleteUser() throws Exception {

        if (debug) {
            log.info("test user deleting");
        }

        User user = new User();
        user.setName(USERNAME);
        user.setPassword(PwEncoder.encode(PASSWORD));

        userDAO.persist(user);

        long id = user.getId();

        assertTrue(userDAO.remove(user));

        User loaded = userDAO.find(id);

        assertNull(loaded);
    }

    @Test
    public void testDeleteByIdUser() throws Exception {

        if (debug) {
            log.info("test user deleting by id");
        }

        User user = new User();
        user.setName(USERNAME);
        user.setPassword(PwEncoder.encode(PASSWORD));

        userDAO.persist(user);

        long id = user.getId();

        assertTrue(userDAO.removeById(id));

        User loaded = userDAO.find(id);

        assertNull(loaded);
    }
}
