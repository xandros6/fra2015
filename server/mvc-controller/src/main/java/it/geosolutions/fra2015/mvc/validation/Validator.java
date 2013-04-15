package it.geosolutions.fra2015.mvc.validation;

import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.EntryItem;
import it.geosolutions.fra2015.server.model.survey.Value;
import it.geosolutions.fra2015.services.SurveyService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.validation.RuleList;
import it.geosolutions.fra2015.validation.ValidationMessage;
import it.geosolutions.fra2015.validation.ValidationResult;
import it.geosolutions.fra2015.validation.ValidationRule;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.script.ScriptException;
import javax.xml.bind.JAXB;

import org.dom4j.rule.RuleSet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * Check some conditions provided from a configuration file Check the variables in the database and provide validation result messages for each rule.
 * 
 * @author Lorenzo Natali
 * 
 */
public class Validator implements InitializingBean, ApplicationContextAware {
    private ApplicationContext applicationContext;

    private final static Logger LOGGER = LoggerFactory.getLogger(Validator.class);

    RuleList ruleList;

    @Autowired
    private SurveyService surveyService;

    /**
     * Validates the whole country values
     * 
     * @param country
     * @return
     */
    public ValidationResult validate(String country) {

        Iterator<ValidationRule> it = ruleList.iterator();
        ValidationResult result = new ValidationResult();
        
        // get the needed variable names (1.1 ...)
        HashSet<String> varnames = new HashSet<String>();
        while (it.hasNext()) {
            ValidationRule rule = it.next();
            varnames.addAll(rule.getVariables());
            //single values in rule are <<2.3[2000]
            List<String> singleValues = rule.getSingleValues();
            for(String coords : singleValues){
                varnames.add(coords.split("-")[0]);
            }

        }
        // get external variables
        Country c = surveyService.searchCountry(country);
        Map<String, String> externals = new HashMap<String, String>();
        if (c.getCountryArea() != null && c.getLandArea() != null) {
            externals.put("COUNTRY_AREA", c.getCountryArea() + "");
            externals.put("LAND_AREA", c.getLandArea() + "");
        }

        try {
            // get variable values
            List<Value> values = surveyService.getEntryListByVariableName(new ArrayList<String>(
                    varnames), country);
            //calculateVariations(externals, values);
            // validate the rules
            it = ruleList.iterator();

            while (it.hasNext()) {
                ValidationRule rule = it.next();
                validateRule(values, rule, result, externals);

            }
        } catch (BadRequestServiceEx e) {
            LOGGER.error("error retriving variables during validation", e);

        }

        return result;
    }

    /**
     * calculate change rate and net change of forests not year dependent
     * 
     * @param externals
     * @param values
     */
    private void calculateVariations(Map<String, String> externals, List<Value> values)
            throws IllegalArgumentException {
        //
        // Change Rate
        //

        // get forest Areas
        Map<String, Value> forestAreas = new HashMap<String, Value>();
        //1.1
        for (Value v : values) {
            if ("1.1".equals(v.getEntryItem().getRowName())) {
                forestAreas.put(v.getEntryItem().getColumnName(), v);
            }
        }
        if(forestAreas.get("1990")==null || forestAreas.get("2000")==null || forestAreas.get("2005")==null){
            return;
            
        }
        double area90 = Double.parseDouble(forestAreas.get("1990").getContent());
        double area00 = Double.parseDouble(forestAreas.get("2000").getContent());
        double area05 = Double.parseDouble(forestAreas.get("2005").getContent());
        // Change Rate 1990-2000 = (( (1.1_2000)/(1.1_1990) )^0.1-1)*100
        // A1= Forest area 1990 (1.1)(1990)
        // A2= Forest area 2000 (1.1)(2000)
        double changerate1990_2000 = (Math.pow(area00 / area90, 0.1) - 1) * 100;
        // Change Rate 2000-2005= (((1.1_2005)/(1.1_2000))^0.2-1)*100
        // A1= Forest area 2000 (1.1) (2000)
        // A2= Forest area 2005 (1.1) (2005)
        double changerate2000_2005 = (Math.pow(area05 / area00, 0.2) - 1) * 100;
        // Change Rate 1990-2005= (((1.1_2005)/(1.1_1990))^0.06667-1)*100
        // A1= Forest area 1990 (1.1) (1990)
        // A2= Forest area 2005 (1.1) (2005)
        double changerate1990_2005 = (Math.pow(area05 / area00, 0.06667) - 1) * 100;
        externals.put("CHR11_90_00", changerate1990_2000 + "");
        externals.put("CHR11_00_05", changerate2000_2005 + "");
        externals.put("CHR11_90_05", changerate1990_2005 + "");
        for (Value v : values) {
            if ("2.1".equals(v.getEntryItem().getRowName())) {
                forestAreas.put(v.getEntryItem().getColumnName(), v);
            }
        }
        //2.1
        area90 = Double.parseDouble(forestAreas.get("1990").getContent());
        area00 = Double.parseDouble(forestAreas.get("2000").getContent());
        area05 = Double.parseDouble(forestAreas.get("2005").getContent());
        // Change Rate 1990-2000 = (( (1.1_2000)/(1.1_1990) )^0.1-1)*100
        // A1= Forest area 1990 (1.1)(1990)
        // A2= Forest area 2000 (1.1)(2000)
        changerate1990_2000 = (Math.pow(area00 / area90, 0.1) - 1) * 100;
        // Change Rate 2000-2005= (((1.1_2005)/(1.1_2000))^0.2-1)*100
        // A1= Forest area 2000 (1.1) (2000)
        // A2= Forest area 2005 (1.1) (2005)
        changerate2000_2005 = (Math.pow(area05 / area00, 0.2) - 1) * 100;
        // Change Rate 1990-2005= (((1.1_2005)/(1.1_1990))^0.06667-1)*100
        // A1= Forest area 1990 (1.1) (1990)
        // A2= Forest area 2005 (1.1) (2005)
        changerate1990_2005 = (Math.pow(area05 / area00, 0.06667) - 1) * 100;
        externals.put("CHR21_90_00", changerate1990_2000 + "");
        externals.put("CHR21_00_05", changerate2000_2005 + "");
        externals.put("CHR21_90_05", changerate1990_2005 + "");
        
    }

    /**
     * Validate a single rule for every year
     * 
     * @param values
     * @param rule
     * @param result
     * @param externals
     */
    private void validateRule(List<Value> values, ValidationRule rule, ValidationResult result,
            Map<String, String> externals) {
        Map<String, Map<String, String>> tests = new HashMap<String, Map<String, String>>();
        // check if there is no value
        if (values.size() == 0) {
            
            ValidationMessage v = new ValidationMessage();
            v.setMessage("validation.notcompiled");
            v.addElements(Arrays.asList((rule.getEntryId().split(","))));
            result.addMessage(v);
            return;
        }
        
        // check single rule (dosn't contains variables
        // e.g. change rate1 in % should be between +3.00% and -3.00%
        if (rule.getVariables().size() == 0) {

            evaluateSingleRule(result, rule, externals,values);
            return;
        }
        // get all columns (1990 2000 etc...)
        populateTests(values, tests);
        evaluateColumns(result, tests, externals, rule,values);
        // for each column (year)

    }
    /** evaluate rules not column dependent
     * @param result
     * @param rule
     * @param externals
     * @param values 
     */
    private void evaluateSingleRule(ValidationResult result, ValidationRule rule,
            Map<String, String> externals, List<Value> values) {
        // check if some rule is missing
        List<String> missing = checkRuleFields(rule.getExternalData(), externals);
        ValidationMessage m = new ValidationMessage();
        if (missing.size() > 0) {
            m.setSuccess(false);
            m.setMessage("validation.notcompiled");
            m.addElements(missing);
            result.addMessage(m);
            return;
        }
        Map<String,String> singleValues = getSingleValues(values, rule);
        missing = checkRuleFields(rule.getSingleValues(), singleValues);
        if (missing.size() > 0) {
            m.setSuccess(false);
            m.setMessage("validation.notcompiled");
            m.addElements(missing);
            result.addMessage(m);
            return;
        }
        //skip evaluation if N/A
        if(checkRuleNA(rule.getSingleValues(),singleValues)){
            return;
        }
        {

            try {
                boolean success = rule.evaluate(new HashMap<String,String>(), externals,singleValues);
                m.setRule(rule);
                m.setSuccess(success);
                m.setMessage(rule.getError());
                if (!success) {
                    m.addElements(Arrays.asList(rule.getEntryId().split(",")));
                    m.setSuccess(false);
                }
            } catch (ScriptException e) {
                m =generateParseProblemMessage(rule);
                
                

            } catch (NullPointerException e) {
                m =generateParseProblemMessage(rule);
                
                
            }
        }
        result.addMessage(m);

    }

    private void evaluateColumns(ValidationResult result, Map<String, Map<String, String>> tests,
            Map<String, String> externals, ValidationRule rule, List<Value> values) {
        ValidationMessage message = null;
        // some validation problems have priority
        boolean alreadyChecked = false;
        
        for (String key : rule.getColumns().split(",")) {
            if (alreadyChecked) {
                continue;
            }

            // get the map name ->value
            Map<String, String> test = tests.get(key);
            if(test==null){
                message = new ValidationMessage();
                message.setMessage("validation.notcompiled");
                message.setRule(rule);
                message.setSuccess(false);
                message.addElements(Arrays.asList(rule.getEntryId().split(",")));

            }
            List<String> missing = checkRuleFields(rule.getVariables(), test);
            // missing variables
            if (missing.size() > 0) {
                if(missing.size()==rule.getVariables().size() && message !=null) continue;
                message = new ValidationMessage();
                message.setMessage("validation.notcompiled");
                message.setRule(rule);
                message.setSuccess(false);
                
                //whole table
                message.addElements(Arrays.asList(rule.getEntryId().split(",")));
                
                
                alreadyChecked = true;
                continue;
            }
            //skip the column if contains N/A values
            if(checkRuleNA(rule.getVariables(), test)){
                return;
            }
            //get single values
            Map <String,String> singleValues = getSingleValues(values,rule);
            try {
                boolean success = rule.evaluate(test, externals,singleValues);
                //
                // check rules
                //

                // create the message if not created
                if (message == null) {
                    message = new ValidationMessage();
                    message.setRule(rule);
                    message.setSuccess(success);
                    message.setMessage(rule.getError());
                }
                if (!success) {
                    // add the columns that not satisfy the rule

                    message.addElements(Arrays.asList(rule.getEntryId().split(",")));
                    message.setSuccess(false);
                    
                }
            } catch (ScriptException e) {
                message= generateParseProblemMessage(rule);
                
                alreadyChecked = true;

            } catch (NullPointerException e) {
                message= generateParseProblemMessage(rule);
                
                alreadyChecked = true;
            }

        }
        if (message == null) {
            message = new ValidationMessage();
            message.setMessage("validation.notcompiled");
            message.setRule(rule);
            message.setSuccess(false);

            // whole table
            message.addElements(Arrays.asList(rule.getEntryId().split(",")));
          
        }
            result.addMessage(message);

    }
    /**
     * Creates a map for single values <<1.2-2000>>-->12.34
     * @param values
     * @param rule
     */
    private Map <String,String> getSingleValues(List<Value> values, ValidationRule rule) {
        List<String> singleValuesNames = rule.getSingleValues();
        Map <String,String> singleValues= new HashMap<String,String>();
        for(String singleValueName : singleValuesNames){
            String[] coordinates =singleValueName.split("-");
            String row = coordinates[0];
            String column = coordinates[1];
            singleValues.put(singleValueName,getValue(values, row, column));
        }
        return singleValues;
        
        
    }

    private String getValue (List<Value> values, String row, String column ){
        for(Value v: values){
            EntryItem i = v.getEntryItem();
            if(column.equals(i.getColumnName() ) && row.equals(i.getRowName()) ){
                return v.getContent();
            }
        }
        return null;
    }
    private void populateTests(List<Value> values, Map<String, Map<String, String>> tests) {
        for (Value value : values) {
            // for each column add a map name (1.2) -> value (e.g. 1234)
            Map<String, String> testEntry;
            String colname = value.getEntryItem().getColumnName();
            if (!tests.containsKey(colname)) {
                testEntry = new HashMap<String, String>();
                tests.put(colname, testEntry);
            } else {
                testEntry = tests.get(colname);
            }
            testEntry.put(value.getEntryItem().getRowName(), value.getContent());
        }
    }

    /**
     * generates Parse problem message (utility subroutine)
     * 
     * @param message
     * @param rule
     */
    private ValidationMessage generateParseProblemMessage(ValidationRule rule) {
        ValidationMessage message = new ValidationMessage();
        message.setMessage("validation.parseproblem");
        message.setRule(rule);
        message.setSuccess(false);
        message.addElement(rule.getCondition());
        return message;

    }

    /**
     * Checks missing variables for a particular rule
     * 
     * @param rule the rule to check
     * @param test the list of available variables
     * @return the missing variables
     */
    private List<String> checkRuleFields(List<String> vars, Map<String, String> test) {
        List<String> missing = new ArrayList<String>();

        for (String name : vars) {
            if(test==null) {
             return null;   
            }
            if (test.get(name) == null) {
                missing.add(name);
            }
        }
        return missing;
    }
    /**
     * Check if some rules are NaN (N/A for the meaning, and so the rule have
     * to be skipped
     * @param vars
     * @param test
     * @return
     */
    private boolean checkRuleNA(List<String> vars, Map<String, String> test) {
        List<String> missing = new ArrayList<String>();

        for (String name : vars) {
            if(test==null) {
                return false;
            }
            Double d= Double.parseDouble(test.get(name));
               if(d.isNaN()){
                   return true;
               }
        }
        return false;
    }

    // Setters and Getters
    public RuleList getRuleList() {
        return ruleList;
    }

    public void setRuleList(RuleList ruleList) {
        this.ruleList = ruleList;
    }

    // inizializer
    @Override
    public void afterPropertiesSet() throws Exception {
        // TODO Auto-generated method stub
        InputStream rulesFile;
        try {
            rulesFile = applicationContext.getResource("classpath:validation-rules.xml")
                    .getInputStream();
        } catch (IOException e) {
            LOGGER.error("unable to load validation-rules:" + e);
            throw e;
        }

        if (rulesFile == null)
            throw new IllegalArgumentException("rulesFile is null");

        // if(! rulesFile.canRead() )
        // throw new IllegalArgumentException("rulesFile does not exist: " + rulesFile);

        ruleList = JAXB.unmarshal(rulesFile, RuleList.class);
        Iterator<ValidationRule> it = ruleList.iterator();
        LOGGER.info(it.hasNext() + "");
        while (it.hasNext()) {
            LOGGER.info(it.next().getDescription());

        }

    }

    @Override
    public void setApplicationContext(ApplicationContext ac) throws BeansException {
        this.applicationContext = ac;
    }

}
