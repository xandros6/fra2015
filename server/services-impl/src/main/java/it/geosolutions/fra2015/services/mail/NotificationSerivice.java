package it.geosolutions.fra2015.services.mail;

import freemarker.template.Configuration;
import freemarker.template.TemplateException;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.UserService;
import it.geosolutions.fra2015.services.utils.UserUtil;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
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
     * @throws TemplateException 
     * @throws IOException 
     */
    public void notifyContributorSubmit(User user, Status status, List<User> reviewers) throws IOException, TemplateException {
        notifyUsers(user,status,reviewers,"contributorSubmit");
   
    }
    
    /**
     * Notify the contributor that a survey has been reviewed and ready to be fixed
     * @param user
     * @param status
     * @param reviewers 
     * @throws TemplateException 
     * @throws IOException 
     */
    public void notifyPendingFix(User user, Status status, List<User> contributors) throws IOException, TemplateException {
        notifyUsers(user,status,contributors,"pendingFix");
   
    }
    
    /**
     * @param user
     * @param status
     * @param validators
     * @throws IOException
     * @throws TemplateException
     */
    public void notifyComplete(User user, Status status, List<User> validators) throws IOException, TemplateException {
        notifyUsers(user,status,validators,"complete");
   
    }
    
    /**
     * @param user
     * @param status
     * @param reviewEditors
     * @throws IOException
     * @throws TemplateException
     */
    public void notifyReviewerSubmit(User user, Status status, List<User> reviewEditors) throws IOException, TemplateException {
        notifyUsers(user,status,reviewEditors,"reviewerSubmit");
        
    }
    
    /**
     * @param user
     * @param status
     * @param reviewEditors
     * @throws IOException
     * @throws TemplateException
     */
    public void notifyDecline(User user,Status status,List<User> reviewEditors) throws IOException,TemplateException{
        notifyUsers(user, status, reviewEditors, "surveyDeclined");
    }
    
    /**
     * @param user
     * @param status
     * @param reviewers
     * @throws IOException
     * @throws TemplateException
     */
    public void notify(User user, Status status, List<User> reviewers) throws IOException, TemplateException {
    	notifyUsers(user, status, reviewers, "notify");
    }
    
    /**
     * Notify to a list of users a status change of the survey.
     * @param user
     * @param status
     * @param reviewers 
     * @throws TemplateException 
     * @throws IOException 
     */
    public void notifyUsers(User user, Status status, List<User> receivers, String templateName) throws IOException, TemplateException {
        Map<String,String> messageConfig = messages.get(templateName);
        
        for(User receiver: receivers){
            Map<String,Object> model =buildMessageModel(user,receiver,status);
            buildCountry(receiver,status,model);
            String message = applyTemplate(getTemplate(messageConfig,receiver),model);
            sendMessage(receiver.getEmail(),getSubject(receiver,templateName),message);
        }
    }
    
    /**
     * @param user
     * @param receiver
     * @param status
     * @return
     */
    public Map<String,Object> buildMessageModel(User user,User receiver,Status status) {
        Map<String,Object> model = new HashMap<String,Object>();
        model.put("receiver",receiver);
        model.put("user", user);
        model.put("status", status);
        //Translate the country name 

        // TODO Auto-generated method stub
        return model;
    }
    
    /**
     * @param receiver
     * @param status
     * @param model
     */
    public void buildCountry(User receiver,Status status,Map<String, Object> model){
        String country =status.getCountry();
        if (country == null) country = UserUtil.getSpacedIso3(receiver);
        try{
            country = messageSource.getMessage("country." + country,null,new Locale(receiver.getLanguage()) );
        }catch(NoSuchMessageException e){
            try{
                country = messageSource.getMessage("country." + country ,null,new Locale("en"));
            }catch(NoSuchMessageException ee){
                LOGGER.warn("localization not found for country" + country);
            }
        }
        model.put("country",country);
    }

    /**
     * Get the first subject in order
     * * if defined in messageSource as emails.subject.[templateName]
     * * if defined in configuration as [language]_subject
     * * if both of previous are null, returns the default subject
     * @param language 
     * @return
     */
    private String getSubject(User receiver,String templateName) {
        String lang =receiver.getLanguage();
        String subject =null;
        try{
            subject= messageSource.getMessage("emails.subject." +templateName , null,new Locale(lang));
        }catch(NoSuchMessageException e){
            Map<String,String> conf= messages.get(templateName);
            subject = conf.get(lang+"_subject");
            if(subject!=null){
                return subject;
            }
            else return conf.get("subject");
        }
        return subject;
    }

    /**
     * Looks in messageConfig if the template for the user preferred language is present. If it isn't,
     * gets the "template" entry. Allowed values are "en","fr","es"
     * @param messageConfig
     * @param user
     * @return
     */
    private static String getTemplate(Map<String, String> messageConfig, User user) {
        String lang = user.getLanguage();
        if(messageConfig.containsKey(lang)){
            return messageConfig.get(lang);
        }
        return messageConfig.get("template");
    }

    private String applyTemplate(String template, Map model) throws IOException, TemplateException{
        String result=null;
        try {
            result = FreeMarkerTemplateUtils.processTemplateIntoString(
                    configuration.getTemplate(template), model);
        } catch (IOException e) {
            LOGGER.error("unable to read template file"+ template, e);
            throw e; 
            
        } catch (TemplateException e) {
            LOGGER.error("unable to use freMarkerTemplate:" + template);
            throw e; 
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
        if(LOGGER.isInfoEnabled()){
            LOGGER.info("Mail sent FROM " +mailFromAddress + " TO " + address + " USING " + mailSender.toString());
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
