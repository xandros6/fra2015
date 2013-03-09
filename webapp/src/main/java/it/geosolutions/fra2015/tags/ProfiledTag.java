package it.geosolutions.fra2015.tags;

import javax.servlet.jsp.tagext.TagSupport;

import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;

public abstract class ProfiledTag extends TagSupport{
	abstract protected void chooseMode(Profile op);
	abstract protected void chooseMode();
	

}
