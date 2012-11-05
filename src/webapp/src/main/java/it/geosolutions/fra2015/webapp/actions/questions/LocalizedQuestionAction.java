package it.geosolutions.fra2015.webapp.actions.questions;

import it.geosolutions.fra2015.webapp.LocalizationBundle;
import it.geosolutions.fra2015.webapp.RequestObject;
import it.geosolutions.fra2015.webapp.ResponseObject;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

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

                Logger log = Logger.getLogger(Question1Action.class.getName());

                log.trace("resource strings");

                for (String key : strings.keySet()) {
                    log.trace("\t" + key + "=" + strings.getString(key));
                }
            }

            ro.getResponseMap().put("strings", strings);

        } catch (Exception e) {
            Logger.getLogger(Question1Action.class.getName()).log(Level.ERROR, "missing bundle", e);
        }

        // carico le risorse di sezione

        try {

            LocalizationBundle cats = getLocalizationBundle("section");

            if (debug) {

                Logger log = Logger.getLogger(Question1Action.class.getName());


                log.trace("resource section");

                for (String key : cats.keySet()) {
                    log.trace("\t" + key + "=" + cats.getString(key));
                }
            }

            ro.getResponseMap().put("sectionBundle", cats);

        } catch (Exception e) {
            Logger.getLogger(Question1Action.class.getName()).log(Level.ERROR, "missing bundle", e);
        }

        // carico le risorse di domanda

        try {

            LocalizationBundle cats = getLocalizationBundle("question" + question);

            if (debug) {

                Logger log = Logger.getLogger(Question1Action.class.getName());

                log.trace("resource question" + question);

                for (String key : cats.keySet()) {
                    log.trace("\t" + key + "=" + cats.getString(key));
                }
            }

            ro.getResponseMap().put("questionBundle", cats);

        } catch (Exception e) {
            Logger.getLogger(Question1Action.class.getName()).log(Level.ERROR, "missing bundle", e);
        }

    }
}
