package it.geosolutions.fra2015.validation;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ValidationMessage {
	
	Set<String> elements = new HashSet<String>();
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
		return new ArrayList<String>(elements);
	}
	public void setElements(List<String> elements) {
		this.elements = new HashSet<String>(elements);
	}
	public void addElement(String s){
		elements.add(s);
	}
	public void addElements(List<String> elements){
	    this.elements.addAll(elements);
	}
	public void removeExistingElements(){
            this.elements.clear();
        }
	public List<String> getSortedElements(){
	    List<String> sort= new ArrayList<String>(this.elements);
	    java.util.Collections.sort(sort);
	    return sort;
	}
	
	
	
}
