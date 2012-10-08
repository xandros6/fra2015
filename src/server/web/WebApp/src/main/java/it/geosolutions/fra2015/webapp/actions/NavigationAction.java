package it.geosolutions.fra2015.webapp.actions;

import com.lidlesslabs.enterprise.RequestObject;
import com.lidlesslabs.enterprise.ResponseObject;

/**
 *
 * @author francesco
 */
public class NavigationAction extends AbstractAction {

    @Override
    public ResponseObject call(RequestObject request) {
        String section = request.getString("section");
        ResponseObject ro = this.getResponseObject(section);
        return ro;
    }
}
