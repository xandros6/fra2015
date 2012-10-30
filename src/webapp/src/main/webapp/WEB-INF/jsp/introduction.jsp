<%-- 
    Document   : template
    Created on : 2-ott-2012, 10.11.06
    Author     : francesco
--%>
<%@page import="it.geosolutions.fra2015.webapp.LocalizationBundle"%>
<%@page import="it.geosolutions.fra2015.webapp.rte.RTEConfigurationHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%


    int section = (Integer) request.getAttribute("section");
    int question = (Integer) request.getAttribute("question");

    LocalizationBundle strings = (LocalizationBundle) request.getAttribute("strings");

    if (strings == null) {
        System.out.println("string resource bundle is null");
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

    LocalizationBundle slr = (LocalizationBundle) request.getAttribute("sectionBundle");

    if (slr == null) {
        System.out.println("section resource bundle is null");
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

    LocalizationBundle qlr = (LocalizationBundle) request.getAttribute("questionBundle");

    if (qlr == null) {
        System.out.println("question resource bundle is null");
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
        <script src="includes/grid.kt.js" type="text/javascript"></script>
        <link href="includes/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="includes/jquery-ui.min.js"></script>
        <script>
            $(document).ready(function() {

                var table = $("#personsTable");
                
                var model = new ColumnModel();
               
                model.addColumn("name", "<%=qlr.getString("report.header.name")%>", true);
                model.addColumn("institution","<%=qlr.getString("report.header.subtitle")%>", true);
                model.addColumn("email","<%=qlr.getString("report.header.email")%>", true );
                model.addColumn("tables", "<%=qlr.getString("report.header.tables")%>",true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.configureTable(table);
                
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
            <div class="tablelayout" style="background-color: red;">
                <div class="navigation">
                    <jsp:include page="navigationmenu.jsp"/>
                </div>
                <div class="content">
                    <h1><%=slr.getString("introduction.title")%></h1>
                    <h3><%=qlr.getString("report.label")%>:</h3>
                    <table id="personsTable"></table>
                    <h3><%=qlr.getString("introduction.label")%>:</h3>
                    <form name="introduction">
                        <textarea id="introduction_rte" name="editor" cols="80" rows="10"></textarea>
                        <input id="introduction_save" type="button" value="<%=strings.getString("save")%>" />
                    </form>
                </div>
            </div>
        </div>

        <%


            strings.dumpMissingResources();
            slr.dumpMissingResources();


        %>
        <%@include file="jspf/footer.jspf" %>
        <ckeditor:replace replace="introduction_rte" basePath="<%=RTEConfigurationHelper.getBasePath(session)%>"
        events="<%=RTEConfigurationHelper.createEventHandlers()%>"
        globalEvents="<%=RTEConfigurationHelper.createGlobalEventHandler()%>"/>
</html>
