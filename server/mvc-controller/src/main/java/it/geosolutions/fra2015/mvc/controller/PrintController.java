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
import it.geosolutions.fra2015.mvc.view.MyReloadableResourceBundleMessageSource;
import it.geosolutions.fra2015.services.SurveyService;
import it.geosolutions.fra2015.services.exception.InternalErrorServiceEx;

import java.io.StringReader;
import java.util.Locale;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;
import org.apache.log4j.Logger;
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

	Logger LOGGER = Logger.getLogger(PrintController.class);

	@RequestMapping(value = "/survey/print/{country}/{mode}", method = RequestMethod.GET)
	public String printWelcome(@PathVariable(value = "country") String country, @PathVariable(value = "mode") String mode, Model model,
			HttpSession session,  Locale locale) throws IllegalArgumentException, InternalErrorServiceEx{

		Set<Object> messageKeys = messageSource.getKeys(locale);
		
		String countryName = surveyService.findCountryByISO3(country).getName();
		
		model.addAttribute("context", "survey");    
		model.addAttribute("country", countryName);  
		model.addAttribute("messageKeys", messageKeys);     
		model.addAttribute("profile", ControllerServices.Profile.PRINT.toString());

		if(mode.equalsIgnoreCase("allschema")){

			utils.prepareHTTPRequestOnlyVariablesName(model, country);            
		}
		else if(mode.equalsIgnoreCase("onlyvalues")){

			utils.prepareHTTPRequest(model, null, utils.retrieveValues(null, country), false);
		}
		else if(mode.equalsIgnoreCase("onlynames")){

			utils.prepareHTTPRequest(model, null, utils.retrieveValues(null, country), true);
		}
		else{
			throw new IllegalArgumentException("the mode: '" + mode + "' doesn't exist, valid ones are 'allschema', 'onlyvalues' and 'onlynames'");
		}

		return "survey/print";

	}

	@RequestMapping(value = "/survey/print/pdf/{country}/{mode}", method = RequestMethod.GET)
	public void printPdf(@PathVariable(value = "country") String country, @PathVariable(value = "mode") String mode, Model model,
			HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws IllegalArgumentException, InternalErrorServiceEx{


		try {
			
			String template = "/survey/print/"+country+"/"+mode;

			CharArrayWriterResponse customResponse = new CharArrayWriterResponse(resp);

			req.getRequestDispatcher(template).include(req, customResponse);

			String xml = customResponse.getOutput();
			//m.getModelMap().addAttribute("xml",customResponse.getOutput());

			FopFactory fopFactory = FopFactory.newInstance();
			FOUserAgent foUserAgent = fopFactory.newFOUserAgent();

			ServletOutputStream out = null;

			try {

				out = resp.getOutputStream();
				resp.setContentType(MimeConstants.MIME_PDF);
				String filename =  "FRA 2015 – Country Report, " + country + ".pdf";
				resp.setHeader("Content-Disposition", "inline ; filename=\"" + filename +"\"");
				// Construct fop with desired output format
				Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);



				
				// Setup XSLT
				//TransformerFactory factory = TransformerFactory.newInstance();
				//USE SAXON
				TransformerFactory factory = new net.sf.saxon.TransformerFactoryImpl();

				// Create new transformer and get the stylesheet using
				// getStylesheetSource() from superclass (XsltView)
				// there must be an XSL file in WEB-INF/xsl with file name
				// equal to the name of the view
				String xslFilename = "/WEB-INF/xsl/countryReport.xsl" ;
				ServletContext context = session.getServletContext();
				String pathname =context.getRealPath(xslFilename); 
				
				Source xslt = new StreamSource(pathname);
				Transformer transformer = factory.newTransformer(xslt);


				transformer.setParameter("versionParam", "2.0");

				// Setup input for XSLT transformation
				//if(model.get("xml") != null){
				StringReader xmlReader = new StringReader(xml);
				Source src = new StreamSource(xmlReader);

				// Resulting SAX events (the generated FO) must be piped through to FOP
				Result res = new SAXResult(fop.getDefaultHandler());

				// Start XSLT transformation and FOP processing
				transformer.transform(src, res);
				
				System.out.println(res.toString());
				//}
			} finally {
				out.close();
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
