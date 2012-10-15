<%-- 
    Document   : s1q1
    Created on : 10-ott-2012, 16.20.45
    Author     : francesco
--%>
<%@page import="java.util.List"%>
<%@page import="it.geosolutions.fra2015.webapp.LocalizationBundle"%>
<%@page import="it.geosolutions.fra2015.webapp.rte.RTEConfigurationHelper"%>
<%@taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    final boolean debug = true;

    LocalizationBundle strings = (LocalizationBundle) request.getAttribute("strings");

    if (strings == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

    LocalizationBundle cats = (LocalizationBundle) request.getAttribute("categories");

    if (cats == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

    LocalizationBundle partb = (LocalizationBundle) request.getAttribute("partb");

    if (partb == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }



%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FRA 2015 Question 11</title>
        <link href="includes/css/minimal.css" type="text/css" rel="stylesheet"/>
        <script src="includes/jquery-1.8.2.min.js" type="text/javascript">
        </script>
        <script src="includes/gridedit.js" type="text/javascript">
        </script>
        <link href="includes/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="includes/jquery-ui.min.js"></script>
        <script type="text/javascript">
            <!--
            $(document).ready(function(){
                $(":button").button();
                $("#t1_2Add").click(function(ev) {
                    
                    var rowIndex;
                    
                    rowIndex = $("#t1_2  tr").size();
                    
                    createRow("t1_2",rowIndex);
                                        
                });
                $("#t1_2Save").click(function(ev) {
                    
                    alert('Not supported yet.');
                                        
                });
                
            });
            -->
        </script>

    </head>
    <body>
        <%@include file="jspf/header.jspf" %>
        <div id="main">
            <div id="topmenu">
                <%@include file="jspf/sectionmenu.jspf" %>
            </div>
            <div class="tablelayout">
                &nbsp;
                <div class="navigation">
                    <%@include file="jspf/partbmenu.jspf" %>
                </div>

                <div class="content">
                    Not implemented yet.
                </div>
            </div>
        </div>
        <%@include file="jspf/footer.jspf" %>

        <%

            if (debug) {

                strings.dumpMissingResources();
                cats.dumpMissingResources();
                partb.dumpMissingResources();

            }


        %>

    </body>
</html>

