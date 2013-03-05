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
@SuppressWarnings("serial")
public class RichTextTag extends TagSupport {
	Logger LOGGER = Logger.getLogger(this.getClass());
	private static String editorStart = "<textarea class='texteditor entry-item' cols='160' rows='10' name='";
	private static String readerStart = "<div>";
	private static String editorEnd = "</textarea>";
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
			
			String value = pageContext.getAttribute(this.name) !=null? (String) pageContext.getAttribute(this.name):"";
			//print start tag
			if (this.isEditor) {
				out.print(editorStart + this.name + "'>" + value);
			} else {
				out.print(readerStart + value);
				
			}
			LOGGER.info(user.getName());

		} catch (IOException ioe) {
			LOGGER.error("Error in SimpleTag: " + ioe);
			
		}
		return (SKIP_BODY);
	}

	public int doEndTag() throws JspException {
		
		try {
			
			JspWriter out = pageContext.getOut();
			if(this.isEditor){
				out.print(RichTextTag.editorEnd);
			}else{
				out.print(RichTextTag.readerend);
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
