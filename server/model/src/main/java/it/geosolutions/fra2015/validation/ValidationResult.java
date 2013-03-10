package it.geosolutions.fra2015.validation;

import java.util.ArrayList;
import java.util.List;

public class ValidationResult {
	private List<String> messages;
	private Boolean success;
	public List<String> getMessages() {
		return messages;
	}
	public void setMessages(List<String> messages) {
		this.messages = messages;
	}
	public void addMessage(String message){
		if(messages==null){
			messages=new ArrayList<String>();
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
