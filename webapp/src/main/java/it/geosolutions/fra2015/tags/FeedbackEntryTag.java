/*
 *  fra2015
 *  https://github.com/geosolutions-it/fra2015
 *  Copyright (C) 2007-2012 GeoSolutions S.A.S.
 *  http://www.geo-solutions.it
 *
 *  GPLv3 + Classpath exception
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package it.geosolutions.fra2015.tags;

import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

import org.apache.log4j.Logger;

import sun.reflect.generics.reflectiveObjects.NotImplementedException;

/**
 * @author DamianoG
 *
 */
public class FeedbackEntryTag extends ProfiledTag{
    
    Logger LOGGER = Logger.getLogger(FeedbackEntryTag.class);
    
    private final static String WRITE_SUFFIX = "b";
    private final static String READ_SUFFIX = "A";
    private final static String EDITOR = "Ed";
    
    private String feedbackName;
    
    public int doStartTag() {
        
        switch(getProfile()){
        case  CONTRIBUTOR :
            composeContributor();
            break;
        case  REVIEWER :
            composeReviewer();
            break;
        case  EDITOR :
            composeReviewerEditor();
            break;
        default:
            composeError();
            break;
        }
        
        return (SKIP_BODY);
    }
    
    private void composeContributor() {
        
        StringBuffer feedbackID = new StringBuffer();
        boolean feedbackIsPresent = true; //TODO take from request if feedback is present
        if(feedbackIsPresent){
            try{
                JspWriter out = pageContext.getOut();
                composeStartfeedbackArea(out);
                // --- use RichTextEntry ----
                RichTextEntry rte = new RichTextEntry();
                rte.setName(feedbackName+READ_SUFFIX);
                rte.setPageContext(pageContext);
                rte.forceReadMode();
                rte.doStartTag();
                // -------------------------
                composeBottomfeedbackArea(out);
            }
            catch(IOException e){
                LOGGER.error("Error in FeedbackEntry: " + e);
            }
        }
    }
    
    private void composeReviewer() {
        
        StringBuffer feedbackID = new StringBuffer();
        
        try{
            JspWriter out = pageContext.getOut();
            composeStartfeedbackArea(out);
            // --- use RichTextEntry ----
            RichTextEntry rte2 = new RichTextEntry();
//            +WRITE_SUFFIX
            rte2.setName(feedbackName);
            rte2.setPageContext(pageContext);
            rte2.forceWriteMode();
            rte2.doStartTag();
            // -------------------------
            composeBottomfeedbackArea(out);
        }
        catch(IOException e){
            LOGGER.error("Error in FeedbackEntry: " + e);
        }
    }
    
    private void composeReviewerEditor() {
        
        StringBuffer feedbackID = new StringBuffer();
        boolean feedbackIsPresent = true; //TODO take from request if feedback is present
        
        if(feedbackIsPresent){
            try{
                JspWriter out = pageContext.getOut();
                composeStartfeedbackArea(out);
                // --- use RichTextEntry ----
                RichTextEntry rte = new RichTextEntry();
                rte.setName(feedbackName/*+READ_SUFFIX*/);
                rte.setPageContext(pageContext);
                rte.forceReadMode();
                rte.doStartTag();
                // -------------------------
                out.print("<br />");
                
                out.print("<div class=\"control pull-right btn btn-mini\"><a href=\"#\" >Copy the reviewer text</a></div>");
                
                out.print("<br />");
                out.print("<br />");
                // --- use RichTextEntry ----
                RichTextEntry rte2 = new RichTextEntry();
                //Little Hack: the id are placed in all jsp for all entry... so remove the last '_' for ad the EDITOR suffix
                rte2.setName(feedbackName.substring(0, feedbackName.length()-1)+EDITOR+"_"/*+WRITE_SUFFIX*/);
                rte2.setPageContext(pageContext);
                rte2.forceWriteMode();
                rte2.doStartTag();
                // -------------------------
                composeBottomfeedbackArea(out);
            }
            catch(IOException e){
                LOGGER.error("Error in FeedbackEntry: " + e);
            }
        }
    }

    private void composeError(){
        
            StringBuffer feedbackID = new StringBuffer();
            try{
                JspWriter out = pageContext.getOut();
                out.print("<p><b>Something happened wrong or this is a feedback field that is not yet full supported...</b></p>");
            }
            catch(IOException e){
                LOGGER.error("Error in FeedbackEntry: " + e);
            }
    }
    
    public static void composeStartfeedbackArea(JspWriter out) throws IOException{
        out.print("<br />");
        out.print("<hr /\">");
        out.print("<div\">");
        out.print("<h3>Feedback</h3>");
    }
    
    public static void composeBottomfeedbackArea(JspWriter out) throws IOException{
        out.print("<br />");
        out.print("<hr /\">");
        out.print("<div\">");
        out.print("<br />");
    }
    
    /**
     * @return the feedback
     */
    public String getFeedbackName() {
        return feedbackName;
    }

    /**
     * @param feedback the feedback to set
     */
    public void setFeedbackName(String feedback) {
        this.feedbackName = feedback;
    }

    @Override
    protected void chooseMode(Profile op) {
        throw new NotImplementedException();
    }

    
    @Override
    protected void chooseMode() {
        throw new NotImplementedException();
    }
    
}
