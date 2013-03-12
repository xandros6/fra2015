package it.geosolutions.fra2015.validation;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name="rule")
public class ValidationRule {
		private String id;
		private String description;
		private String entryId;
		private String error;
		private String condition;

		@XmlElement(name="id")
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
	    @XmlElement(name="description")
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		
		@XmlElement(name="entryId")
		public String getEntryId() {
			return entryId;
		}
		public void setEntryId(String entryId) {
			this.entryId = entryId;
		}
		
		@XmlElement(name="error")
		public String getError() {
			return error;
		}
		public void setError(String error) {
			this.error = error;
		}
		
		@XmlElement(name="condition")
		public String getCondition() {
			return condition;
		}
		public void setCondition(String condition) {
			this.condition = condition;
		}
		public List<String> getVariables() {
			String condition = this.getCondition();
			String pattern = "\\{\\{\\s*([^\\}\\s]*)\\s*\\}\\}";
			Pattern p = Pattern.compile(pattern);
			Matcher m = p.matcher(condition);
			List<String> result = new ArrayList();
			while(m.find()){
				result.add(m.group(1));
			}
			return result;
			
			
			// TODO Auto-generated method stub
			
		}
		public List<String> getExternalData() {
			String condition = this.getCondition();
			String pattern = "\\[\\[\\s*([^\\]\\s]*)\\s*\\]\\]";
			Pattern p = Pattern.compile(pattern);
			Matcher m = p.matcher(condition);
			List<String> result = new ArrayList();
			while(m.find()){
				result.add(m.group(1));
			}
			return result;
			
			
			// TODO Auto-generated method stub
			
		}
		public boolean evaluate(Map<String,String> values,Map<String,String> externals) throws ScriptException{
			 ScriptEngineManager mgr = new ScriptEngineManager();
			 String condition = new String(this.getCondition());
			 //cycle map
			 for(String s : values.keySet()){
				 String varmatch = "\\{\\{"+ s +"\\}\\}";
				 Pattern p = Pattern.compile(varmatch);
				 Matcher m = p.matcher(condition);
				 condition= m.replaceAll(values.get(s));
			 }
			 if(externals != null){
				 for(String s : externals.keySet()){
					 String varmatch = "\\[\\["+ s +"\\]\\]";
					 Pattern p = Pattern.compile(varmatch);
					 Matcher m = p.matcher(condition);
					 condition= m.replaceAll(externals.get(s));
				 }
			 }
		     ScriptEngine engine = mgr.getEngineByName("JavaScript");
			 
		     return (Boolean) engine.eval(condition);
			
			
		}
		public boolean evaluate(Map<String,String> values) throws ScriptException{
			return evaluate(values,null);
		}
	    
}
