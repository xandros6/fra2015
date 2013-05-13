package it.geosolutions.fra2015.tags;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import org.apache.log4j.Logger;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.LocaleResolver;

/**
 * Tag that shows a checkbox group (radio-checkbox) when the user in session has
 * the role contained in editor attribute, and a div if it has not.
 * 
 * @author Lorenzo Natali
 * 
 */
@SuppressWarnings("serial")
public class YesNoEntry extends SurveyEntry {
	Logger LOGGER = Logger.getLogger(this.getClass());
	private static String editorStart = "<td class=\"entry-item editable boolean\" rownumber=\"7\" columnnumber=\"1\" style=\"background-color: rgb(242, 245, 169); \" entry-id=\"10\"><div id=\"cell-content\"><div>";
	private static String readerStart = "<td>";
	private static String editorEnd = "</div></div></td>";
	private static String readerend = "</td>";

	private String editor = "contributor";
	int rownumber;
	int columnnumber;
	String mod,style,entryId ;
	
	public String getEntryId() {
		return entryId;
	}

	public void setEntryId(String entryId) {
		this.entryId = entryId;
	}

	public int getRownumber() {
		return rownumber;
	}

	public void setRownumber(int rownumber) {
		this.rownumber = rownumber;
	}

	public int getColumnnumber() {
		return columnnumber;
	}

	public void setColumnnumber(int columnnumber) {
		this.columnnumber = columnnumber;
	}

	public String getMod() {
		return mod;
	}

	public void setMod(String mod) {
		this.mod = mod;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	private ReloadableResourceBundleMessageSource messageSource;

	LocaleResolver localeResolver;
	private String reader;
	private String name;
	private WebApplicationContext springContext;

	/**
	 * write the starting tag
	 */
	public int doStartTag() {
		try {
			JspWriter out = pageContext.getOut();
			this.chooseMode();
			String yes = localize("chk.yes");
			String no = localize("chk.no");
			String value = getContent();

			// print start tag
			if (this.edit) {
				out.print(editorStart + printEditableContent(value));
			} else {
				out.print(readerStart + value);

			}
			

		} catch (IOException ioe) {
			LOGGER.error("Error in SimpleTag: " + ioe);

		}
		return (SKIP_BODY);
	}

	private String printEditableContent(String value) {
		return "<input value=\"yes\" name=\"" + this.name
				+ "\" class=\"radio-boolean\" type=\"checkbox\" "
				+ ("yes".equals(value) ? "checked=\"checked\" " : "") + " />"
				+ localize("chk.yes") + "<br/><input value=\"no\" name=\""
				+ this.name + "\" class=\"radio-boolean\" type=\"checkbox\" "
				+ ("no".equals(value) ? "checked=\"checked\" " : "") + " />"
				+ localize("chk.no");

	}

	private String getContent() {
		return pageContext.getRequest().getAttribute(this.name) != null ? (String) pageContext
				.getRequest().getAttribute(this.name) : "";
	}

	private String localize(String code) {
		if (this.springContext == null) {
			this.springContext = WebApplicationContextUtils
					.getWebApplicationContext(pageContext.getServletContext());
		}
		if (this.messageSource == null) {
			this.messageSource = (ReloadableResourceBundleMessageSource) springContext
					.getBean("messageSource");
		}
		if (this.localeResolver == null) {
			this.localeResolver = (LocaleResolver) springContext
					.getBean("localeResolver");
		}
		return messageSource.getMessage(code, null, localeResolver
				.resolveLocale((HttpServletRequest) pageContext.getRequest()));

	}

	public int doEndTag() throws JspException {

		try {

			JspWriter out = pageContext.getOut();
			if (this.edit) {
				out.print(YesNoEntry.editorEnd);
			} else {
				out.print(YesNoEntry.readerend);
			}

		} catch (IOException ioe) {
			LOGGER.error("Error in SimpleTag: " + ioe);
		}
		return (SKIP_BODY);
	}

	// setters and getters
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
