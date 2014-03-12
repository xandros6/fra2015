/*
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
package it.geosolutions.fra2015.services;

import freemarker.template.TemplateException;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.mail.FraMailException;
import it.geosolutions.fra2015.services.mail.NotificationSerivice;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import junit.framework.Assert;

import org.apache.log4j.Logger;
import org.junit.After;
import org.junit.Assume;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author DamianoG
 *
 */
public class MailTest{

    private static final Logger LOGGER = Logger.getLogger(MailTest.class);
    
    private NotificationSerivice ns = null;
    private User sender = null;
    private Status status = null;
    private List<User> receivers = null;
    private ClassPathXmlApplicationContext appContext = null;
    private InputStream is = null;
    Properties prop = null;
    
    public MailTest(){}
    
    @Before
    public void before() throws IOException{

        is = MailTest.class.getResourceAsStream("mailTest.properties"); 
        prop = new Properties();
        prop.load(is);
        
        if("true".equals(prop.getProperty("mail.test.active"))){
            
            appContext = new ClassPathXmlApplicationContext("applicationContext.xml", "applicationContext-fra2015Datasource.xml", "applicationContextDAO.xml");
            
            ns = (NotificationSerivice)appContext.getBean("notificationService");
            receivers = new ArrayList<User>();
            sender = new User();
            sender.setUsername("sender");
            sender.setEmail("sender@sender.send");
            
            status = new Status();
            status.setCountry("Algeria");
            
            User receiverOK1 = new User();
            receiverOK1.setName("receiverOK1");
            receiverOK1.setUsername("receiverOK1");
            receiverOK1.setEmail(prop.getProperty("mail.test.mailOK1"));
            receivers.add(receiverOK1);
            
            User receiverOK2 = new User();
            receiverOK2.setName("receiverOK2");
            receiverOK2.setUsername("receiverOK2");
            receiverOK2.setEmail(prop.getProperty("mail.test.mailOK2"));
            receivers.add(receiverOK2);
            
            User receiverOK3 = new User();
            receiverOK3.setName("receiverOK3");
            receiverOK3.setUsername("receiverOK3");
            receiverOK3.setEmail(prop.getProperty("mail.test.mailOK3"));
            receivers.add(receiverOK3);
        }
        
    }
    
    @After
    public void after() throws IOException{
        is.close();
    }
    
    @Test
    public void testNotifyUsersWithFaults(){
        
        if(!"true".equals(prop.getProperty("mail.test.active"))){
            Assume.assumeTrue(true);
            return;
        };
        
        User receiverKO1 = new User();
        receiverKO1.setName("receiverKO1");
        receiverKO1.setUsername("receiverKO1");
        receiverKO1.setEmail(prop.getProperty("mail.test.mailKO1"));
        receivers.add(receiverKO1);
        
        User receiverKO2 = new User();
        receiverKO2.setName("receiverKO2");
        receiverKO2.setUsername("receiverKO2");
        receiverKO2.setEmail(prop.getProperty("mail.test.mailKO2"));
        receivers.add(receiverKO2);
        
        User receiverKO3 = new User();
        receiverKO3.setName("receiverKO3");
        receiverKO3.setUsername("receiverKO3");
        receiverKO3.setEmail(prop.getProperty("mail.test.mailKO3"));
        receivers.add(receiverKO3);
        
        User receiverKO4 = new User();
        receiverKO4.setName("receiverKO4");
        receiverKO4.setUsername("receiverKO4");
        receiverKO4.setEmail(prop.getProperty("mail.test.mailKO4"));
        receivers.add(receiverKO4);        
        
        try {
            ns.notifyComplete(sender, status, receivers);
        } catch (IOException e) {
            if(!(e instanceof FraMailException)){
                Assert.fail();
            }
            LOGGER.error(e.getMessage(), e);
            LOGGER.error("The following recipients address aren't valid: " + ((FraMailException)e).getFailedRecipientsNameList());
            Assert.assertEquals(4, ((FraMailException)e).getFailedRecipientsList().size());
        } catch (TemplateException e) {
            LOGGER.error(e.getMessage(), e);
            Assert.fail();
        }
        
    }
    
    @Test
    public void testNotifyUsersWithoutFaults(){
        
        if(!"true".equals(prop.getProperty("mail.test.active"))){
            Assume.assumeTrue(true);
            return;
        };
        
        try {
            ns.notifyComplete(sender, status, receivers);
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            Assert.fail();
        }
    }
}
