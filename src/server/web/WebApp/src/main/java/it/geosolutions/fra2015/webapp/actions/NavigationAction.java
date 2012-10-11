package it.geosolutions.fra2015.webapp.actions;

import it.geosolutions.fra2015.webapp.RequestObject;
import it.geosolutions.fra2015.webapp.ResponseObject;

/**
 *
 * @author francesco
 */
public class NavigationAction extends AbstractAction {

    @Override
    public ResponseObject call(RequestObject request) {
        String section = request.getString("section");
        ResponseObject ro = this.getResponseObject(section);

        ro.getResponseMap().put("forests", getResourceBundle("forests"));


        return ro;
    }
}
