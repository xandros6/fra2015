package it.geosolutions.fra2015.services.mail;

import freemarker.template.Configuration;
import freemarker.template.TemplateException;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.UserService;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

public class NotificationSerivice {
    private static final Logger LOGGER = Logger.getLogger(NotificationSerivice.class);
   
    @Autowired
    private MessageSource messageSource;
    @Autowired
    private UserService userService;

    // freemarker configuration
    private Configuration configuration;

    private Map<String, Map<String,String>> messages;
    
    private MailSender mailSender;

    private String mailFromName;
   

    private String mailFromAddress;

    /**
     * Notify the reviewer that a survey has been submitted
     * @param user
     * @param status
     * @param reviewers 
     */
    public void notifyContributorSubmit(User user, Status status, List<User> reviewers) {
        Map<String,String> messageConfig = messages.get("contributorSubmit");
        
        for(User reviewer: reviewers){
            Map<String,Object> model = new HashMap<String,Object>();
            model.put("receiver",reviewer);
            model.put("user", user);
            model.put("status", status);
            //Translate the country name 
            String country = messageSource.getMessage("country." + user.getCountries(),null,new Locale("fr") );
            model.put("country",country);
            String message = applyTemplate(messageConfig.get("template"),model);
            sendMessage(reviewer.getEmail(),messageConfig.get("subject"),message);
        }
   
    }
    
    
    private String applyTemplate(String template, Map model){
        String result=null;
        try {
            result = FreeMarkerTemplateUtils.processTemplateIntoString(
                    configuration.getTemplate(template), model);
        } catch (IOException e) {
            LOGGER.error("unable to read template file"+ template, e);
        } catch (TemplateException e) {
            LOGGER.error("unable to use freMarkerTemplate:" + template);
        }
        return result;
        
    }
    private void sendMessage(String address,String subject, String body) {

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(address);
        message.setSubject(subject);
        message.setText(body);
        message.setFrom(this.mailFromAddress);
        mailSender.send(message);
        if(LOGGER.isDebugEnabled()){
            String logmessage = "\nmail sent:" +
                    "\n from:" +mailFromAddress +
                    "\n to:" + address + "\nusing mailSender" + mailSender.toString();
            LOGGER.info(logmessage);
        }
        

    }
    

    // getters and setters  
    public void setConfiguration(Configuration configuration) {
        this.configuration = configuration;
    }

    public void setTemplates(Map<String, Map<String,String>> templates) {
        this.messages = templates;
    }
    public void setFreemarkerMailConfiguration(Configuration configuration) {
        this.configuration = configuration;
    }

    public void setMailSender(MailSender mailSender) {
        this.mailSender = mailSender;
    }
    public void setMailFromName(String mailFromName) {
        this.mailFromName = mailFromName;
    }
    public void setMailFromAddress(String mailFromAddress) {
        this.mailFromAddress = mailFromAddress;
    }
    public Map<String, Map<String, String>> getMessages() {
        return messages;
    }
    public void setMessages(Map<String, Map<String, String>> messages) {
        this.messages = messages;
    }
    public String getMailFromName() {
        return mailFromName;
    }
    public String getMailFromAddress() {
        return mailFromAddress;
    }
}
