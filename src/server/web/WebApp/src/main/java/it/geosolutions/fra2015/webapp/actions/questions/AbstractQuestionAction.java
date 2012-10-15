package it.geosolutions.fra2015.webapp.actions.questions;

import it.geosolutions.fra2015.webapp.ResponseObject;
import it.geosolutions.fra2015.webapp.actions.AbstractAction;

/**
 *
 * @author francesco
 */
public abstract class AbstractQuestionAction extends AbstractAction {

    protected int section;
    protected int question;

    public AbstractQuestionAction(int section, int question) {
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
