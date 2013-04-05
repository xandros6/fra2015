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
import it.geosolutions.fra2015.mvc.controller.SurveyController;

import java.util.List;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

/**
 * @author DamianoG
 * 
 */
@Aspect
public class LoggingAspect {

    Logger LOGGER = Logger.getLogger(LoggingAspect.class);
    
    @Before("execution(* it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.updateValuesService(..))")
    public void logUpdates(JoinPoint joinPoint) {
        
        LOGGER.info("******************* ActivityLog **********");
        LOGGER.info(joinPoint.getSignature().getName());
        Updates up = (Updates)joinPoint.getArgs()[0];
        List<Update> upList = up.getUpdates();
        StringBuilder sb = new StringBuilder();
        sb.append("Update Variables: [START");
        for(Update el : upList){
            sb.append("; ").append(el.getVariable()).append(".").append(el.getRow()).append(".").append(el.getColumn());
            if(LOGGER.isDebugEnabled()){sb.append("-").append("val:").append(el.getValue());};
        }
        sb.append("]");
        LOGGER.info("     Update Values: " + sb.toString());
        LOGGER.info("***************************************************");
        LOGGER.info("");
        
    }

    @Before("execution(* it.geosolutions.fra2015.mvc.controller..*.*(..))")
    public void traceCalls(JoinPoint joinPoint) {
        if(LOGGER.isTraceEnabled())
            LOGGER.trace(" calling " + joinPoint.getSignature());
    }

}
 