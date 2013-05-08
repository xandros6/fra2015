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
package it.geosolutions.fra2015.mvc.validation;

import it.geosolutions.fra2015.server.model.survey.EntryItem;
import it.geosolutions.fra2015.services.SurveyService;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author DamianoG
 *
 */
public class TiersValidator {

    private final static Logger LOGGER = LoggerFactory.getLogger(TiersValidator.class);
    
    // TODO externalize
    public static final String tiers = "9x"/*;21x;35*/;
    
    @Autowired
    private SurveyService surveyService;
    
    public void checkTiers(String iso3){
        try {
            List<EntryItem> emptyTiers = surveyService.getEntryItemsListByFieldValues("entry.variable", Arrays.asList(tiers.split(";")), null, iso3, true);
            for(EntryItem el : emptyTiers){
                String [] filters = el.getRowName().split(";");
                List<String> varList = new ArrayList<String>();
                varList.add(filters[0]);
                List<EntryItem> items = surveyService.getEntryItemsListByFieldValues("entry.variable", varList, filters[1], iso3, false);
                if(!items.isEmpty()){
                    LOGGER.error("found a value, tiers null");
                }
                
            }
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
        }
    }
    
    
    
}
