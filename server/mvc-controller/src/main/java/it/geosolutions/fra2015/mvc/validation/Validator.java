package it.geosolutions.fra2015.mvc.validation;

import it.geosolutions.fra2015.server.model.survey.EntryItem;
import it.geosolutions.fra2015.server.model.survey.Value;
import it.geosolutions.fra2015.services.SurveyService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.validation.RuleList;
import it.geosolutions.fra2015.validation.ValidationResult;
import it.geosolutions.fra2015.validation.ValidationRule;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.xml.bind.JAXB;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import javax.script.ScriptEngineManager;
import javax.script.ScriptEngine;
import javax.script.ScriptException;
public class Validator implements InitializingBean,ApplicationContextAware{
	private ApplicationContext applicationContext;
	private final static Logger LOGGER = LoggerFactory
			.getLogger(Validator.class);

	File rulesFile;
	RuleList ruleList;
	@Autowired 
	private SurveyService surveyService;
	/**
	 * Validates the whole country values
	 * @param country
	 * @return
	 */
	public ValidationResult validate(String country){
		
		Iterator<ValidationRule> it =ruleList.iterator();
		ValidationResult result = new ValidationResult();
		result.setSuccess(true);
		while(it.hasNext()){
			ValidationRule rule =it.next();
			List<String> vars= rule.getVariables();
			try {
				List<Value> values = surveyService.getEntryListByVariableName(vars, country);
				validateRule(values,rule,result);
				
			} catch (BadRequestServiceEx e) {
				LOGGER.error("error retriving variables during validation",e);
				
			}
			
		}
		
		return result;
	}
	
	
	private void validateRule(List<Value> values, ValidationRule rule, ValidationResult result) {
		Map<String,Map<String,String>> tests = new HashMap<String,Map<String,String>>();
		//get all columns
		if(values.size()==0){
			result.setSuccess(false);
			result.addMessage(rule.getError());
		}
		for(Value value :values){
			//for each column add a map name -> value
			Map<String,String> testEntry;
			String colname = value.getEntryItem().getColumnName();
			if(!tests.containsKey(colname)){
				testEntry =new HashMap<String,String>();
				tests.put(colname,testEntry);
			}else{
				testEntry= tests.get(colname);
			}
			testEntry.put(value.getEntryItem().getRowName(),value.getContent());
		}
		for(String key :tests.keySet()){
			Map<String,String> test = tests.get(key);
			try {
				boolean success = rule.evaluate(test);
				if(!success){
					result.setSuccess(success);
					result.addMessage(rule.getError());
				}
			} catch (ScriptException e) {
				result.setSuccess(false);
				result.addMessage(rule.getError());
			}
		}
		
	}


	private Map createMap() {
		// TODO Auto-generated method stub
		return null;
	}


	


	public RuleList getRuleList() {
		return ruleList;
	}


	public void setRuleList(RuleList ruleList) {
		this.ruleList = ruleList;
	}


	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		try {
			rulesFile = applicationContext.getResource(
					"classpath:validation-rules.xml").getFile();
		} catch (IOException e) {
			LOGGER.error("unable to load validation-rules:" + e);

		}
		ruleList =JAXB.unmarshal(rulesFile, RuleList.class);
		Iterator<ValidationRule> it = ruleList.iterator();
		LOGGER.info(it.hasNext()+"");
		while(it.hasNext()){
			LOGGER.info(it.next().getDescription());
			
		}
		
		
	}
	@Override
    public void setApplicationContext(ApplicationContext ac) throws BeansException {
        this.applicationContext = ac;
    }

	
}
