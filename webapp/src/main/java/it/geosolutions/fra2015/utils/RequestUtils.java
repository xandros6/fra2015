/*
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
package it.geosolutions.fra2015.utils;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

/**
 * @author DamianoG
 *
 */
public class RequestUtils {

    /**
     * Save all the request parameter contained in the HttpServletRequest object provided in a Map and return it to the caller
     * @param request
     * @param T
     * @return
     */
    public static Map<String,Object> requestBackup(HttpServletRequest request){
        
        Enumeration reqKeys = request.getAttributeNames();
        Map<String,Object> baseReqElements = new HashMap<String,Object>();
        while(reqKeys.hasMoreElements()){
            String key = (String) reqKeys.nextElement();
            baseReqElements.put(key, request.getAttribute(key));
        }
        return baseReqElements;
    }
    
    /**
     * Restore into the HttpServletRequest instance the attributes contained in reqBackup
     * @param request
     * @param reqBackup
     * @param T
     */
    public static void requestRestore(HttpServletRequest request, Map<String,Object> reqBackup){
        
        Enumeration reqKeys = request.getAttributeNames();
        while(reqKeys.hasMoreElements()){
            String key = (String) reqKeys.nextElement();
            request.removeAttribute(key);
        }
        Set<String> keySet = reqBackup.keySet();
        for(String key : keySet){
            request.setAttribute(key, reqBackup.get(key));
        }
    }
}
