package it.geosolutions.fra2015.webapp.actions;

import it.geosolutions.fra2015.webapp.RequestObject;
import it.geosolutions.fra2015.webapp.ResponseObject;

/**
 *
 * @author francesco
 */
public class MessageAction extends AbstractAction {

    @Override
    public ResponseObject call(RequestObject request) {
        ResponseObject ro = getResponseObject("message");
        return ro;
    }
    
}
