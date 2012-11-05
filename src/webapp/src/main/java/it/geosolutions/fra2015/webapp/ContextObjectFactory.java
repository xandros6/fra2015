package it.geosolutions.fra2015.webapp;

import java.io.File;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Francesco
 */
public class ContextObjectFactory {

    public static RequestObject getRequestObject(HttpServletRequest request) {

        RequestObject ro = new RequestObject(request);

        String command = request.getRequestURI().split(".action")[0];

        int index = command.lastIndexOf("/");

        if (index > -1) {
            command = command.substring(index + 1);
        }

        ro.setRequestCommand(command);

        for (Enumeration<String> listaSession = request.getSession().getAttributeNames(); listaSession.hasMoreElements();) {

            String key = listaSession.nextElement();

            ro.getSessionMap().put(key, request.getSession().getAttribute(key));

        }

        // controllo che non ci siano file inviati

        // Check that we have a file upload request
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (isMultipart) {

            DiskFileItemFactory factory = new DiskFileItemFactory();

            ServletFileUpload upload = new ServletFileUpload(factory);

            try {

                List items = upload.parseRequest(request);

                Iterator iter = items.iterator();

                while (iter.hasNext()) {

                    FileItem item = (FileItem) iter.next();
                    
                    String name = item.getFieldName();
                    
                    if (!item.isFormField()) {

                        // è un campo file
                        
                        File fullFile = new File(item.getName());

                        File savedFile = new File(request.getServletContext().getRealPath("/tmp"),
                                fullFile.getName());

                        item.write(savedFile);

                        ro.getRequestMap().put(name, savedFile);

                    } else {

                        ro.getRequestMap().put(name, item.getString());

                    }
                }

            } catch (Exception ex) {
                Logger.getLogger(ContextObjectFactory.class.getName()).log(Level.ERROR, null, ex);
            }

        } else {

            Map pMap = request.getParameterMap();

            for (Iterator<String> listaParams = pMap.keySet().iterator(); listaParams.hasNext();) {

                String key = (String) listaParams.next();

                ro.getRequestMap().put(key, pMap.get(key));

            }

        }

        return ro;

    }

    public static ResponseObject getResponseObject() {
        return new ResponseObject();
    }
}
