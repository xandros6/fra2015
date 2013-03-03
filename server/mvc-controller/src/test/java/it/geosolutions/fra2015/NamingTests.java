package it.geosolutions.fra2015;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.Test;

import junit.framework.Assert;

public class NamingTests extends Assert{
    
    public NamingTests(){}
    
    /**
     * Quick and dirty dirty test used for NamingTest.java
     */
    @Test
    public void checkRegexForNamingTest() {
        
        String expected1 = "dd";
        String expected2 = "dd";
        String expected3 = "dd";
        
        List<String> samples = new ArrayList<String>();
        samples.add("_ffafad66_dd_)uqtfg_qwdcwd_]hgh_3[3]e]_7775_yu");
//        String patternForVariableName = "(?<=\\_variable_)(\\d+)(?=\\[)";
//        String patternForVariableName = "(?<=\\_variable_)(\\d+)(?=\\[)";
//        String patternForVariableName = "(?<=\\[)(\\d+)(?=\\])"";
        Pattern p = Pattern.compile("(?<=\\_)((\\p{Alnum})*?)(?=\\_)");
        
        for(String el : samples){
            Matcher m = p.matcher(el);
            
            while (m.find()) {
//                assertEquals(expected, m.group(0));
                System.out.println(m.group(0));
            }
        }
        
    }
}