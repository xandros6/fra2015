package it.geosolutions.fra2015.validation;

import java.util.ArrayList;
import java.util.List;

public class ValidationMessage {
	
	List<String> elements = new ArrayList<String>();
	boolean success;
	ValidationRule rule;
	String message;
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	//getters and setters
	public boolean getSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	
	
	public ValidationRule getRule() {
		return rule;
	}
	public void setRule(ValidationRule rule) {
		this.rule = rule;
	}
	public List<String> getElements() {
		return elements;
	}
	public void setElements(List<String> elements) {
		this.elements = elements;
	}
	public void addElement(String s){
		elements.add(s);
	}
	
	
}
