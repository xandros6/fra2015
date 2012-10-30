package it.geosolutions.fra2015.webapp.actions.questions;

import it.geosolutions.fra2015.server.model.enums.UserGroup;
import it.geosolutions.fra2015.webapp.ResponseObject;
import it.geosolutions.fra2015.webapp.actions.AbstractPrivilegedAction;

/**
 *
 * @author francesco
 */
public abstract class AbstractQuestionAction extends AbstractPrivilegedAction {

    protected int section;
    protected int question;

    public AbstractQuestionAction(int section, int question) {
        super(UserGroup.USER);
        this.section = section;
        this.question = question;
    }

    public int getSection() {
        return section;
    }

    public int getQuestion() {
        return question;
    }


    protected ResponseObject getResponseObject() {
        ResponseObject ro = getResponseObject("s" + section + "q" + question);
        ro.getResponseMap().put("section", section);
        ro.getResponseMap().put("question", question);
        return ro;
    }

}
