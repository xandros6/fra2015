package it.geosolutions.fra2015.webapp;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Francesco
 */
public class MainController extends HttpServlet {

    private final Logger log;

    public MainController() {
        super();
        log = Logger.getLogger(getClass().getName());
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        ConfigurationManager.init(config);
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
        request.setCharacterEncoding("UTF-8");
        RequestObject req = ContextObjectFactory.getRequestObject(request);

        Action action = ActionFactory.createAction(req);

        ResponseObject wrapper;

        try {

            wrapper = action.call(req);

        } catch (Exception ex) {

            StringBuilder sb = new StringBuilder();

            sb.append("uncaught ").append(ex).append(" executing command ").append(req.getRequestCommand());

            if (ex.getMessage() != null) {
                sb.append(":").append(ex.getMessage());
            }

            log.log(Level.SEVERE, sb.toString(), ex);

            wrapper = ContextObjectFactory.getResponseObject();
            wrapper.setView("error");
            wrapper.getResponseMap().put("exception", ex);
            wrapper.getResponseMap().put("message", sb.toString());

        }

        this.forward(request, response, wrapper);

    }

    private void forward(HttpServletRequest request, HttpServletResponse response, ResponseObject wrapper) throws ServletException, IOException {

        String view = wrapper.getView();

        if (view == null) {
            throw new NullPointerException("view cannot be null");
        }

        if (view.equals("")) {
            throw new IllegalArgumentException("view cannot be 0 length");
        }

        String url = ConfigurationManager.getView(view);

        log.log(Level.FINE, "forward to view:{0} url:{1}", new Object[]{view, url});

        if (url == null) {
            if (view.startsWith("http")) {
                log.log(Level.FINE, "redirecting to {0}", view);
                response.sendRedirect(view);
                return;
            } else {
                url = view;
            }
        }

        RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher(url);

        if (requestDispatcher == null) {
            throw new NullPointerException("url cannot be null:" + url);
        }

        ViewDispatcher dispatcher = new ViewDispatcher(requestDispatcher);

        dispatcher.forward(request, response, wrapper);

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
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
        return "Application main controller";
    }// </editor-fold>
}
