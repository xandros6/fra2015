package it.geosolutions.fra2015;

import static org.junit.Assert.*;
import it.geosolutions.fra2015.validation.RuleList;
import it.geosolutions.fra2015.validation.ValidationRule;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.script.ScriptException;
import javax.xml.bind.JAXB;

import org.junit.Test;

public class TestValidationRules {

    @Test
    public void testXMLRules() {
        InputStream rulesFile;
        rulesFile = TestValidationRules.class.getClassLoader().getResourceAsStream(
                "validation-rules.xml");

        if (rulesFile == null)
            fail("rulesFile is null");

        // if(! rulesFile.canRead() )
        // throw new IllegalArgumentException("rulesFile does not exist: " + rulesFile);

        RuleList ruleList = JAXB.unmarshal(rulesFile, RuleList.class);
        Iterator<ValidationRule> it = ruleList.iterator();
        Map<String, String> values = new HashMap<String, String>();
        Map<String, String> externals = new HashMap<String, String>();
        Map<String, String> single = new HashMap<String, String>();
        while (it.hasNext()) {
            ValidationRule v = it.next();
            for (String s : v.getVariables()) {
                values.put(s, "3");
            }
            for (String s : v.getExternalData()) {
                externals.put(s, "3");
            }
            for (String s : v.getSingleValues()) {
                single.put(s, "3");
            }
            
            

        }
        System.out.println(values.size() + " " +externals.size() + " " +single.size());
        int i = 0;
        it = ruleList.iterator();
        while (it.hasNext()) {
            ValidationRule v= null;
            try {
                v = it.next();
                v.evaluate(values, externals, single);
                i++;
            } catch (ScriptException e) {
                fail(v.getCondition());
            }
        }
    }

}
