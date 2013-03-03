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
package it.geosolutions.fra2015.security;

import it.geosolutions.fra2015.server.dao.UserDAO;
import it.geosolutions.fra2015.server.model.user.User;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.googlecode.genericdao.search.Search;

/**
 * @author DamianoG
 * 
 */

// @Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {

    private UserDAO userDao;

    private Assembler assembler;

    // @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException,
            DataAccessException {

        Search searchCriteria = new Search(User.class);
        searchCriteria.addFilterEqual("username", username);
        List<User> found = userDao.search(searchCriteria);
        User userEntity = (found!=null && found.size()>0)?found.get(0):null;

        if (userEntity == null) {
            throw new UsernameNotFoundException("user not found");
        }

        return assembler.buildUserFromUserEntity(userEntity);
    }

    /**
     * @param userDao the userDao to set
     */
    public void setUserDao(UserDAO userDao) {
        this.userDao = userDao;
    }

    /**
     * @param assembler the assembler to set
     */
    public void setAssembler(Assembler assembler) {
        this.assembler = assembler;
    }

}