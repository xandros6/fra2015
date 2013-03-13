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

    public void addMessage(ValidationMessage message) {
        if (messages == null) {
            messages = new ArrayList<ValidationMessage>();
        }
        if (message.success == false) {
            success = false;
        }
        for (ValidationMessage v : messages) {

            if (v.getMessage().equals(message.getMessage())) {
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
