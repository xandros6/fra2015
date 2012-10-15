<%@page import="it.geosolutions.fra2015.webapp.LocalizationBundle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="jspf/userValidation.jspf"%>
<%LocalizationBundle rb = (LocalizationBundle) request.getAttribute("strings");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FRA 2015 Not implemented yet</title>
        <link href="includes/css/minimal.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <%@include file="jspf/header.jspf" %>
        <div id="main">
            <div id="topmenu">
                &nbsp;
            </div>
            <div id="content">
                <h1 class="warning"><%=rb.getString("notimplemented")%></h1>
            </div>
        </div>
        <%@include file="jspf/footer.jspf" %>
    </body>
</html>
