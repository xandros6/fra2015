package it.geosolutions.fra2015.tags;

import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;

import javax.servlet.jsp.tagext.TagSupport;

public class SurveyEntry extends  ProfiledTag{
	boolean edit ;
	protected void chooseMode(Profile op) {
		switch(op){
		case  CONTRIBUTOR :
			this.edit =true;
			break;
		default:
			this.edit =false;
			break;
		}
			
	}
	protected void chooseMode() {
		Profile op = Utils.getProfile(pageContext);
		chooseMode(op);
			
	}
	
	

}
