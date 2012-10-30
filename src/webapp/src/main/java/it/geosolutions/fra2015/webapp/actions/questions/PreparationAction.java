package it.geosolutions.fra2015.webapp.actions.questions;

import it.geosolutions.fra2015.webapp.ResponseObject;

/**
 *
 * @author francesco
 */
public class PreparationAction extends LocalizedQuestionAction {

    private final boolean debug = true;

    public PreparationAction() {
        super(1, 0);
    }

    @Override
    protected ResponseObject getResponseObject() {
        ResponseObject ro = getResponseObject("introduction");
        ro.getResponseMap().put("section", section);
        ro.getResponseMap().put("question", question);
        return ro;
    }

}
