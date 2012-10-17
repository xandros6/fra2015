<%-- 
    Document   : template
    Created on : 2-ott-2012, 10.11.06
    Author     : francesco
--%>
<%@page import="it.geosolutions.fra2015.webapp.LocalizationBundle"%>
<%@page import="it.geosolutions.fra2015.webapp.rte.RTEConfigurationHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@include file="jspf/userValidation.jspf" %>
<%

    LocalizationBundle strings = (LocalizationBundle) request.getAttribute("strings");

    if (strings == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

    LocalizationBundle slr = (LocalizationBundle) request.getAttribute("sectionBundle");

    if (slr == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FRA 2015 Introduction</title>
        <link href="includes/css/minimal.css" type="text/css" rel="stylesheet"/>
        <script src="includes/jquery-1.8.2.min.js" type="text/javascript"></script>
        <script src="includes/kGrid.js" type="text/javascript"></script>
        <link href="includes/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="includes/jquery-ui.min.js"></script>
        <script>
            $(document).ready(function(){
                
                addLocalizedObject("#personsTable",{
                    "name":"<%=slr.getString("report.header.name")%><br/>(<%=slr.getString("report.header.subtitle")%>)",
                    "institution":"<%=slr.getString("report.header.istitution")%>",
                    "email":"<%=slr.getString("report.header.email")%>",
                    "tables":"<%=slr.getString("report.header.tables")%>"
                });
                
                configureTable("#personsTable", 
                new Array("name", "institution", "email", "tables"), 
                null);
                
                $(":button").button();
            });
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
                    <%@include file="jspf/section1.jspf" %>
                </div>
                <div class="content">
                    <h1><%=slr.getString("title")%></h1>
                    <h3><caption><%=slr.getString("report.label")%>:</h3>
                    <table id="personsTable"></table>
                    <h3><%=slr.getString("introduction.label")%>:</h3>
                    <textarea id="editor" name="editor" cols="80" rows="10"></textarea>
                    <br/>
                    <input id="bReload" type="button" value="Cancel"/>
                    <input id="bSave" type="button" value="Save"/>
                </div>
            </div>
        </div>

        <%


            strings.dumpMissingResources();
            slr.dumpMissingResources();


        %>
        <%@include file="jspf/footer.jspf" %>
        <ckeditor:replace replace="editor" basePath="/WebApp/ckeditor/"
        events="<%=RTEConfigurationHelper.createEventHandlers()%>"
        globalEvents="<%=RTEConfigurationHelper.createGlobalEventHandler()%>"
                          />
</html>
