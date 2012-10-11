package it.geosolutions.fra2015.webapp.actions.questions;

import it.geosolutions.fra2015.webapp.actions.AbstractAction;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

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


}
