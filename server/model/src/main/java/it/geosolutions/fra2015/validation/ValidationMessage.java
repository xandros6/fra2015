package it.geosolutions.fra2015.validation;

import java.util.ArrayList;
import java.util.List;

public class ValidationMessage {
	String message;
	List<String> elements = new ArrayList<String>();
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
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
