/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.dao.util;

import org.apache.log4j.Logger;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 *
 * @author ETj <etj at geo-solutions.it>
 */
public class PwEncoderTest {

    public PwEncoderTest() {
    }

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
    }

    @Test
    public void testEncode() {
        testString("test");
        testString("topolino");
        testString("");

    }

    public void testString(String test) {

        Logger log = Logger.getLogger(PwEncoderTest.class);
        
        StringBuilder sb = new StringBuilder();

        String enc = PwEncoder.encode(test);
        
        String dec = PwEncoder.decode(enc);
                
        sb.append("testing ").append(test).append(" enc:").append(enc).append(" dec:").append(dec);
        
        log.info(sb.toString());
        
        assertEquals(test, dec);
    }
}