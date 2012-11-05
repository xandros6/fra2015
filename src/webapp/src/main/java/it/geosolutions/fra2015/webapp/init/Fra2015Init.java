/*
 *  Copyright (C) 2007 - 2012 GeoSolutions S.A.S.
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
package it.geosolutions.fra2015.webapp.init;

import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.UserService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.rest.utils.Fra2015JAXBContext;
import it.geosolutions.fra2015.webapp.init.model.InitUserList;
import java.io.File;
import java.util.List;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.InitializingBean;

/**
 *
 * @author ETj (etj at geo-solutions.it)
 */
public class Fra2015Init implements InitializingBean {

    private final static Logger LOGGER = Logger.getLogger(Fra2015Init.class);
    protected UserService userService;
    protected File userListInitFile = null;

    @Override
    public void afterPropertiesSet() throws Exception {

        LOGGER.info("===== Starting GeoStore services =====");

        long userCnt = userService.getCount(null);
        if (userCnt == 0) {
            LOGGER.warn("No user found.");
            if (userListInitFile != null) {
                LOGGER.warn("Initializing users from file " + userListInitFile);
                initUsers(userListInitFile);
            } else {
                LOGGER.info("No user initializer defined.");
            }
        } else {
            LOGGER.info("Users already in db: " + userCnt);
        }
    }

    private void initUsers(File file) {
        try {
            JAXBContext context = getUserContext();

            InitUserList list = (InitUserList) context.createUnmarshaller().unmarshal(file);
            for (User user : list.getList()) {
                LOGGER.info("Adding user " + user);
                userService.insert(user);
            }
        } catch (JAXBException ex) {
            throw new RuntimeException("Error reading users init file " + file, ex);
        } catch (Exception e) {
            LOGGER.error("Error while initting users. Rolling back.", e);
            List<User> removeList;
            try {
                removeList = userService.getAll(null, null);
            } catch (BadRequestServiceEx ex) {
                throw new RuntimeException("Error while rolling back user initialization. Your DB may now contain an incomplete user list. Please check manually.", e);
            }

            for (User user : removeList) {
                userService.delete(user);
            }

            throw new RuntimeException("Error while initting users.");
        }
    }

    private static JAXBContext getUserContext() {

        List<Class> allClasses = Fra2015JAXBContext.getFra2015Classes();
        allClasses.add(InitUserList.class);

        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug("Initializing JAXBContext with " + allClasses.size() + " classes " + allClasses);
        }

        try {
            return JAXBContext.newInstance(allClasses.toArray(new Class[allClasses.size()]));
        } catch (JAXBException ex) {
            LOGGER.error("Can't create GeoStore context: " + ex.getMessage(), ex);
            return null;
        }
    }

    //==========================================================================
    public void setUserListInitFile(File userListInitFile) {
        this.userListInitFile = userListInitFile;
    }

    //==========================================================================

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
