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

import static it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.SESSION_USER;
import it.geosolutions.fra2015.server.model.user.User;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * @author DamianoG
 * 
 */
public class SessionListener implements HttpSessionListener {

    Logger LOGGER = Logger.getLogger(SessionListener.class);
    
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        User usr = (User)session.getAttribute(SESSION_USER);
        if(usr != null){
            LOGGER.info("User " + usr.getUsername() + ": Session Destroyed...");
            BasicConcurrencyHandler bch = loadBasicConcurrencyHandler(session);
            bch.purgeDataForUser(usr);
        }
    }

    private BasicConcurrencyHandler loadBasicConcurrencyHandler(HttpSession session) {
        ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(session
                .getServletContext());

        BasicConcurrencyHandler bch = (BasicConcurrencyHandler) ctx
                .getBean("basicConcurrencyHandler");
        return bch;
    }
}
