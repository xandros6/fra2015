package it.geosolutions.fra2015.mvc.view;

import java.io.StringReader;
import java.util.Map;

import javax.servlet.ServletOutputStream;
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
import org.springframework.web.servlet.view.xslt.XsltView;

public class XsltFoView extends XsltView {

	@SuppressWarnings("unchecked")

	@Override
	protected void renderMergedOutputModel(Map<String,Object> model, javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws Exception {

		FopFactory fopFactory = FopFactory.newInstance();
		fopFactory.setStrictValidation(false); 
		FOUserAgent foUserAgent = fopFactory.newFOUserAgent();

		ServletOutputStream out = null;

		try {

			out = response.getOutputStream();
			response.setContentType(MimeConstants.MIME_PDF);
			// Construct fop with desired output format
			Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);

			// Setup XSLT
			TransformerFactory factory = TransformerFactory.newInstance();

			// Create new transformer and get the stylesheet using
			// getStylesheetSource() from superclass (XsltView)
			// there must be an XSL file in WEB-INF/xsl with file name
			// equal to the name of the view
			Transformer transformer = factory.newTransformer(super.getStylesheetSource());


			transformer.setParameter("versionParam", "2.0");

			// Setup input for XSLT transformation
			if(model.get("xml") != null){
				StringReader xmlReader = new StringReader((String)model.get("xml"));
				Source src = new StreamSource(xmlReader);

				// Resulting SAX events (the generated FO) must be piped through to FOP
				Result res = new SAXResult(fop.getDefaultHandler());

				// Start XSLT transformation and FOP processing
				transformer.transform(src, res);
			}
		} finally {
			out.close();
		}

	}
}
