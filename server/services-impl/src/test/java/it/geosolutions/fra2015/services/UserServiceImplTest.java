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
package it.geosolutions.fra2015.services;

import org.junit.AfterClass;
import org.junit.BeforeClass;

/**
 * Class UserServiceImplTest.
 *
 * @author Tobia di Pisa (tobia.dipisa at geo-solutions.it)
 *
 */
public class UserServiceImplTest extends ServiceTestBase {

    private final static String FAKE_USERNAME = "user";
    private final static String FAKE_PASSWORD = "password";
    private final static String FAKE_USERNAME_2 = "user_2";
    private final static String FAKE_PASSWORD_2 = "password_2";
    private final static String FAKE_WRONG_PASSWORD = "wrong";

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
    }

    public UserServiceImplTest() {
    }

//    @Test
//    public void testCountUsers() throws Exception {
//
//        long count = userService.getCount(null);
//
//        assert true;
//
//    }
//
//    @Test
//    public void testInsertUser() throws Exception {
//
//        User user = createUser(
//                FAKE_USERNAME,
//                PwEncoder.encode(FAKE_PASSWORD));
//
//        assertNotNull(user);
//        assertSame(FAKE_USERNAME, user.getName());
//        assertSame(FAKE_PASSWORD, PwEncoder.decode(user.getPassword()));
//        assertNotSame(FAKE_WRONG_PASSWORD, PwEncoder.decode(user.getPassword()));
//
//    }
//
//    @Test
//    public void testLoadUser() throws Exception {
//        User user = createUser(
//                FAKE_USERNAME,
//                PwEncoder.encode(FAKE_PASSWORD));
//
//        User loaded = userService.get(user.getId());
//
//        assertNotNull(loaded);
//        assertEquals(FAKE_USERNAME, loaded.getName());
//        assertEquals(FAKE_PASSWORD, PwEncoder.decode(loaded.getPassword()));
//
//    }
//
//    @Test
//    public void testUpdateData() throws Exception {
//
//        User user = createUser(
//                FAKE_USERNAME,
//                PwEncoder.encode(FAKE_PASSWORD));
//
//        user.setName(FAKE_USERNAME_2);
//        user.setPassword(PwEncoder.encode(FAKE_PASSWORD_2));
//
//        user = userService.update(user);
//
//        User loaded = userService.get(user.getId());
//
//        assertNotNull(loaded);
//        assertSame(FAKE_USERNAME_2, loaded.getName());
//        assertSame(FAKE_PASSWORD_2, PwEncoder.decode(loaded.getPassword()));
//
//    }
//
//    @Test
//    public void testDeleteUser() throws Exception {
//
//        User user = createUser(
//                FAKE_USERNAME,
//                PwEncoder.encode(FAKE_PASSWORD));
//
//        long id = user.getId();
//
//        userService.delete(user);
//
//        User loaded = userService.get(id);
//
//        assertNull(loaded);
//
//    }
//
//    @Test
//    public void testDeleteByIdUser() throws Exception {
//
//        User user = createUser(
//                FAKE_USERNAME,
//                PwEncoder.encode(FAKE_PASSWORD));
//
//        long id = user.getId();
//
//        userService.deleteById(id);
//
//        User loaded = userService.get(id);
//
//        assertNull(loaded);
//
//    }
    
}
