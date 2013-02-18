/*
 */
package it.geosolutions.fra2015.init;

import it.geosolutions.fra2015.init.model.CountryList;
import it.geosolutions.fra2015.server.dao.CountryDAO;
import it.geosolutions.fra2015.server.model.survey.Country;
import java.io.File;
import java.io.IOException;
import javax.xml.bind.JAXB;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 *
 * @author etj
 */
public class FRA2015Init implements InitializingBean, ApplicationContextAware {
    
    private final static Logger LOGGER = LoggerFactory.getLogger(FRA2015Init.class);
    
    private CountryDAO countryDAO;
    private ApplicationContext applicationContext; 
    
//    <bean id="countryDAO" class="it.geosolutions.fra2015.server.dao.impl.CountryDAOImpl" >
//         <property name="searchProcessor" ref="fra2015SearchProcessor" />
//    </bean>    
//    

    @Override
    public void afterPropertiesSet() throws Exception {
        checkAndInsertAdmin();
        checkAndInsertCountries();        
    }
    
    public void setCountryDAO(CountryDAO countryDAO) {
        this.countryDAO = countryDAO;
    }

    @Override
    public void setApplicationContext(ApplicationContext ac) throws BeansException {
        this.applicationContext = ac;
    }

    private void checkAndInsertAdmin() {
        
//        throw new UnsupportedOperationException("Not yet implemented");
    }

    private void checkAndInsertCountries() throws IOException {
        if(countryDAO.count(null) == 0) {
            LOGGER.warn("No Country in the DB: initializing Countries...");
            File countriesFile = applicationContext.getResource("countries.xml").getFile();
            if(countriesFile == null) {
                LOGGER.error("Country file not found. Can not initialize.");
                return;                
            }
            
            CountryList list = JAXB.unmarshal(countriesFile, CountryList.class);
            LOGGER.info("Persisting " + list.getCountries().size() + " countries");
            for (Country country : list) {
                countryDAO.persist(country);
            }            
        }
    }
    
    
    

}
