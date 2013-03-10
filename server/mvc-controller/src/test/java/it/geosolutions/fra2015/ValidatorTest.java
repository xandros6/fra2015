package it.geosolutions.fra2015;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import junit.framework.Assert;
import org.junit.Test;

import it.geosolutions.fra2015.mvc.validation.Validator;
import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.server.model.survey.EntryItem;
import it.geosolutions.fra2015.validation.RuleList;
import it.geosolutions.fra2015.validation.ValidationRule;
import javax.script.ScriptEngineManager;
import javax.script.ScriptEngine;
import javax.script.ScriptException;

public class ValidatorTest extends Assert {
	@Test
	public void validationTest() {
		List<EntryItem> entryitemlist = new ArrayList<EntryItem>();
		initItems(entryitemlist);
		Validator v = new Validator();
		initValidator(v);
		// TODO
	}

	@Test
	public void ruleTest() {
		ValidationRule v = new ValidationRule();
		v.setCondition(" {{1.4}} === {{1.5}} - ({{1.1}}+{{1.2}}+{{1.3}}) ");
		List<String> vars = v.getVariables();
		String[] varnames = { "1.4", "1.5", "1.1", "1.2", "1.3" };
		String[] values = 	{ "1"  , "16" , "5"  , "5"  , "5" };
		Map<String,String> valueMap = new HashMap();
		for(int i=0;i<varnames.length;i++){
			valueMap.put(varnames[i],values[i]);
		}
		
		int i = 0;
		for (String s : vars) {
			assertTrue(varnames[i].equals(s));
			i++;
		}
		try {
			v.evaluate(valueMap);
		} catch (ScriptException e) {
			fail(e.getMessage());
		}

	}

	private void initValidator(Validator v) {
		RuleList ruleList = new RuleList();
		List<ValidationRule> rules = new ArrayList<ValidationRule>();

		ruleList.setRules(rules);

		v.setRuleList(ruleList);
		// TODO

	}

	private void initItems(List<EntryItem> entryitemlist) {
		for (int i = 0; i < 100; i++) {
			EntryItem ei = new EntryItem();
			Integer cn = (2000 + (i % 4) * 5);
			ei.setColumnName(cn.toString());
			ei.setRowName(((i / 4) + 1) + "." + ((i % 4) + 1));
			ei.setEntry(new Entry());
			ei.getEntry().setVariable("2");
			entryitemlist.add(ei);
		}

	}
}
