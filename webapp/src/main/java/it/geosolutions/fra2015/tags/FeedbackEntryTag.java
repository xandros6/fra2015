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
import it.geosolutions.fra2015.mvc.controller.utils.StatusUtils;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.LocaleResolver;

/**
 * @author DamianoG
 *
 */
public class FeedbackEntryTag extends ModeTag{
    
    private Logger LOGGER = Logger.getLogger(FeedbackEntryTag.class);
    
    private ReloadableResourceBundleMessageSource messageSource;
    private LocaleResolver localeResolver;
    private WebApplicationContext springContext;
    
    
    
    private final static String WRITE_SUFFIX = "b";
    private final static String READ_SUFFIX = "A";
    
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
        case VALIDATOR :
            return (SKIP_BODY);
        case PRINT:
            return (SKIP_BODY);
        default:
            composeError();
            break;
        }
        
        return (SKIP_BODY);
    }
    /**
     * Shows the feedback for the Contributor. 
     * He see only the harmonized feedback of the current round.
     */
    private void composeContributor() {
        
        String value = (String)pageContext.getRequest().getAttribute(feedbackName+"Ed_");
        boolean feedbackIsPresent = (value != null && !StringUtils.isBlank(value));
        if(feedbackIsPresent){
            
                JspWriter out = pageContext.getOut();
                //composeStartfeedbackArea(out);
                // --- use RichTextEntry ----
                RichTextEntry rte = new RichTextEntry();
                rte.setCssClasses("alert alert-error"); 
                rte.setName(feedbackName+"Ed_"/*+READ_SUFFIX*/);
                rte.setPageContext(pageContext);
                rte.forceReadMode();
                rte.doStartTag();
                // -------------------------
                //composeBottomfeedbackArea(out);
            
            
        }
    }
    
   private void composeEditorReadBox() throws IOException {
        
        String value = (String)pageContext.getRequest().getAttribute(feedbackName+"Ed_");
        boolean feedbackIsPresent = (value != null && !StringUtils.isBlank(value));
        if(feedbackIsPresent){
            
                JspWriter out = pageContext.getOut();
                //composeStartfeedbackArea(out);
                // --- use RichTextEntry ----
                out.write("<h5>" +localize("feedback.ChosenForContributor") +"</h5>");
                RichTextEntry rte = new RichTextEntry();
                rte.setCssClasses("alert alert-info"); 
                rte.setName(feedbackName+"Ed_"/*+READ_SUFFIX*/);
                rte.setPageContext(pageContext);
                rte.forceReadMode();
                rte.doStartTag();
                // -------------------------
                //composeBottomfeedbackArea(out);
            
            
        }
    }
    
    /**
     * Reviewer should see:
     * His last feedback + harmonized feedback (read)
     * The current feedback for writing if can edit
     */
    private void composeReviewer() {
        
        try{
            JspWriter out = pageContext.getOut();
            
            //feedbacks to show
            
            composeEditorReadBox();
            if(StatusUtils.isReviewerEditable(getStatus())){
                composeStartfeedbackArea(out);
                composeReviewerSelectBox(out,feedbackName);
                
                // --- use RichTextEntry ----
                RichTextEntry rte2 = new RichTextEntry();
   
                rte2.setName(feedbackName);
                rte2.setPageContext(pageContext);
                rte2.forceWriteMode();
                rte2.doStartTag();
                // -------------------------
                composeBottomfeedbackArea(out);
            }

        }
        catch(IOException e){
            LOGGER.error("Error in FeedbackEntry: " + e);
        }
    }
    /**
     * Review editor should see the feedbacks of current round (maybe also the previous)
     * and his editor if allowed
     */
    private void composeReviewerEditor() {
        
        String value = (String)pageContext.getRequest().getAttribute(feedbackName);
        String valueEd = (String)pageContext.getRequest().getAttribute(feedbackName+"Ed_");
        boolean feedbackIsPresent = (value != null && !StringUtils.isBlank(value))||(valueEd != null && !StringUtils.isBlank(valueEd));
        
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
                if(StatusUtils.isReviewEditorEditable(getStatus())){
                // -------------------------
                    
                   
                    
                    out.print("<br />");
                    out.print("<br />");
                    // --- use RichTextEntry ----
                    RichTextEntry rte2 = new RichTextEntry();
                    //Little Hack: the id are placed in all jsp for all entry... so remove the last '_' for ad the EDITOR suffix
                    rte2.setName(feedbackName+"Ed_"/*+WRITE_SUFFIX*/);
                    rte2.setPageContext(pageContext);
                    rte2.forceWriteMode();
                    rte2.doStartTag();
                }
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
    
    public void composeReviewerSelectBox(JspWriter out, String feedbackName) throws IOException{
        String status = getFeedbackStatus("STATUS"+feedbackName);
        String selectedOK = "";
        String selectedKO = "";
        String selectedNOT = "";
        if(status.equals("ok")){
            selectedOK=" checked ";
        }else if(status.equals("ko")){
            selectedKO=" checked ";
        }else{
            selectedNOT=" checked ";
        }
            
        //out.print("<select name=\"STATUS");
        //out.print(feedbackName);
        //out.print("\">");
        out.print("<div class=\"inline fbstatus\">");
        out.print("<input class=\"radio\" type=\"radio\" name=\"STATUS" + feedbackName + "\" value=\"ok\" ");
        out.print(selectedOK);
        out.print(">");        
        out.print(localize("feedback.revisionedok"));
        out.print("</input> ");
        out.print("<input class=\"radio\" type=\"radio\"  name=\"STATUS" + feedbackName + "\" value=\"ko\" ");
        out.print(selectedKO);
        out.print(">");
        out.print(localize("feedback.revisionedko"));
        out.print("</input> ");
        out.print("<input class=\"radio\" type=\"radio\"  name=\"STATUS" + feedbackName + "\" value=\"not\" ");
        out.print(selectedNOT);
        out.print(">");
        out.print(localize("feedback.notrevisioned"));
        out.print("</input> ");
        out.print("</div>");
    }
    
    public void composeStartfeedbackArea(JspWriter out) throws IOException{
        out.print("<div class=\"well feedback-block\">");
        
        out.print("<h4>");
        out.print(localize("feedback.title"));
        out.print("</h4>");
    }
    
    public static void composeBottomfeedbackArea(JspWriter out) throws IOException{
        out.print("</div>");
        
    }
    
    private String localize(String code) {
        if (this.springContext == null) {
            this.springContext = WebApplicationContextUtils.getWebApplicationContext(pageContext
                    .getServletContext());
        }
        if (this.messageSource == null) {
            this.messageSource = (ReloadableResourceBundleMessageSource) springContext
                    .getBean("messageSource");
        }
        if (this.localeResolver == null) {
            this.localeResolver = (LocaleResolver) springContext.getBean("localeResolver");
        }
        return messageSource.getMessage(code, null,
                localeResolver.resolveLocale((HttpServletRequest) pageContext.getRequest()));

    }
    
    private String getFeedbackStatus(String name) {
        if (pageContext.getRequest().getAttribute(name) != null) {
            return (String) pageContext.getRequest().getAttribute(name);
        } else {
            return "";
        }
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
    protected void chooseMode(Profile op,String sc) {
        throw new UnsupportedOperationException("Not implemented yet");
    }

    
    @Override
    protected void chooseMode() {
        throw new UnsupportedOperationException("Not implemented yet");
    }
    
    private String getValue(PageContext pageContext,String name) {
        if (pageContext.getRequest().getAttribute(name) != null) {
                return  (String) pageContext.getRequest().getAttribute(
                                name);
        }else{
                return "";
        }
        
}
}
