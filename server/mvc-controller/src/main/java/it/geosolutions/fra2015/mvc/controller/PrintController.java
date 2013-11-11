/*
 *  fra2015
 *  https://github.com/geosolutions-it/fra2015
 *  Copyright (C) 2007-2013 GeoSolutions S.A.S.
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
package it.geosolutions.fra2015.mvc.controller;

import it.geosolutions.fra2015.mvc.controller.utils.CharArrayWriterResponse;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices;
import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;
import it.geosolutions.fra2015.mvc.controller.utils.FeedbackHandler;
import it.geosolutions.fra2015.mvc.view.MyReloadableResourceBundleMessageSource;
import it.geosolutions.fra2015.server.model.survey.Feedback;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.FeedbackService;
import it.geosolutions.fra2015.services.SurveyService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.InternalErrorServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;

import java.io.File;
import java.io.StringReader;
import java.io.StringWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.commons.beanutils.BeanPropertyValueEqualsPredicate;
import org.apache.commons.collections.CollectionUtils;
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;
import org.apache.log4j.Logger;
import org.htmlcleaner.CleanerProperties;
import org.htmlcleaner.HtmlCleaner;
import org.htmlcleaner.PrettyXmlSerializer;
import org.htmlcleaner.TagNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author DamianoG
 * 
 */
@Controller
public class PrintController {

	@Autowired
	private ControllerServices utils;

	@Autowired
	private SurveyService surveyService;

	@Autowired
	private MyReloadableResourceBundleMessageSource messageSource;

	@Autowired
	private FeedbackService feedbackService;
	
	@Autowired
	private ServletContext servletContext;

	Logger LOGGER = Logger.getLogger(PrintController.class);

	@RequestMapping(value = "/survey/print/{country}/{mode}", method = RequestMethod.GET)
	public String printWelcome(@PathVariable(value = "country") String country, @PathVariable(value = "mode") String mode, Model model,
			HttpSession session,  Locale locale) throws IllegalArgumentException, InternalErrorServiceEx, NotFoundServiceEx{

		User su = (User) session.getAttribute("sessionUser");

		//Check if user have this country
		if(!su.getName().equals("admin")){
			BeanPropertyValueEqualsPredicate predicate = new BeanPropertyValueEqualsPredicate( "iso3", country );
			if(CollectionUtils.find( su.getCountriesSet(), predicate ) == null){
				throw new IllegalArgumentException("Permission denied for country: " + country);
			}
		}

		DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");

		Set<Object> messageKeys = messageSource.getKeys(locale);

		String countryName = surveyService.findCountryByISO3(country).getName();

		model.addAttribute("context", "survey");    
		model.addAttribute("country", countryName);  
		model.addAttribute("messageKeys", messageKeys);   

		model.addAttribute("userName", su!=null?su.getUsername().toUpperCase():"");    
		model.addAttribute("currentDate", df.format(new java.util.Date()));    

		model.addAttribute("profile", ControllerServices.Profile.PRINT.toString());

		FeedbackHandler fh = new FeedbackHandler(utils, feedbackService);
		List<Feedback> listF = new ArrayList<Feedback>(0);

		if(su!= null && su.getRole() != null){
			if(su.getRole().equalsIgnoreCase(Profile.REVIEWER.toString())){
				try{
					model.addAttribute("profile", ControllerServices.Profile.PRINT_CON_FEEDBACK_REVIEWER.toString());
					model.addAttribute("profileName","REVIEWER");
					listF = fh.retrieveAllFeedbacks(country, session, su);
				} catch (BadRequestServiceEx e) {
					LOGGER.error(e.getMessage(), e);
				}
			}
			if(su.getRole().equalsIgnoreCase(Profile.EDITOR.toString())){
				try{
					model.addAttribute("profile", ControllerServices.Profile.PRINT_CON_FEEDBACK_EDITOR.toString());
					model.addAttribute("profileName","EDITOR");
					listF = fh.retrieveAllFeedbacks(country, session, null);
				} catch (BadRequestServiceEx e) {
					LOGGER.error(e.getMessage(), e);
				}
			}
		}

		if(mode.equalsIgnoreCase("allschema")){
			utils.prepareHTTPRequestOnlyVariablesName(model, country); 
			return "survey/printPage";
		}
		else if(mode.equalsIgnoreCase("onlyvalues") || mode.equalsIgnoreCase("onlyvalues_feedback")){

			utils.prepareEmptyElement(model, null, country, false, listF);

			utils.prepareHTTPRequest(model, null, utils.retrieveValues(null, country), false);
		}
		else if(mode.equalsIgnoreCase("onlynames")){

			utils.prepareHTTPRequest(model, null, utils.retrieveValues(null, country), true);
		}
		else{
			throw new IllegalArgumentException("the mode: '" + mode + "' doesn't exist, valid ones are 'allschema', 'onlyvalues', 'onlyvalues_feedback' and 'onlynames'");
		}

		if(!listF.isEmpty() && mode.equalsIgnoreCase("onlyvalues_feedback")){
			listF = fh.packageFeedbacks(listF, true, utils.getStatusInstanceByCountry(country));
			model.addAttribute("feedbackCount",fh.getFeedbackCounter(country, session, true));
			fh.prepareFeedbackModel(model, listF);
		}
		return "survey/print";

	}

	@RequestMapping(value = "/survey/print/pdf/{country}/feedback", method = RequestMethod.GET)
	public void printPdf(@PathVariable(value = "country") String country, Model model,
			HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws IllegalArgumentException, InternalErrorServiceEx{
		try {
			User su = (User) session.getAttribute("sessionUser");

			String template = "/survey/print/"+country+"/onlyvalues_feedback";
			CharArrayWriterResponse customResponse = new CharArrayWriterResponse(resp);
			req.getRequestDispatcher(template).include(req, customResponse);
			String xml = customResponse.getOutput();

			ServletOutputStream out = resp.getOutputStream();
			try {
				String requestUrl = req.getRequestURL().toString();
				FopFactory fopFactory = FopFactory.newInstance();
				
				String appPath = servletContext.getRealPath(""); //root of web app
				fopFactory.setBaseURL(appPath);		
				
				FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
				fopFactory.setBaseURL(requestUrl);
				Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);

				TransformerFactory factory = new net.sf.saxon.TransformerFactoryImpl();
				String xslFilename = "/WEB-INF/xsl/feedbackReport.xsl" ;

				String pathname =servletContext.getRealPath(xslFilename); 
				Source xslt = new StreamSource(pathname);
				Transformer transformer = factory.newTransformer(xslt);
				transformer.setParameter("versionParam", "2.0");
				
				StringReader xmlReader = new StringReader(cleanXml(xml));
				Source src = new StreamSource(xmlReader);
				String filename =  "FRA_2015_Feedback_Report_"+ country.replace(" ","_") + "_"+su.getUsername()+".pdf";

				resp.setContentType(MimeConstants.MIME_PDF);
				resp.setHeader("Content-Disposition", "attachment ; filename=\"" + filename +"\"");

				Cookie cookie = new Cookie("fileDownload", "true");
				cookie.setPath("/");
				cookie.setMaxAge(-1);
				resp.addCookie(cookie);

				Result res = new SAXResult(fop.getDefaultHandler());
				transformer.transform(src, res);

			} finally {
				out.close();
			}

		} catch (Throwable e) {
			LOGGER.error(e.getMessage(), e);
		}

	}

	@RequestMapping(value = "/survey/print/pdf/{country}/{type}", method = RequestMethod.GET)
	public void printPdf(@PathVariable(value = "country") String country, @PathVariable(value = "type") String type, Model model,
			HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws IllegalArgumentException, InternalErrorServiceEx{

		if(!type.equalsIgnoreCase("cfrq") && !type.equalsIgnoreCase("full")){
			throw new IllegalArgumentException("the type: '" + type + "' doesn't exist, valid ones are 'full', 'cfrq'");         
		}

		try {
			String template = "/survey/print/"+country+"/onlyvalues";
			CharArrayWriterResponse customResponse = new CharArrayWriterResponse(resp);
			req.getRequestDispatcher(template).include(req, customResponse);
			String xml = customResponse.getOutput();

			FopFactory fopFactory = FopFactory.newInstance();

			String appPath = servletContext.getRealPath(""); //root of web app
			fopFactory.setBaseURL(appPath);			
			
			FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
			ServletOutputStream out = null;

			try {

				out = resp.getOutputStream();
				resp.setContentType(MimeConstants.MIME_PDF);

				// Construct fop with desired output format
				Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);

				TransformerFactory factory = new net.sf.saxon.TransformerFactoryImpl();

				String xslFilename = "/WEB-INF/xsl/countryReport.xsl" ;
				String pathname =servletContext.getRealPath(xslFilename); 

				Source xslt = new StreamSource(pathname);
				Transformer transformer = factory.newTransformer(xslt);
				transformer.setParameter("versionParam", "2.0");

				StringReader xmlReader = new StringReader(cleanXml(xml));
				Source src = new StreamSource(xmlReader);

				String title =  "FRA_2015_Country_Report_";

				if(type.equals("cfrq")){
					StringWriter xmlOutWriter = new StringWriter();				
					String cfrqFilterFilename = "/WEB-INF/xsl/cfrqFilter.xsl" ;
					String cfrqFilterPathname = servletContext.getRealPath(cfrqFilterFilename); 					
					Source cfrqXslt = new StreamSource(new File(cfrqFilterPathname));			
					StreamResult xmlResult = new StreamResult(xmlOutWriter);
					Transformer cfraFilter = factory.newTransformer(cfrqXslt);
					cfraFilter.setParameter("versionParam", "2.0");
					cfraFilter.transform(src, xmlResult);
					src = new StreamSource(new StringReader(cleanXml(xmlOutWriter.toString())));
					title = title + "CFRQ_";
				}
				String filename = title + country.replace(" ","_") + ".pdf";
				resp.setHeader("Content-Disposition", "attachment ; filename=\"" + filename +"\"");
				Cookie cookie = new Cookie("fileDownload", "true");
				cookie.setPath("/");
				cookie.setMaxAge(-1);
				resp.addCookie(cookie);

				Result res = new SAXResult(fop.getDefaultHandler());

				transformer.transform(src, res);

			} finally {
				out.close();
			}

		} catch (Throwable e) {
			LOGGER.error(e.getMessage(), e);
		}

	}

	private String cleanXml(String sourceXml){
		CleanerProperties props = new CleanerProperties();			 
		// set some properties to non-default values
		props.setTranslateSpecialEntities(true);
		props.setTransResCharsToNCR(true);
		props.setOmitComments(true);
		props.setAdvancedXmlEscape(true);
		props.setTranslateSpecialEntities(true);
		props.setTransSpecialEntitiesToNCR(true);

		// do parsing
		TagNode tagNode = new HtmlCleaner(props).clean(sourceXml);
		String cleanXml = new PrettyXmlSerializer(props).getAsString(tagNode,"utf-8");
		return cleanXml;
	}
}
