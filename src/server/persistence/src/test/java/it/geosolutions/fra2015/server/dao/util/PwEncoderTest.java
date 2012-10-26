/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package it.geosolutions.fra2015.server.dao.util;


import java.util.logging.Level;
import java.util.logging.Logger;
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
        
        Logger log = Logger.getLogger(PwEncoderTest.class.getName());

        String enc = PwEncoder.encode(test);
        log.log(Level.INFO, "ENC --> {0}", enc);
        String dec = PwEncoder.decode(enc);
        log.log(Level.INFO, "DEC --> {0}", dec);
        assertEquals(test, dec);
    }

}