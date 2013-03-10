package it.geosolutions.fra2015.validation;

import java.util.Iterator;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="rules")
public class RuleList implements Iterable<ValidationRule> {
	private List<ValidationRule> rules;
	
	@XmlElement(name="rule")
	public List<ValidationRule> getRules() {
		return rules;
	}

	public void setRules(List<ValidationRule> rules) {
		this.rules = rules;
	}

	@Override
	public Iterator<ValidationRule> iterator() {
		return rules.iterator();
	
	}
	
}
