package it.geosolutions.fra2015.tags;

import it.geosolutions.fra2015.mvc.controller.SurveyController.OperationWR;
import it.geosolutions.fra2015.server.model.user.User;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.log4j.Logger;

/**
 * Tag that shows a editable text area when the user in session has the role
 * contained in editor attribute, and a div if it has not.
 * 
 * @author Lorenzo Natali
 * 
 */
@SuppressWarnings("serial")
public class RichTextEntry extends TagSupport {
	Logger LOGGER = Logger.getLogger(this.getClass());
	private static String editorStart = "<textarea class='texteditor entry-item' cols='160' rows='10' name='";
	private static String readerStart = "<div id='";
	private static String editorEnd = "</textarea>";
	private static String readerend = "</div>";

	private String editor = "contributor";

	private String reader;
	private String name;
	private boolean isEditor;

	public int doStartTag() {
		try {
			JspWriter out = pageContext.getOut();
			User user = (User) pageContext.getSession().getAttribute(
					"sessionUser");
			
			if(user==null){
				this.isEditor=false;
			}else{
				this.isEditor = editor.equals(user.getRole());
			}
			String value = "";

			if (pageContext.getRequest().getAttribute(this.name) != null) {
				value = (String) pageContext.getRequest().getAttribute(
						this.name);
			}
			// print start tag
			if (this.isEditor) {
				out.print(editorStart + this.name + "'>" + value);
			} else {
				out.print(readerStart + this.name + "'>" + value);

			}

		} catch (IOException ioe) {
			LOGGER.error("Error in SimpleTag: " + ioe);

		}
		return (SKIP_BODY);
	}

	public int doEndTag() throws JspException {

		try {

			JspWriter out = pageContext.getOut();
			if (this.isEditor) {
				out.print(RichTextEntry.editorEnd);
			} else {
				out.print(RichTextEntry.readerend);
			}

		} catch (IOException ioe) {
			LOGGER.error("Error in SimpleTag: " + ioe);
		}
		return (SKIP_BODY);
	}

	public String getEditor() {
		return editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	 private OperationWR validate(String operation){
	        
	        OperationWR op = null;
	        if(operation == null || operation.isEmpty()){
	            return OperationWR.WRITE;
	        }
	        try{
	            op = OperationWR.valueOf(operation);
	        }
	        catch(Exception e){
	            return null;
	        }
	        return op;
	    }

}
