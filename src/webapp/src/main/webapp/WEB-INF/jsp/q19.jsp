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

               var table = $("#t19_2_1");
                
                var model = new ColumnModel();
                
                model.addColumn("id", "#", false);
                model.addColumn("reference", "<%=qlr.getString("data.sources.header.reference")%>", true);
                model.addColumn("variable","<%=qlr.getString("data.sources.header.variable")%>", true);
                model.addColumn("year","<%=qlr.getString("data.sources.header.year")%>", true );
                model.addColumn("comments", "<%=qlr.getString("data.sources.header.comments")%>",true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.configureTable(table);
                
                table = $("#t19_2_2");
                
                model = new ColumnModel();
                
                model.addColumn("id", "#");
                model.addColumn("class", "<%=qlr.getString("classification.header.class")%>",true);
                model.addColumn("definition", "<%=qlr.getString("classification.header.definition")%>",true);

                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.configureTable(table);

                var table = $("#t19_3_1");
                
                var model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("employment_1990", "employment1990", true);
                model.addColumn("employment_2000", "employment2000", true);
                model.addColumn("employment_2005", "employment2005", true);
                model.addColumn("employment_2005", "employment2010", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                KT.setEditable(table,true);
                
                var table = $("#t19_4_1");
                
                var model = new ColumnModel();

                model.addColumn("<%=qlr.getString("data.comments.header.category")%>");
                model.addColumn("comments.definitionsdata", "<%=qlr.getString("data.comments.header.comments.definitionsdata")%>",true);
                model.addColumn("comments.trend", "<%=qlr.getString("data.comments.header.comments.trend")%>",true);
                                                        
                table.data(model.DATA_PROPERTY_NAME, model);
                                
                KT.setEditable(table,true);

                var table = $("#t19_4_2");
                
                var model = new ColumnModel();
                model.addColumn("comments.other", "<%=qlr.getString("data.comments.other.header")%>",true);
                                                        
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
                    <h1><%= slr.getString("q19.title")%>:<%=slr.getString("q19.body")%></h1>
                    <h2>19.1 <%=qlr.getString("fra2015.categories.title")%></h2>
                    <table>
                        <tr>
                            <th><%=qlr.getString("fra2015.categories.name")%></th>
                            <th><%=qlr.getString("fra2015.categories.definition")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.fte.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.fte.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.employment.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.employment.definition")%></td>
                        </tr>
                    </table>
                        
                    <h2>19.2 <%=qlr.getString("national.data")%></h2>
                    <h3>19.2.1 <%=qlr.getString("data.sources.title")%></h3>
                    <table id="t19_2_1">

                    </table>
                    <table id="t19_2_2">

                    </table>
                    <h3>19.2.3 <%=qlr.getString("original.data.title")%></h3>
                    <textarea id="originaldataEditor" name="originalDataEditor"></textarea>
                    
                    <h2>19.3 <%=qlr.getString("data.title")%></h2>                    
                    <h3>19.3.1 <%=qlr.getString("data.table19.header.title")%></h3>         
                    <table id="t19_3_1">
                        <tr style="display:none">
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                        <tr>
                            <th rowspan="2"><%=qlr.getString("data.table19.header.categories")%></th>
                            <th colspan="4"><%=qlr.getString("data.table19.header.employment")%></th>
                        </tr>
                        <tr>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table19.row.category.employment")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table19.row.category.employment.female")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>

                    <h2>19.4 <%=qlr.getString("data.comments.title")%></h2>
                    <h3></h3>
                    <table id="t19_4_1">
                        <tr>
                            <th><%=qlr.getString("data.comments.header.category")%></th>
                            <th><%=qlr.getString("data.comments.header.comments.definitionsdata")%></th>
                            <th><%=qlr.getString("data.comments.header.comments.trend")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comments.row.category.employment")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>           

                    <h3></h3>
                    <table id="t19_4_2">
                        <tr>
                            <th><%=qlr.getString("data.comments.other.header")%></th>
                        </tr>
                        <tr>
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

