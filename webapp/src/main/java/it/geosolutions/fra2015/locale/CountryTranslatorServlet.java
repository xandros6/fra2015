/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.locale;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;

/**
 *
 * @author marco
 */
public class CountryTranslatorServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(CountryTranslatorServlet.class.getSimpleName());
    private static final String FILENAME_EN = "countries_en.xml";
    private static final String FILENAME_FR = "countries_fr.xml";
    private static final String FILENAME_ES = "countries_es.xml";
    private Map<String, Document> locale = new HashMap<String, Document>();

    @Override
    public void init() throws ServletException {
        try {
            super.init();
            // load locale xml files
            locale.put("EN", readFile(FILENAME_EN));
            locale.put("FR", readFile(FILENAME_FR));
            locale.put("ES", readFile(FILENAME_ES));
        } catch (ParserConfigurationException ex) {
            if (LOGGER.isLoggable(Level.SEVERE)) {
                LOGGER.log(Level.SEVERE, ex.getMessage());
            }
        } catch (SAXException ex) {
            if (LOGGER.isLoggable(Level.SEVERE)) {
                LOGGER.log(Level.SEVERE, ex.getMessage());
            }
        } catch (IOException ex) {
            if (LOGGER.isLoggable(Level.SEVERE)) {
                LOGGER.log(Level.SEVERE, ex.getMessage());
            }
        }
    }

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/xml");
        PrintWriter out = response.getWriter();
        out.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");

        try {

            

            String language = request.getParameter("lang");
            String text = request.getParameter("text");
            if (language != null && text != null) {
                Document doc = locale.get(language);
                if (doc != null) {

                    out.println("<locale>");
                    String[] words = text.split(",");
                    for (String word : words) {
                        XPathFactory xPathfactory = XPathFactory.newInstance();
                        XPath xpath = xPathfactory.newXPath();
                        XPathExpression expr = xpath.compile("//label[@ref=\"" + word + "\"]");
                        Node node = (Node) expr.evaluate(doc, XPathConstants.NODE);
                        
                        TransformerFactory tf = TransformerFactory.newInstance();
                        Transformer serializer = tf.newTransformer();
                        serializer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
                        StringWriter sw = new StringWriter();
                        serializer.transform(new DOMSource(node), new StreamResult(sw));
                        String s = sw.getBuffer().toString();

                        out.println( s );
                        
                    }
                    out.println("</locale>");

                } else {
                    out.println("Locale for language " + language + " not found.");
                }
            } else {
                 out.println("Language " + language + " unknown.");
            }

            
        } catch (TransformerException ex) {
            if (LOGGER.isLoggable(Level.SEVERE)) {
                LOGGER.log(Level.SEVERE, ex.getMessage());
            }
        } catch (XPathExpressionException ex) {
            if (LOGGER.isLoggable(Level.SEVERE)) {
                LOGGER.log(Level.SEVERE, ex.getMessage());
            }
        } finally {
            try {
                out.close();
            } catch (Exception e) {
                LOGGER.log(Level.SEVERE, "Cannot close streams.");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Translator service for country names";
    }// </editor-fold>

    private Document readFile(String filename) throws ParserConfigurationException, SAXException, IOException {
        Document localeFile;
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db = dbf.newDocumentBuilder();
        localeFile = db.parse(this.getClass().getClassLoader().getResourceAsStream(filename));
        return localeFile;
    }
}
