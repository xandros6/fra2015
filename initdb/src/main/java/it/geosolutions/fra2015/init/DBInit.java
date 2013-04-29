/*
 */
package it.geosolutions.fra2015.init;

import it.geosolutions.fra2015.server.dao.UserDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Simply loads a DAO, in order to have the DB created by hibernate.
 *
 * @author etj
 */
public class DBInit  {
    
    private final static Logger LOGGER = LoggerFactory.getLogger(DBInit.class);

    public static void main(String[] args) {

        String[] paths = {"classpath*:applicationContext.xml"};

        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(paths);

        // init and (automatically) run initters methods
        UserDAO justADao = (UserDAO)ctx.getBean("userDAO");
    }
    
}
