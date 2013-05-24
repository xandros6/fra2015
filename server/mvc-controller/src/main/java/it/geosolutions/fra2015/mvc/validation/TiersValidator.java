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
import it.geosolutions.fra2015.server.model.survey.NumberValue;
import it.geosolutions.fra2015.server.model.survey.Value;
import it.geosolutions.fra2015.services.SurveyService;
import it.geosolutions.fra2015.validation.ValidationMessage;
import it.geosolutions.fra2015.validation.ValidationResult;

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
    
    //The tiers list
    // TODO externalize (File? in DB?)
    public static final String tiers = "9x;21x;35;48;60;71;83;95;900;116;126;131;136;149;151";
    
    @Autowired
    private SurveyService surveyService;
    
    /**
     * This method detect if there are valorized variable rows related to a tier with that tiers not valorized.
     * This situation violate a constraint for the survey validity.
     * A variable row is valorized when at least one element of the row is valorized (exists the record on DB and the value is different than NaN)
     * 
     * The method search all the not valorized tiers and check if the related row variable is valorized(the match is stored in the rowName field of the tier)
     * 
     * @param iso3
     */
    public ValidationResult checkTiers(String iso3){
        
        ValidationResult vr = new ValidationResult();
        List<String> errorElements = new ArrayList<String>();
        
        try {
            // load empty tiers
            List<Value> emptyTiersValue = surveyService.getEntryItemsListByFieldValues("entry.variable", Arrays.asList(tiers.split(";")), null, iso3, true);
            List<EntryItem> emptyTiers = fromValueListToTiersList(emptyTiersValue);
            for(EntryItem el : emptyTiers){
                List<String> varList = new ArrayList<String>();
                TierRowName trn = new TierRowName(el.getRowName());
                varList.add(trn.getReletedEntityId());
                // load the row variables related to the current tier 
                List<Value> items = surveyService.getEntryItemsListByFieldValues("entry.variable", varList, trn.getRelatedRowNames(), iso3, false);
                if(!items.isEmpty() && !areTheValuesAllNA(items)){
                     errorElements.add(trn.getErrorMessage());
                }
            }
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
        }
        if(!errorElements.isEmpty()){
            ValidationMessage vm = new ValidationMessage();
            vm.setMessage("error.violateTiersconstraints");
            vm.setSuccess(false);
            vm.setElements(errorElements);
            vr.addMessage(vm);
            //vm.setRule("Tiers Validity");
        }
        return vr;
    }
    
    private boolean areTheValuesAllNA(List<Value> items){
        for(Value el : items){
            if(el instanceof NumberValue){
                Double d = ((NumberValue)el).getValue().doubleValue();
                if(!d.isNaN()){
                    return false;
                }
            }
            else{
                return false;
            }
        }
        return true;
    }
    
    private List<EntryItem> fromValueListToTiersList(List<Value> items){
        List<EntryItem> results = new ArrayList<EntryItem>();
        for(Value el : items){
            if(el != null){
                results.add(el.getEntryItem());
            }
        }
        return results;
    }
    
    private class TierRowName{
        private String reletedEntityId;
        private List<String> relatedRowNames;
        
        public TierRowName(String name){
            String [] filters = name.split(";");
            if(filters.length == 2){
                this.reletedEntityId = filters[0];
                String [] relatedRowNamesArray = filters[1].split(",");
                relatedRowNames = Arrays.asList(relatedRowNamesArray);
            }
            else{
                this.reletedEntityId = "";
                relatedRowNames = new ArrayList<String>();
            }
        }
        
        public String getErrorMessage(){
            if(relatedRowNames.size() == 1){
                return "table["+reletedEntityId+"]-row["+relatedRowNames.get(0)+"]";
            }
            else if (relatedRowNames.size() > 1){
                return "table["+reletedEntityId+"]-row[ALL]";
            }
            return "Error occurred in tiers validation.";
        }

        /**
         * @return the reletedEntityId
         */
        public String getReletedEntityId() {
            return reletedEntityId;
        }

        /**
         * @return the relatedRowNames
         */
        public List<String> getRelatedRowNames() {
            return relatedRowNames;
        }
        
        
    }
    
}
