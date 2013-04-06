package it.geosolutions.fra2015.tags;

import javax.servlet.jsp.tagext.TagSupport;

import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;

public abstract class ModeTag extends TagSupport{
	abstract protected void chooseMode(Profile op,String sc);
	protected void chooseMode(){
	    chooseMode(getProfile(),getStatus());
	}
	
	protected Profile getProfile() {
	    return Utils.getProfile(pageContext);
	}
	protected String getStatus(){
	    return Utils.getStatus(pageContext);
	}

}
