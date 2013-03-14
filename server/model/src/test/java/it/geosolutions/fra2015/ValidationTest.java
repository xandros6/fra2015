package it.geosolutions.fra2015;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.server.model.survey.EntryItem;
import it.geosolutions.fra2015.validation.ValidationMessage;
import it.geosolutions.fra2015.validation.ValidationResult;
import it.geosolutions.fra2015.validation.ValidationRule;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.script.ScriptException;

import org.junit.Test;

public class ValidationTest {

	@Test
	public void ruleTest() {
		ValidationRule v = new ValidationRule();
		v.setCondition(" {{1.4}} === {{1.5}} - ({{1.1}}+{{1.2}}+{{1.3}}) + [[external]] ");
		List<String> vars = v.getVariables();
		String[] varnames = { "1.4", "1.5", "1.1", "1.2", "1.3" };
		String[] values = { "3", "16", "5", "5", "5" };
		Map<String, String> valueMap = new HashMap<String, String>();
		for (int i = 0; i < varnames.length; i++) {
			valueMap.put(varnames[i], values[i]);
		}
		Map<String, String> externals = new HashMap<String, String>();
		externals.put("external", "2");
		List<String> ext = v.getExternalData();
		assertTrue("external".equals(ext.get(0)));
		int i = 0;
		for (String s : vars) {
			assertTrue(varnames[i].equals(s));
			i++;
		}
		try {
			v.evaluate(valueMap,externals,null);
		} catch (ScriptException e) {
			fail(e.getMessage());
		}
		

	}
	
	@Test
	public void uniqueMessageTest(){
 
	    ValidationResult re= new ValidationResult();
	    ValidationMessage m1 = new ValidationMessage();
	    ValidationMessage m2 = new ValidationMessage();
	    m1.addElement("1");
	    m1.addElement("1");
	    assertTrue(m1.getElements().size()==1);
	    m1.setMessage("a");
	    m2.setMessage("a");
	    m1.addElement("3");
	    m2.addElement("2");
	    re.addMessage(m1);
	    re.addMessage(m2);
	    assertTrue(re.getMessages().size()==1);

	}
	@Test
	public void singleValueParsingTest(){
	    ValidationRule v = new ValidationRule();
	    
            String[] varnames = { "1.4", "1.5", "1.1", "1.2", "1.3" };
            String[] values = { "3", "16", "5", "5", "5" };
            v.setCondition("<<1.1-2010>> + {{1.1}} == 10");
            assertTrue("1.1-2010".equals(v.getSingleValues().get(0)));
            Map<String, String> valueMap = new HashMap<String, String>();
            for (int i = 0; i < varnames.length; i++) {
                    valueMap.put(varnames[i], values[i]);
            }
            Map<String, String> singleValues = new HashMap<String, String>();
            singleValues.put("1.1-2010","5");
            
            
            try {
                assertTrue(v.evaluate(valueMap,null,singleValues));
            } catch (ScriptException e) {
                fail("unable to parse condition");
            }
            
	}
	@Test
	public void  changeRateTest(){
	    ValidationRule v = new ValidationRule();
	    v.setCondition("-3 < 100* (Math.pow((<<1.1-2000>>/<<1.1-1990>>),(0.1))-1) &&" +
	    		    "100* (Math.pow((<<1.1-2000>>/<<1.1-1990>>),(0.1))-1) <3");
	    Map<String, String> singleValues = new HashMap<String, String>();
            singleValues.put("1.1-2000","5");
            singleValues.put("1.1-1990","3");
            try {
               assertTrue(!v.evaluate(null,null,singleValues)); // 5.240977914892531 >3
               singleValues.put("1.1-1990","4");
               assertTrue(v.evaluate(null,null,singleValues)); // - 3< 2.256518256357287 < 3
               singleValues.put("1.1-1990","7");
               assertTrue(!v.evaluate(null,null,singleValues)); // -3.3087451654251088
               singleValues.put("1.1-1990","6");
               assertTrue(v.evaluate(null,null,singleValues)); // -1.806695543808734

            } catch (ScriptException e) {
                fail();
            } 
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
