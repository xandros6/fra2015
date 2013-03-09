package it.geosolutions.fra2015.tags;

import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;

import javax.servlet.jsp.PageContext;

public class Utils {
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
		String profstring = (String) pageContext.getRequest().getAttribute("profile");
		return validateProfile(profstring);
		
	}
	
}
