package it.geosolutions.fra2015.webapp;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Francesco
 */
public class ViewDispatcher {

    protected final RequestDispatcher dispatcher;

    public ViewDispatcher(RequestDispatcher dispatcher) {
        super();
        if (dispatcher == null) {
            throw new NullPointerException("dispatcher cannot be null");
        }
        this.dispatcher = dispatcher;
    }

    public void forward(HttpServletRequest req, HttpServletResponse res, ResponseObject ro) throws ServletException, IOException {
        mergeData(req, ro);
        dispatcher.forward(req, res);
    }

    private void mergeData(HttpServletRequest req, ResponseObject ro) {
        if (ro == null) {
            return;
        }

        for (String key : ro.getResponseMap().keySet()) {
            req.setAttribute(key, ro.getResponseMap().get(key));
        }

        for (String key : ro.getSessionMap().keySet()) {
            req.getSession().setAttribute(key, ro.getSessionMap().get(key));
        }
    }
}
