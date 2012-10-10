package it.geosolutions.fra2015.webapp.actions;

import it.geosolutions.fra2015.webapp.RequestObject;
import it.geosolutions.fra2015.webapp.ResponseObject;

/**
 *
 * @author francesco
 */
public class IntroductionAction extends AbstractAction {

    @Override
    public ResponseObject call(RequestObject request) {
        ResponseObject ro = getResponseObject("true");
        return ro;
    }
}
