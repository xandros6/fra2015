package it.geosolutions.fra2015.webapp.actions.questions;

import it.geosolutions.fra2015.webapp.RequestObject;
import it.geosolutions.fra2015.webapp.ResponseObject;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author francesco
 */
public class Question1Action extends AbstractQuestionAction {

    public Question1Action() {
        super(1, 1);
    }

    @Override
    public ResponseObject call(RequestObject request) {

        ResponseObject ro = this.getResponseObject("s1q1");

        try {
            ResourceBundle strings = getResourceBundle("strings");

            for (String key : strings.keySet()) {
                System.out.println(key + "=" + strings.getString(key));
            }

            ro.getResponseMap().put("strings", strings);
            Logger.getLogger(Question1Action.class.getName()).log(Level.INFO, "string resource bundle loaded");
        } catch (Exception e) {
            Logger.getLogger(Question1Action.class.getName()).log(Level.SEVERE, "invalid bundle", e);
        }


        try {
            ResourceBundle cats = getResourceBundle("fra2015categories");

            for (String key : cats.keySet()) {
                System.out.println(key + "=" + cats.getString(key));
            }
            ro.getResponseMap().put("categories", cats);
            Logger.getLogger(Question1Action.class.getName()).log(Level.INFO, "fra2015categories resource bundle loaded");
        } catch (Exception e) {
            Logger.getLogger(Question1Action.class.getName()).log(Level.SEVERE, "invalid bundle", e);
        }

        return ro;
    }
}
