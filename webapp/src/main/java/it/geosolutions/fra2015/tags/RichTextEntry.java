package it.geosolutions.fra2015.tags;

import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.log4j.Logger;

/**
 * Tag that shows a editable text area when the user in session has the role
 * contained in editor attribute, and a div if it has not.
 * 
 * @author Lorenzo Natali
 */
@SuppressWarnings("serial")
public class RichTextEntry extends SurveyEntry {
Logger LOGGER = Logger.getLogger(this.getClass());


private static String editorEnd = "</textarea>";

private static String readerend = "</div>";

private String name;

private String cols = "160";

private String rows = "10";

private String cssClasses;

private String editor = "contributor";

private String operation;

public String getOperation() {
    return operation;
}

public void setOperation(String operation) {
    this.operation = operation;
}

public int doStartTag() {
    JspWriter out = pageContext.getOut();
    try {

        this.chooseMode();
        // get value
        String value = this.getValue(pageContext);
        // print start tag
        if (this.edit) {
            out.print(editorStart() + this.name + "'>" + value);
            out.print(RichTextEntry.editorEnd);
        } else {
            out.print(readerStart() + this.name + "'>" + value);
            out.print(RichTextEntry.readerend);
        }

    } catch (IOException ioe) {
        LOGGER.error("Error in RichEntryTag: " + ioe);
    }
    return (SKIP_BODY);
}

private String readerStart() {
     return "<div class='entry-item richtext richtext-read "+ this.cssClasses +"' id='";

}

public String getCssClasses() {
    return cssClasses;
}

public void setCssClasses(String cssClasses) {
    this.cssClasses = cssClasses;
}

private String editorStart() {
    return "<textarea class='texteditor entry-item " + this.cssClasses + "'"
            + " cols='" + this.cols + "' rows='" + this.rows + " ' name='";

}

private String getValue(PageContext pageContext) {
    if (pageContext.getRequest().getAttribute(this.name) != null) {
        return (String) pageContext.getRequest().getAttribute(this.name);
    } else {
        return "";
    }

}

public void setCols(String cols) {
    this.cols = cols;
}

public String getCols() {
    return this.cols;
}

public void setRows(String rows) {
    this.rows = rows;
}

public String getRows() {
    return this.rows;
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
