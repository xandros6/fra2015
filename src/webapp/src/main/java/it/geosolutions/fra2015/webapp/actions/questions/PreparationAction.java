package it.geosolutions.fra2015.webapp.actions.questions;

import it.geosolutions.fra2015.webapp.LocalizationBundle;
import it.geosolutions.fra2015.webapp.ResponseObject;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author francesco
 */
public class PreparationAction extends LocalizedQuestionAction {

    private final boolean debug = true;

    public PreparationAction() {
        super(1, 1);
    }

    protected ResponseObject getResponseObject() {
        ResponseObject ro = getResponseObject("introduction");
        ro.getResponseMap().put("section", section);
        ro.getResponseMap().put("question", question);
        return ro;
    }

    @Override
    protected void loadResources(ResponseObject ro) {

        // carico le risorse comuni

        try {
            LocalizationBundle strings = getLocalizationBundle("strings");
            if (debug) {
                System.out.println("resource strings");

                for (String key : strings.keySet()) {
                    System.out.println("\t" + key + "=" + strings.getString(key));
                }
            }

            ro.getResponseMap().put("strings", strings);

        } catch (Exception e) {
            Logger.getLogger(Question1Action.class.getName()).log(Level.SEVERE, "missing bundle", e);
        }

        // carico le risorse di sezione

        try {

            LocalizationBundle cats = getLocalizationBundle("section" + section);

            if (debug) {
                System.out.println("resource section" + section);

                for (String key : cats.keySet()) {
                    System.out.println("\t" + key + "=" + cats.getString(key));
                }
            }

            ro.getResponseMap().put("sectionBundle", cats);

        } catch (Exception e) {
            Logger.getLogger(Question1Action.class.getName()).log(Level.SEVERE, "missing bundle", e);
        }

    }
}
