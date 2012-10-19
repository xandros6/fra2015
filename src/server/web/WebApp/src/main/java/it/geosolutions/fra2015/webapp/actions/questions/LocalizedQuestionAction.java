package it.geosolutions.fra2015.webapp.actions.questions;

import it.geosolutions.fra2015.webapp.LocalizationBundle;
import it.geosolutions.fra2015.webapp.RequestObject;
import it.geosolutions.fra2015.webapp.ResponseObject;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Francesco Rogo <f.rogo@computernopanic.com>
 * @date $(time)
 */
public class LocalizedQuestionAction extends AbstractQuestionAction {

    private final boolean debug = false;

    public LocalizedQuestionAction(int section, int question) {
        super(section, question);
    }

    @Override
    public ResponseObject privilegedCall(RequestObject request) {

        ResponseObject ro = this.getResponseObject();

        loadResources(ro);

        return ro;
    }

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

        // carico le risorse di domanda

        try {

            LocalizationBundle cats = getLocalizationBundle("question" + question);

            if (debug) {
                System.out.println("resource question" + question);

                for (String key : cats.keySet()) {
                    System.out.println("\t" + key + "=" + cats.getString(key));
                }
            }

            ro.getResponseMap().put("questionBundle", cats);

        } catch (Exception e) {
            Logger.getLogger(Question1Action.class.getName()).log(Level.SEVERE, "missing bundle", e);
        }

    }
}
