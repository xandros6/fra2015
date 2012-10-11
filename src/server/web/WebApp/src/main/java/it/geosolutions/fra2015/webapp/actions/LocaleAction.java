/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.webapp.actions;

import it.geosolutions.fra2015.webapp.RequestObject;
import it.geosolutions.fra2015.webapp.ResponseObject;
import java.util.Locale;

/**
 *
 * @author francesco
 */
public class LocaleAction extends AbstractAction {

    @Override
    public ResponseObject call(RequestObject request) {
        String language = request.getString("language");
        String country = request.getString("country");

        Locale locale = Locale.forLanguageTag(language );

        System.out.println("looking for " + language );

        ResponseObject ro;

        if (locale != null) {

            System.out.println("locale found:" + locale.getLanguage());

            Locale.setDefault(locale);

            ro = getResponseObject("true");

        } else {
            ro = getResponseObject("false");
        }

        ro.getSessionMap().put("locale", locale);

        return ro;

    }
}
