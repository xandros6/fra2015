package it.geosolutions.fra2015.validation;

import java.util.ArrayList;
import java.util.List;

public class ValidationResult {

    private List<ValidationMessage> messages;

    private Boolean success = true;

    public List<ValidationMessage> getMessages() {
        return messages;
    }

    public void setMessages(List<ValidationMessage> messages) {
        this.messages = messages;
    }

    /**
     * This method merge a single message in the ValidationResult message list.
     * 
     * If all messages related to a single label have status = positive add the positive messages
     * If, for a single label, there is at least one message with status = negative discard the positive elements 
     * and fill the elements list only with the negative elements.
     * 
     * @param message
     */
    public void addMessage(ValidationMessage message) {
        if (messages == null) {
            messages = new ArrayList<ValidationMessage>();
        }
        if (message.success == false) {
            success = false;
        }
        for (ValidationMessage v : messages) {

            if (v.getMessage().equals(message.getMessage())) {
                // if the current message list is a positive message and the new message is negative: 
                // Remove all the elements (that are positive) and  change the status
                if(v.getSuccess() && !message.getSuccess()){
                    v.removeExistingElements();
                    v.setSuccess(false);
                }
                // if the current message list is a negative message and the new message is positive:
                // skip, I want only the negative messages...
                if(!v.getSuccess() && message.getSuccess()){
                    continue;
                }
                v.addElements(message.getElements());
                return;
            }
            
        }
        messages.add(message);
    }

    public Boolean getSuccess() {
        return success;
    }
    
    public List<ValidationMessage>getSuccessMessages(){
        List<ValidationMessage> valid = new ArrayList<ValidationMessage>();
        for(ValidationMessage v : this.messages){
            if (v.getSuccess()){
                valid.add(v);
            }
        }
        return valid;
    }
    public List<ValidationMessage> getErrorMessages(){
        List<ValidationMessage> invalid = new ArrayList<ValidationMessage>();
        for(ValidationMessage v : this.messages){
            if (!v.getSuccess()){
                invalid.add(v);
            }
        }
        
        return invalid;
    }

}
