package it.geosolutions.fra2015.validation;

import java.util.ArrayList;
import java.util.List;

public class ValidationResult {
	private List<ValidationMessage> messages;
	private Boolean success;
	public List<ValidationMessage> getMessages() {
		return messages;
	}
	public void setMessages(List<ValidationMessage> messages) {
		this.messages = messages;
	}
	public void addMessage(ValidationMessage message){
		if(messages==null){
			messages=new ArrayList<ValidationMessage>();
		}
		messages.add(message);
	}
	public Boolean getSuccess() {
		return success;
	}
	public void setSuccess(Boolean success) {
		this.success = success;
	}
}
