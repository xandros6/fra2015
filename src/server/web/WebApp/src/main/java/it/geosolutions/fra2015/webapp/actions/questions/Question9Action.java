package it.geosolutions.fra2015.webapp.actions.questions;

import it.geosolutions.fra2015.webapp.LocalizationBundle;
import it.geosolutions.fra2015.webapp.RequestObject;
import it.geosolutions.fra2015.webapp.ResponseObject;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author francesco
 */
public class Question9Action extends AbstractQuestionAction {

    public Question9Action() {
        super(1, 1);
    }

    @Override
    public ResponseObject call(RequestObject request) {

        ResponseObject ro = this.getResponseObject("s1q2");

        try {
            
            LocalizationBundle strings = getLocalizationBundle("strings");
            System.out.println("resource strings");

            for (String key : strings.keySet()) {
                System.out.println("\t"+key + "=" + strings.getString(key));
            }

            ro.getResponseMap().put("strings", strings);
            Logger.getLogger(Question9Action.class.getName()).log(Level.INFO, "string resource bundle loaded");
        } catch (Exception e) {
            Logger.getLogger(Question9Action.class.getName()).log(Level.SEVERE, "invalid bundle", e);
        }


        try {
            System.out.println("resource fra2015categories");
            
            LocalizationBundle cats = getLocalizationBundle("fra2015categories");

            for (String key : cats.keySet()) {
                System.out.println("\t"+key + "=" + cats.getString(key));
            }
            ro.getResponseMap().put("categories", cats);
            Logger.getLogger(Question9Action.class.getName()).log(Level.INFO, "fra2015categories resource bundle loaded");
        } catch (Exception e) {
            Logger.getLogger(Question9Action.class.getName()).log(Level.SEVERE, "invalid bundle", e);
        }

        try {
            System.out.println("resource forests");
            LocalizationBundle cats = getLocalizationBundle("forests");

            for (String key : cats.keySet()) {
                System.out.println("\t"+key + "=" + cats.getString(key));
            }
            ro.getResponseMap().put("forests", cats);
            Logger.getLogger(Question9Action.class.getName()).log(Level.INFO, "forests resource bundle loaded");
        } catch (Exception e) {
            Logger.getLogger(Question9Action.class.getName()).log(Level.SEVERE, "invalid bundle", e);
        }

        return ro;
    }
}
