package it.geosolutions.fra2015.tags;

import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;

public class SurveyEntry extends ProfiledTag {

    boolean edit;
    private boolean modeForced = false;
 
    @Override
    protected void chooseMode(Profile op) {
        
        if(modeForced){
            return;
        }
        switch (op) {
        case CONTRIBUTOR:
            this.edit = true;
            break;
        default:
            this.edit = false;
            break;
        }

    }

    /**
     *  The default choose edit mode strategy: extract that information from the context
     *  NOTE: if the modeForced == true this method has no effect until resetMode() method is called.    
     */
    @Override
    protected void chooseMode() {

        chooseMode(getProfile());
    }
    
    // each tag that extends SurveyEntry has only the possibility to set the mode from the context.
    // using the tag directly from java the user has another strategy:
    // these Methods allow the user to force the value from the outside.
    public void forceWriteMode(){
        edit = true;
        modeForced = true;
    }
    public void forceReadMode(){
        edit = false;
        modeForced = true;
    }
    public void resetMode(){
        edit = false;
        modeForced = false;
    }
    public boolean isForced(){
        return modeForced;
    }

}
