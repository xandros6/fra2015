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

               var table = $("#t21_2_1");
                
                var model = new ColumnModel();
                
                model.addColumn("id", "#", false);
                model.addColumn("reference", "<%=qlr.getString("data.sources.header.reference")%>", true);
                model.addColumn("variable","<%=qlr.getString("data.sources.header.variable")%>", true);
                model.addColumn("year","<%=qlr.getString("data.sources.header.year")%>", true );
                model.addColumn("comments", "<%=qlr.getString("data.sources.header.comments")%>",true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.configureTable(table);
                
                var table = $("#t21_3_1");
                
                var model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("forestarea_2020", "forestarea2030", true);
                model.addColumn("forestarea_2030", "forestarea2030", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                KT.setEditable(table,true);
                
                var table = $("#t21_3_2");
                
                var model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("forestarea_2013", "forestarea2013", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                KT.setEditable(table,true);
                
                var table = $("#t21_4_1");
                
                var model = new ColumnModel();

                model.addColumn("<%=qlr.getString("data.comments.header.category")%>");
                model.addColumn("comments", "<%=qlr.getString("data.comments.header.comments")%>",true);
                                                        
                table.data(model.DATA_PROPERTY_NAME, model);
                                
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
                    <h1><%= slr.getString("q21.title")%>:<%=slr.getString("q21.body")%></h1>
                    <h2>21.1 <%=qlr.getString("fra2015.categories.title")%></h2>
                    <table>
                        <tr>
                            <th><%=qlr.getString("fra2015.categories.name")%></th>
                            <th><%=qlr.getString("fra2015.categories.definition")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.forest.governmenttargetaspiration.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.forest.governmenttargetaspiration.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.forest.conversionearmarked.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.forest.conversionearmarked.definition")%></td>
                        </tr>
                    </table>
                        
                    <h2>21.2 <%=qlr.getString("national.data")%></h2>
                    <h3>21.2.1 <%=qlr.getString("data.sources.title")%></h3>
                    
                    <table id="t21_2_1">

                    </table>
                    
                    <h2>21.3 <%=qlr.getString("data.title")%></h2>                    
                    <h3>21.3.1 <%=qlr.getString("data.table21a.header.title")%></h3>         
                    <table id="t21_3_1">
                        <tr style="display:none">
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                        <tr>
                            <th rowspan="2"><%=qlr.getString("data.table21a.header.categories")%></th>
                            <th colspan="2"><%=qlr.getString("data.table21a.header.forestarea")%></th>
                        </tr>
                        <tr>
                            <th>2020</th>
                            <th>2030</th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.forest.governmenttargetaspiration.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>

                    <h3>21.3.2 <%=qlr.getString("data.table21a.header.title")%></h3>         
                    <table id="t21_3_2">
                        <tr style="display:none">
                            <th></th>
                            <th></th>
                        </tr>
                        <tr>
                            <th rowspan="2"><%=qlr.getString("data.table21a.header.categories")%></th>
                            <th><%=qlr.getString("data.table21b.header.forestarea")%></th>
                        </tr>
                        <tr>
                            <th>2013</th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.forest.conversionearmarked.name")%></td>
                            <td></td>
                        </tr>
                    </table>

                    <h2>21.4 <%=qlr.getString("data.comments.title")%></h2>
                    <h3></h3>
                    <table id="t21_4_1">
                        <tr>
                            <th><%=qlr.getString("data.comments.header.category")%></th>
                            <th><%=qlr.getString("data.comments.header.comments")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.forest.governmenttargetaspiration.name")%></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.forest.conversionearmarked.name")%></td>
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

