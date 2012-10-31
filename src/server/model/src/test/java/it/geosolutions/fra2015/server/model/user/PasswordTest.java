/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.model.user;

import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author francesco
 */
public class PasswordTest {
    
    public PasswordTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getPassword method, of class Password.
     */
    @Test
    public void testGetPassword() {
        System.out.println("getPassword");
        
        String expResult = "psw";
        
        Password instance = new Password();
        
        instance.setPassword(expResult);
        
        String result = instance.getPassword();
        
        assertNotNull(result);
        
    }

    /**
     * Test of check method, of class Password.
     */
    @Test
    public void testCheck() {
        System.out.println("check");
        String str = "psw";
        Password instance = new Password();
        try {
            instance.setPassword(Password.encryptPassword(str.getBytes()));
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(PasswordTest.class.getName()).log(Level.SEVERE, null, ex);
            fail(ex.toString());
        }
        boolean expResult = true;
        boolean result = instance.check(str);
        assertEquals(expResult, result);
    }

}
