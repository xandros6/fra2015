<%-- 
    Document   : s1q1
    Created on : 10-ott-2012, 16.20.45
    Author     : francesco
--%>
<%@page import="it.geosolutions.fra2015.webapp.LocalizationBundle"%>
<%@page import="it.geosolutions.fra2015.webapp.rte.RTEConfigurationHelper"%>
<%@taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    int section = (Integer) request.getAttribute("section");
    int question = (Integer) request.getAttribute("question");

    LocalizationBundle strings = (LocalizationBundle) request.getAttribute("strings");

    if (strings == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

    LocalizationBundle slr = (LocalizationBundle) request.getAttribute("sectionBundle");

    if (slr == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

    LocalizationBundle qlr = (LocalizationBundle) request.getAttribute("questionBundle");

    if (qlr == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FRA 2015 Question <%=question%></title>
        <link href="includes/css/minimal.css" type="text/css" rel="stylesheet"/>
        <script src="includes/jquery-1.8.2.min.js" type="text/javascript">
        </script>
        <script src="includes/grid.kt.js" type="text/javascript">
        </script>
        <link href="includes/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="includes/jquery-ui.min.js"></script>
        <script type="text/javascript">
            <!--
            $(document).ready(function(){
                
               var table = $("#t10_2_1");
                
                var model = new ColumnModel();
                
                model.addColumn("id", "#", false);
                model.addColumn("reference", "<%=qlr.getString("data.sources.header.reference")%>", true);
                model.addColumn("variable","<%=qlr.getString("data.sources.header.variable")%>", true);
                model.addColumn("year","<%=qlr.getString("data.sources.header.year")%>", true );
                model.addColumn("comments", "<%=qlr.getString("data.sources.header.comments")%>",true);
                
                table.data('columnModel', model);
                
                KT.configureTable(table);                

                table = $("#t10_2_2");
                
                model = new ColumnModel();
                
                model.addColumn("id", "#");
                model.addColumn("class", "<%=qlr.getString("classification.header.class")%>",true);
                model.addColumn("definition", "<%=qlr.getString("classification.header.definition")%>",true);

                table.data('columnModel',model);
                
                KT.configureTable(table);

                var table = $("#t10_3_1");
                
                var model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("national", "national", true);
                model.addColumn("regional", "regional", true);
                model.addColumn("provincialstate", "provincialstate", true);
                model.addColumn("local", "local", true);
                
                table.data('columnModel',model);
                
                KT.setEditable(table,true);
 
                var table = $("#t10_4_1");
                
                var model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("comments", "comments", true);
                
                table.data('columnModel',model);
                
                KT.setEditable(table,true);
                $(":button").button();
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
                  <jsp:include page="navigationmenu.jsp"/>
                </div>
                <div class="content">
                    <h1><%= slr.getString("q10.title")%>:<%=slr.getString("q10.body")%></h1>
                    <h2>10.1 <%=qlr.getString("fra2015.categories.title")%></h2>
                    <table>
                        <tr>
                            <th><%=qlr.getString("fra2015.categories.name")%></th>
                            <th><%=qlr.getString("fra2015.categories.definition")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.policies.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.policies.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.legislation.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.legislation.definition")%></td>
                        </tr>
                    </table>        
                        
                    <h2>10.2 <%=qlr.getString("national.data")%></h2>
                    <h3>10.2.1 <%=qlr.getString("data.sources.title")%></h3>
                    <table id="t10_2_1">

                    </table>
                    <h3>10.2.2 <%=qlr.getString("classification.title")%></h3>
                    <table id="t10_2_2">

                    </table>
                    <h3>10.2.3 <%=qlr.getString("original.data.title")%></h3>
                    <textarea id="originaldataEditor" name="originalDataEditor"></textarea>
                        
                    <h2>10.3 <%=qlr.getString("data.title")%></h2>
                    <h3>10.3.1 <%=qlr.getString("data.table10.title")%></h3>                        
                    <table id="t10_3_1">
                        <tr style="display:none">
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                        <tr>
                            <th rowspan="3"><%=qlr.getString("data.table10.header.category")%></th>
                            <th colspan="4"><%=qlr.getString("data.table10.header.checkboxes")%></th>
                        </tr>
                        <tr>
                            <th rowspan="2"><%=qlr.getString("data.table10.header.national")%></th>
                            <th colspan="3"><%=qlr.getString("data.table10.header.subnational")%></th>
                        </tr>
                        <tr>
                            <th><%=qlr.getString("data.table10.header.subnational.regional")%></th>
                            <th><%=qlr.getString("data.table10.header.subnational.provincialstate")%></th>
                            <th><%=qlr.getString("data.table10.header.subnational.local")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.policies.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.policies.publiclyowned.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.policies.publiclyowned.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.legislation.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.legislation.publiclyowned.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.legislation.publiclyowned.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>

                    <h3><%=qlr.getString("data.tiers.title")%></h3>
                            
                    <h2>10.4 <%=qlr.getString("data.comments.title")%></h2>
                    <h3></h3>
                    <table id="t10_4_1">
                        <tr>
                            <th><%=qlr.getString("data.comments.header.category")%></th>
                            <th><%=qlr.getString("data.comments.header.data")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.policies.name")%></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.legislation.name")%></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <%@include file="jspf/footer.jspf" %>
        <ckeditor:replace replace="originaldataEditor" basePath="<%=RTEConfigurationHelper.getBasePath(session)%>"
        events="<%=RTEConfigurationHelper.createEventHandlers()%>"
        globalEvents="<%=RTEConfigurationHelper.createGlobalEventHandler()%>"
                          />
        <ckeditor:replace replace="adjustmentEditor" basePath="<%=RTEConfigurationHelper.getBasePath(session)%>"
        events="<%=RTEConfigurationHelper.createEventHandlers()%>"
        globalEvents="<%=RTEConfigurationHelper.createGlobalEventHandler()%>"
                          />

        <ckeditor:replace replace="estimationEditor" basePath="<%=RTEConfigurationHelper.getBasePath(session)%>"
        events="<%=RTEConfigurationHelper.createEventHandlers()%>"
        globalEvents="<%=RTEConfigurationHelper.createGlobalEventHandler()%>"
                          />

        <ckeditor:replace replace="reclassificationEditor" basePath="<%=RTEConfigurationHelper.getBasePath(session)%>"
        events="<%=RTEConfigurationHelper.createEventHandlers()%>"
        globalEvents="<%=RTEConfigurationHelper.createGlobalEventHandler()%>"
                          />

    </body>
</html>

