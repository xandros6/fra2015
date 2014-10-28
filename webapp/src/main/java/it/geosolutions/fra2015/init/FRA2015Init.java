/*
 */
package it.geosolutions.fra2015.init;

import com.googlecode.genericdao.search.Filter;
import com.googlecode.genericdao.search.Search;
import it.geosolutions.fra2015.entrypoint.SurveyServiceEntryPoint;
import it.geosolutions.fra2015.init.model.CountryList;
import it.geosolutions.fra2015.server.dao.CountryDAO;
import it.geosolutions.fra2015.server.dao.EntryDAO;
import it.geosolutions.fra2015.server.dao.NumberValueDAO;
import it.geosolutions.fra2015.server.dao.SurveyDAO;
import it.geosolutions.fra2015.server.dao.TextValueDAO;
import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.Element;
import it.geosolutions.fra2015.server.model.survey.Entry;
import it.geosolutions.fra2015.server.model.survey.NumberValue;
import it.geosolutions.fra2015.server.model.survey.Question;
import it.geosolutions.fra2015.server.model.survey.Session;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.survey.Survey;
import it.geosolutions.fra2015.server.model.survey.SurveyInstance;
import it.geosolutions.fra2015.server.model.survey.TextValue;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.UserService;
import it.geosolutions.fra2015.services.SurveyCatalog;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import javax.xml.bind.JAXB;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**C
 *
 * @author etj
 */
public class FRA2015Init implements InitializingBean, ApplicationContextAware {
    
    private final static Logger LOGGER = LoggerFactory.getLogger(FRA2015Init.class);
    
    private CountryDAO countryDAO;
    private EntryDAO entryDAO;
    private SurveyDAO surveyDAO;
    private NumberValueDAO numberValueDAO;
    private TextValueDAO textValueDAO;
    
    private UserService userService;
    private SurveyServiceEntryPoint restSurveyService;
    
    private ApplicationContext applicationContext; 
    
    private File countriesFile;
    private File surveyFile;

    private SurveyCatalog surveyCatalog;

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

        fixBadEntries();
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
        //Add editor
        User ed = new User();
        ed.setName("Editor");
        ed.setUsername("ed");
        ed.setNewPassword("ed");
        ed.setRole("editor");
        ed.setEmail("ed@survey.fra.fao.org");
        //ARG
        Country edcountry = countryDAO.find((long) 12);
        ed.getCountriesSet().add(edcountry);
        userService.insert(ed);

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
        // UNCOMMENT THIS CALL TO TRY AND REMOVE EMPTY ITEMS
         removeEmptyEntries(survey);

        restSurveyService.create(survey);

        surveyCatalog.reinit();
    }
    
    private static void removeEmptyEntries(Survey survey) {
        for (Element parent : survey.getElements()) {
            if(parent instanceof Question) {
                Question q = (Question)parent;
                removeEmptyEntries(q);
            } else if ( parent instanceof Session) {
                Session s = (Session)parent;
                removeEmptyEntries(s);
            } else
                LOGGER.warn("Unexpected Element found " + parent + " (" + parent.getClass().getName() + ")");
        }
    }

    private static void removeEmptyEntries(Question q) {
        for (Iterator<Entry> it = q.getEntries().iterator(); it.hasNext();) {
            Entry entry = it.next();
            if( CollectionUtils.isEmpty(entry.getEntryItems())) {
                LOGGER.debug("Removing empty entry " + entry);
                it.remove();
            }
        }
    }

    private static void removeEmptyEntries(Session s) {
        for (Iterator<Element> it = s.getElements().iterator(); it.hasNext();) {
            Element parent = it.next();
            if(parent instanceof Question) {
                Question q = (Question)parent;
                removeEmptyEntries(q);
            } else
                LOGGER.warn("Unexpected Element found " + parent + " (" + parent.getClass().getName() + ")");
        }
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

    public void setNumberValueDAO(NumberValueDAO numberValueDAO) {
        this.numberValueDAO = numberValueDAO;
    }

    public void setTextValueDAO(TextValueDAO textValueDAO) {
        this.textValueDAO = textValueDAO;
    }
    
    @Override
    public void setApplicationContext(ApplicationContext ac) throws BeansException {
        this.applicationContext = ac;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setSurveyCatalog(SurveyCatalog surveyCatalog) {
        this.surveyCatalog = surveyCatalog;
    }

    /**
     * Entries with rownames 4.1, 4.2, 21.1, 21.2, were incorrectly set as String, while they are Numeric.
     * This means that all related values have been saved as TextValue instead of NumberValue.
     * This method will migrate such values from TextValue to NumberValue.
     */
    private void fixBadEntries() {

        Search search = new Search(TextValue.class);
        search.addFilterOr(
                Filter.equal("entryItem.rowName", "4.1"),
                Filter.equal("entryItem.rowName", "4.2"),
                Filter.equal("entryItem.rowName", "21.1"),
                Filter.equal("entryItem.rowName", "21.2")
                );
        List<TextValue> textValues = textValueDAO.search(search);
        LOGGER.warn("Found " +textValues.size() + " TextValues to convert into NumericValues");

        for (TextValue textValue : textValues) {
            NumberValue numberValue = null;
            if( StringUtils.isBlank(textValue.getContent())) {
                LOGGER.info("Skipping blank content for "+ textValue.getEntryItem().getRowName() + " variable for " + textValue.getCountry().getIso3());
            } else {
                try {
                    Double d = Double.valueOf(textValue.getValue());
                    numberValue = new NumberValue();
                    numberValue.setValue(d);
                } catch(NumberFormatException e) {
                    LOGGER.warn("Error parsing value '"+textValue.getContent()+"': will be set as NaN");
                    numberValue = new NumberValue();
                    numberValue.setValue(Double.NaN);
                }
            }

            if(numberValue != null) {
                numberValue.setCountry(textValue.getCountry());
                numberValue.setEntryItem(textValue.getEntryItem()); // same entryitem: we should have updated the DB by hand
                LOGGER.info("Migrating " + textValue.getEntryItem().getRowName() + " variable for " + textValue.getCountry().getIso3());
                numberValueDAO.persist(numberValue);
            }
            LOGGER.info("Removing  " + textValue.getEntryItem().getRowName() + " variable for " + textValue.getCountry().getIso3());
            textValueDAO.remove(textValue);
        }
    }

    
}
