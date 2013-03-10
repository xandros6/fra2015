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
package it.geosolutions.fra2015.mvc.aspect;

import it.geosolutions.fra2015.entrypoint.model.Update;
import it.geosolutions.fra2015.entrypoint.model.Updates;
import it.geosolutions.fra2015.server.model.survey.ActivityLogEntry;
import it.geosolutions.fra2015.services.SurveyActivityLog;

import java.util.List;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author DamianoG
 *
 */
@Aspect
public class ActivityLogAspect {

    Logger LOGGER = Logger.getLogger(ActivityLogAspect.class);
    
    @Autowired
    private SurveyActivityLog sal;
    
    @Before("execution(* it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.updateValuesService(..))")
    public void logUpdates(JoinPoint joinPoint) {
        
        Updates up = (Updates)joinPoint.getArgs()[0];
        List<Update> upList = up.getUpdates();

        for(Update el : upList){
            
            sal.storeLog(fromUpdateToActivityLog(el, up.getQuestion(), up.getUsername()));
        }
    }
    
    private static ActivityLogEntry fromUpdateToActivityLog(Update u, String question, String username){
        
        ActivityLogEntry al = new ActivityLogEntry();
        al.setContent(u.getValue());
        al.setCountry(u.getCountry());
        al.setEntryItemName(u.getVariable());
        al.setQuestion_id(question);
        al.setTime(System.currentTimeMillis());
        al.setUsername(username);
        return al;
    }
}
