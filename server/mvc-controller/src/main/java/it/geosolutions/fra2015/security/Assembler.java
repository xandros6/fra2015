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

import it.geosolutions.fra2015.server.model.user.User;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;

/**
 * @author DamianoG
 * 
 */
public class Assembler {

    public org.springframework.security.core.userdetails.User buildUserFromUserEntity(User userEntity) {

        String username = userEntity.getUsername();
        String password = userEntity.getPassword();
        boolean enabled = true;// userEntity.isActive();
        boolean accountNonExpired = true;// userEntity.isActive();
        boolean credentialsNonExpired = true;// userEntity.isActive();
        boolean accountNonLocked = true;// userEntity.isActive();

        Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        authorities.add(new GrantedAuthorityImpl("ROLE_"+ userEntity.getRole()));

        org.springframework.security.core.userdetails.User user = new org.springframework.security.core.userdetails.User(username, password, enabled, accountNonExpired, credentialsNonExpired,
                accountNonLocked, authorities);
        return user;
    }
    
    /**
     * used to check password in other contexts
     * @param user the user
     * @param pw the password to check 
     * @return
     */
    public static boolean checkPassword(User user,String pw){
        return user.getPassword().equals(pw);
    }

}
