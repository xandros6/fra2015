package it.geosolutions.fra2015.tags;

import it.geosolutions.fra2015.mvc.controller.utils.StatusUtils;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;
import it.geosolutions.fra2015.server.model.survey.Status;

import javax.servlet.jsp.PageContext;

public class Utils {
    private static String PROFILE = "profile";
    private static String STATUSCODE ="statuscode"; 
    private static String STATUS ="status"; 
	static Profile validateProfile(String profile) {

		Profile prof = null;
		if (profile == null || profile.isEmpty()) {
			return Profile.PRINT;
		}
		try {
			prof = Profile.valueOf(profile);
		} catch (Exception e) {
			return null;
		}
		return prof;
	}
	static Profile getProfile(PageContext pageContext){
		String profstring = (String) pageContext.getRequest().getAttribute(PROFILE);
		return validateProfile(profstring);
		
	}
	static String getStatusCode(PageContext pageContext){
	    String statuscode = (String) pageContext.getRequest().getAttribute(STATUS);
            return statuscode;
	}
    public static String getStatus(PageContext pageContext) {
        return (String) pageContext.getRequest().getAttribute(STATUS);
        
    }
	
}
