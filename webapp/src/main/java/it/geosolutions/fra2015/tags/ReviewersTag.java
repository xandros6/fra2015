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

import it.geosolutions.fra2015.server.model.user.User;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.log4j.Logger;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.LocaleResolver;

/**
 * @author DamianoG
 * 
 */
public class ReviewersTag extends TagSupport {

    Logger LOGGER = Logger.getLogger(ReviewersTag.class);
    
    private ReloadableResourceBundleMessageSource messageSource;
    private LocaleResolver localeResolver;
    private WebApplicationContext springContext;

    public int doStartTag() {
        
        if(pageContext.getRequest().getAttribute("reviewers") != null){
            JspWriter out = pageContext.getOut();
            try {
                List<User> list = (List<User>) pageContext.getRequest().getAttribute("reviewers");
                out.print("<h5>");
                out.print(localize("reviewers.title"));
                out.print("</h5>");
                out.print("<div class=\"alert alert-info\">");
                for (User el : list) {
    
                    out.print(el.getUsername());
                    out.print("(");
                    out.print(el.getName());
                    out.print(") ");
                }
                if(list.isEmpty()){
                    
                    out.print(localize("reviewers.empty"));
                }
                out.print("</div>");
            } catch (IOException ioe) {
                LOGGER.error("Error in FeedbacksTag: " + ioe);
            }
        }
        return (SKIP_BODY);
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
}
