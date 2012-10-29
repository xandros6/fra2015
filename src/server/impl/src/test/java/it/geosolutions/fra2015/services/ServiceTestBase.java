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

import it.geosolutions.fra2015.server.model.User;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;
import java.util.List;
import java.util.logging.Level;
import junit.framework.TestCase;
import org.apache.log4j.Logger;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Class ServiceTestBase.
 *
 * @author ETj (etj at geo-solutions.it)
 * @author Tobia di Pisa (tobia.dipisa at geo-solutions.it)
 *
 */
public class ServiceTestBase extends TestCase {

    protected static UserService userService;
    protected static ClassPathXmlApplicationContext ctx = null;
    protected final Logger LOGGER = Logger.getLogger(getClass());

    /**
     *
     */
    public ServiceTestBase() {
        synchronized (ServiceTestBase.class) {
            if (ctx == null) {
                String[] paths = {"classpath*:applicationContext.xml"
//                         ,"applicationContext-test.xml"
                };
                ctx = new ClassPathXmlApplicationContext(paths);
                userService = (UserService) ctx.getBean("userService");
            }
        }
    }

    /*
     * (non-Javadoc) @see junit.framework.TestCase#setUp()
     */
    @Override
    protected void setUp() throws Exception {
        LOGGER.info("################ Running " + getClass().getSimpleName() + "::" + getName());
        super.setUp();
        removeAll();
    }

    /**
     *
     */
    public void testCheckServices() {
        assertNotNull(userService);
    }

    /**
     * @throws NotFoundServiceEx
     * @throws BadRequestServiceEx
     */
    protected void removeAll() throws NotFoundServiceEx, BadRequestServiceEx {
        LOGGER.info("***** removeAll()");
        removeAllUser();
    }

    /**
     * @throws BadRequestServiceEx
     */
    private void removeAllUser() throws BadRequestServiceEx {
        List<User> list = userService.getAll(null, null);
        for (User item : list) {
            LOGGER.info("Removing User: " + item.getName());

            try {
                userService.delete(item);
            } catch (Exception ex) {
                java.util.logging.Logger.getLogger(ServiceTestBase.class.getName()).log(Level.INFO, "unable to delete " + item, ex);
            }
            
        }

        assertEquals("User have not been properly deleted", 0, userService.getCount(null));
    }

    /**
     * @param name
     * @param role
     * @param password
     * @return long
     * @throws Exception
     */
    protected User createUser(String name, String password) throws Exception {
        User user = new User();
        user.setName(name);
        user.setPassword(password);
        return userService.insert(user);
    }
}
