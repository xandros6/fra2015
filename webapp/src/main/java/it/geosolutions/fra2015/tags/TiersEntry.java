package it.geosolutions.fra2015.tags;

import it.geosolutions.fra2015.server.model.user.User;

import java.io.IOException;

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
/*
 * <select name="_fraVariable_9_1_1_" rownumber="1"><option
 * selected="selected">---</option> <option value="Tier 1">Tier 1</option>
 * <option value="Tier 2">Tier 2</option> <option value="Tier 3">Tier
 * 3</option></select> </div></td>
 */
@SuppressWarnings("serial")
public class TiersEntry extends TagSupport {
	Logger LOGGER = Logger.getLogger(this.getClass());
	private static String editorStart = "<select name='";
	private static String readerStart = "<div>";
	private static String editorEnd = "</select>";
	private static String readerend = "</div>";

	private String editor = "contributor";

	private String reader;
	private String name;
	private boolean isEditor;

	public int doStartTag() {
		try {
			JspWriter out = pageContext.getOut();
			User user = (User) pageContext.getSession()
					.getAttribute("sessionUser");
			if (user == null) {
				return (SKIP_BODY);
			}
			this.isEditor = editor.equals(user.getRole());
				
			String value = pageContext.getRequest().getAttribute(this.name) !=null? (String) pageContext.getRequest().getAttribute(this.name):"";
			int index = 0;
			if("Tier 1".equals(value)) index= 1;
			if("Tier 2".equals(value)) index= 2;
			if("Tier 3".equals(value)) index= 3;
			//print start tag
			if (this.isEditor) {
				out.print(editorStart + this.name + "'>");
			String[] options ={
						" >---</option>",
						" value='Tier 1'>Tier 1</option>",
						" value='Tier 2'>Tier 2</option>",
						" value='Tier 3'>Tier 3</option>" 
			};
							
			String optionstring = "";
			for(int i=0; i<options.length;i++){
				optionstring+= "<option " + (index==i? " selected='selected '":"") + options[i];
			}
			out.print(optionstring);
			
			} else {
				out.print(readerStart + value);
				
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
				out.print(TiersEntry.editorEnd);
			} else {
				out.print(TiersEntry.readerend);
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

}
