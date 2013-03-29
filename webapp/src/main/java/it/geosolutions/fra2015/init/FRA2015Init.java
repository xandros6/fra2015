/*
 */
package it.geosolutions.fra2015.init;

import it.geosolutions.fra2015.entrypoint.SurveyServiceEntryPoint;
import it.geosolutions.fra2015.init.model.CountryList;
import it.geosolutions.fra2015.server.dao.CountryDAO;
import it.geosolutions.fra2015.server.dao.EntryDAO;
import it.geosolutions.fra2015.server.dao.SurveyDAO;
import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.Question;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.survey.Survey;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.UserService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
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
    private EntryDAO entryDAO;
    private SurveyDAO surveyDAO;
    
    private UserService userService;
    private SurveyServiceEntryPoint restSurveyService;
    
    private ApplicationContext applicationContext; 
    
    private File countriesFile;
    private File surveyFile;

    public void setRestSurveyService(SurveyServiceEntryPoint restSurveyService) {
        this.restSurveyService = restSurveyService;
    }
    
//     <bean id="restSurvey" class="it.geosolutions.fra2015.services.rest.impl.SurveyServiceImpl">
//<bean id="userService" class="it.geosolutions.fra2015.services.UserServiceImpl">
    
    @Override
    public void afterPropertiesSet() throws Exception {

        countriesFile = applicationContext.getResource("classpath:countries.xml").getFile();        
        surveyFile = applicationContext.getResource("classpath:survey.xml").getFile();
        
        checkAndInsertCountries();
        checkAndInsertSurvey();
        checkAndInsertAdmin();               
    }

    private void checkAndInsertAdmin() throws BadRequestServiceEx, IOException {
        long cnt = userService.getCount();
        
        if(cnt == 0) {
            insertAdmin();
            insertSampleUsers();                    
        }
        
        LOGGER.info(userService.getCount() + " users found in DB.");
    }

    private void insertAdmin() throws BadRequestServiceEx {
        LOGGER.warn("No user found in db. Creating default admin user.");
        
        User user = new User();
        user.setName("admin");
        user.setUsername("admin");
        user.setNewPassword("frafra");
        user.setRole("admin");
        user.setEmail("fake@unexistent.domain");
        
        userService.insert(user);
    }

    private void insertSampleUsers() throws IOException, BadRequestServiceEx {
        LOGGER.error("No user found in db. Creating sample country users. THIS PROCEDURE SHALL BE DISABLED IN PRODUCTION!");

        if(countriesFile == null) {
            LOGGER.error("Country file not found. Can not initialize.");
            return;                
        }

        CountryList countryList = JAXB.unmarshal(countriesFile, CountryList.class);
        LOGGER.info("Persisting " + countryList.getCountries().size() + " country users");
        for (Country country : countryList) {
        	Country pcountry = countryDAO.find(country.getId());
            User user = new User();
            user.setName("User " + country.getName());
            user.getCountriesSet().add(pcountry);
            user.setUsername(country.getIso3());
            user.setNewPassword(Long.toString(country.getId()));
            user.setRole("contributor");
            user.setEmail("fra2015@surveyservice." + country.getIso3().toLowerCase());

            try {
                userService.insert(user);
            } catch (Exception ex) {
                LOGGER.error("Error creating user for country" + country);
            }
        }

        class RevInit {
            int div;
            int[] qlist;

            public RevInit(int div, int ... qlist) {
                this.div = div;
                this.qlist = qlist;
            }
        }

        final RevInit[] divarr = new RevInit[] {
            new RevInit(4, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21),
            new RevInit(5, 0,1,2,3,4,5,6),
            new RevInit(6,           5,6,7,8,9,10,11,12,13,14),
            new RevInit(7, 0,1,2,                       13,14,15,16,17,18,19,20,21),
        };

        for (int i = 0; i < divarr.length; i++) {

            User user = new User();
            user.setName("Reviewer #"+(i+1));
            user.setUsername("rev"+(i+1));
            user.setNewPassword(Integer.toString(i+1));
            user.setRole("reviewer");
            user.setEmail("rev"+(i+1)+"@survey.fra.fao.org");


            RevInit div = divarr[i];
            for (Country country : countryList) {
                if (country.getId() % div.div == 0) {
                    Country pcountry = countryDAO.find(country.getId());
                    user.getCountriesSet().add(pcountry);
                }
            }

            for (int j : div.qlist) {
                Question q = new Question();
                q.setId((long)j);
                user.getQuestions().add(q);
            }

            LOGGER.info("Saving " + user + " associated to " + user.getCountriesSet().size() + " countries and " + user.getQuestions().size() + " questions");
            try {
                userService.insert(user);
            } catch (Exception ex) {
                LOGGER.error("Error creating " + user + ": " + ex.getMessage());
            }
        }

    }
    
    private void checkAndInsertCountries() throws IOException {
        if(countryDAO.count(null) == 0) {
            LOGGER.warn("No Country in the DB: initializing Countries...");
            if(countriesFile == null) {
                LOGGER.error("Country file not found. Can not initialize.");
                return;                
            }
            
            CountryList list = JAXB.unmarshal(countriesFile, CountryList.class);
            LOGGER.info("Persisting " + list.getCountries().size() + " countries");
            for (Country country : list) {
//                LOGGER.info("Persisting " + country);
                countryDAO.persist(country);
                // create an empty survey instance for each country
                SurveyInstance survey = new SurveyInstance();
                survey.setCountry(country);
                survey.setStatus(new Status("empty"));
                surveyDAO.persist(survey);
            }            
        }
        
        LOGGER.info(countryDAO.count(null) + " countries found in DB.");        
    }
    
    private void checkAndInsertSurvey() throws IOException {
        if(entryDAO.count(null) > 0) {
            return;
        }

        LOGGER.warn("No entry definition in the DB: initializing survey...");
                
        if(surveyFile == null) {
            LOGGER.error("Survey file not found. Can not initialize.");
            return;                
        }

        Survey survey = JAXB.unmarshal(surveyFile, Survey.class);
        restSurveyService.create(survey);
    }
    
    
    public void setCountryDAO(CountryDAO countryDAO) {
        this.countryDAO = countryDAO;
    }

    public void setEntryDAO(EntryDAO entryDAO) {
        this.entryDAO = entryDAO;
    }
    public void setSurveyDAO(SurveyDAO surveyDAO) {
        this.surveyDAO = surveyDAO;
    }

    @Override
    public void setApplicationContext(ApplicationContext ac) throws BeansException {
        this.applicationContext = ac;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
