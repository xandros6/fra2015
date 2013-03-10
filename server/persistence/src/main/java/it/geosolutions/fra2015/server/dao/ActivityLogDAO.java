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
package it.geosolutions.fra2015.server.dao;

import it.geosolutions.fra2015.server.model.survey.ActivityLogEntry;
import it.geosolutions.fra2015.server.model.survey.Country;

import java.util.Calendar;
import java.util.List;

/**
 * @author DamianoG
 *
 */
public interface ActivityLogDAO extends RestrictedGenericDAO<ActivityLogEntry>{
        
        /**
         * @param c
         * @param username
         * @param page
         * @param entries
         * @return
         */
        List<ActivityLogEntry> findByEntryItemName(String c, String username, int page, int entries);

        /**
         * @param c
         * @param question
         * @param username
         * @param page
         * @param entries
         * @return
         */
        List<ActivityLogEntry> findByQuestionAndUsername(String c, String question, String username,
                int page, int entries);

        /**
         * @param c
         * @param t1
         * @param t2
         * @param page
         * @param entries
         * @return
         */
        List<ActivityLogEntry> findByTimeInterval(String c, Long t1, Long t2, int page, int entries);
}
