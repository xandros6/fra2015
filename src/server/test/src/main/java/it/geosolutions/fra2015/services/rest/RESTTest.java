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
package it.geosolutions.fra2015.services.rest;

import it.geosolutions.fra2015.server.model.User;
import it.geosolutions.fra2015.services.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.InitializingBean;

/**
 *
 * @author ETj (etj at geo-solutions.it)
 */
public class RESTTest implements InitializingBean {

    private final static Logger LOGGER = Logger.getLogger(RESTTest.class);
    protected UserService userService;

    @Override
    public void afterPropertiesSet() throws Exception {

        LOGGER.info("===== Starting fra2015 REST test services =====");

        long userCnt = userService.getCount(null);
        if (userCnt == 0) {
            LOGGER.info("No user found. Creating default.");

            User admin = new User();
            admin.setName("admin");
            admin.setPassword("admin");
            userService.insert(admin);
            LOGGER.info("Created " + admin);

            User user = new User();
            user.setName("user");
            user.setPassword("user");
            userService.insert(user);
            LOGGER.info("Created " + user);

        } else {
            LOGGER.info("Users already in db: " + userCnt);
        }
    }

    //==========================================================================

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
