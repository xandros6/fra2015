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
                
               var table = $("#t13_2_1");
                
                var model = new ColumnModel();
                
                model.addColumn("id", "#", false);
                model.addColumn("reference", "<%=qlr.getString("data.sources.header.reference")%>", true);
                model.addColumn("variable","<%=qlr.getString("data.sources.header.variable")%>", true);
                model.addColumn("year","<%=qlr.getString("data.sources.header.year")%>", true );
                model.addColumn("comments", "<%=qlr.getString("data.sources.header.comments")%>",true);
                
                table.data('columnModel', model);
                
                KT.configureTable(table);                
                
                table = $("#t13_2_2");
                
                model = new ColumnModel();
                
                model.addColumn("id", "#");
                model.addColumn("class", "<%=qlr.getString("classification.header.class")%>",true);
                model.addColumn("definition", "<%=qlr.getString("classification.header.definition")%>",true);

                table.data('columnModel',model);
                
                KT.configureTable(table);

                var table = $("#t13_3_1");
                
                var model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("forestarea", "<%=qlr.getString("data.table13a.header.area.totalpercentage")%>",true);
                model.addColumn("mostrecentyear", "<%=qlr.getString("data.table13a.header.area.totalpercentage")%>", true);
                model.addColumn("continuos", "<%=qlr.getString("data.table13a.header.continuos")%>", true);
                model.addColumn("periodic", "<%=qlr.getString("data.table13a.header.periodic")%>", true);
                model.addColumn("groundplots.permanent", "<%=qlr.getString("data.table13a.header.groundplots.permanent")%>", true);
                model.addColumn("groundplots.temporary", "<%=qlr.getString("data.table13a.header.groundplots.temporary")%>", true);
                model.addColumn("aerialremotesensing.samplebased", "<%=qlr.getString("data.table13a.header.aerialremotesensing.samplebased")%>", true);
                model.addColumn("aerialremotesensing.fullcoverage", "<%=qlr.getString("data.table13a.header.aerialremotesensing.fullcoverage")%>", true);
                
                table.data('columnModel',model);
                
                KT.setEditable(table,true);

                var table = $("#t13_3_2");
                
                var model = new ColumnModel();
                
                model.addColumn("<%=qlr.getString("data.table13b.typeofreport.")%>", "<%=qlr.getString("data.table13b.typeofreport.")%>",false);
                model.addColumn("<%=qlr.getString("data.table13b.checkboxes.")%>", "<%=qlr.getString("data.table13b.checkboxes.")%>",true);
                
                table.data('columnModel',model);
                
                KT.setEditable(table,true);

                var table = $("#t13_3_3");
                
                var model = new ColumnModel();

                model.addColumn("<%=qlr.getString("data.table13b.header.other")%>", "<%=qlr.getString("data.table13b.header.other")%>",false);
                                                        
                table.data('columnModel',model);
                
                KT.configureTable(table);
                
                var table = $("#t13_4_1");
                
                var model = new ColumnModel();

                model.addColumn("<%=qlr.getString("data.comments.header.category")%>", "<%=qlr.getString("data.comments.header.category")%>",true);
                model.addColumn("<%=qlr.getString("data.comments.header.comments")%>", "<%=qlr.getString("data.comments.header.comments")%>",true);
                                                        
                table.data('columnModel',model);
                
                KT.configureTable(table);
                
                
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
                    <%switch (section) {
                            case 1:%>
                    <%@include file="jspf/section1.jspf" %>
                    <%break;
                        case 2:%>
                    <%@include file="jspf/section2.jspf" %>
                    <%break;
                        case 3:%>
                    <%@include file="jspf/section3.jspf" %>
                    <%break;
                        case 4:%>
                    <%@include file="jspf/section4.jspf" %>
                    <%break;
                        default:%>
                    <%}%>
                </div>
                <div class="content">
                    <h1><%= slr.getString("q13.title")%>:<%=slr.getString("q13.body")%></h1>
                    
                    <h2>13.1 <%=qlr.getString("fra2015.categories.title")%></h2>
                    <table>
                        <tr>
                            <th><%=qlr.getString("fra2015.categories.name")%></th>
                            <th><%=qlr.getString("fra2015.categories.definition")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.forest.nationalframework.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.forest.nationalframework.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.forest.nationalscalereporting.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.forest.nationalscalereporting.definition")%></td>
                        </tr>
                    </table>     
                        
                    <h2>13.2 <%=qlr.getString("national.data")%></h2>
                    <h3>13.2.1 <%=qlr.getString("data.sources.title")%></h3>
                    <table id="t13_2_1">

                    </table>
                    <h3>13.2.2 <%=qlr.getString("classification.title")%></h3>
                    <table id="t13_2_2">

                    </table>                    
                    <h2>13.3 <%=qlr.getString("data.title")%></h2>                    
                    <h3>13.3.1 <%=qlr.getString("data.table13a.title")%></h3>         
                    <table id="t13_3_1">
                        <tr style="display:none">
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                        <tr>
                            <th rowspan="2"><%=qlr.getString("data.table13a.header.category")%></th>
                            <th rowspan="2"><%=qlr.getString("data.table13a.header.area.totalpercentage")%></th>
                            <th rowspan="2"><%=qlr.getString("data.table13a.header.mostrecentyear")%></th>
                            <th colspan="6"><%=qlr.getString("data.table13a.header.checkboxes")%></th>
                        </tr>
                        <tr>
                            <th><%=qlr.getString("data.table13a.header.continuos")%></th>
                            <th><%=qlr.getString("data.table13a.header.periodic")%></th>
                            <th><%=qlr.getString("data.table13a.header.groundplots.permanent")%></th>
                            <th><%=qlr.getString("data.table13a.header.groundplots.temporary")%></th>
                            <th><%=qlr.getString("data.table13a.header.aerialremotesensing.samplebased")%></th>
                            <th><%=qlr.getString("data.table13a.header.aerialremotesensing.fullcoverage")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table13a.category.forestinventory")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table13a.category.otherfieldassesements")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table13a.category.updatestoothersources")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table13a.category.expertextmate")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                    <h3>13.3.2 <%=qlr.getString("data.table13b.title")%></h3>         
                    <table id="t13_3_2">
                        <tr>
                            <th><%=qlr.getString("data.table13b.header.typeofreport")%></th>
                            <th><%=qlr.getString("data.table13b.header.checkboxes")%></th>                            
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table13b.category.report.criteriaandindicators")%></td>                            
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table13b.category.report.periodicnationalstate")%></td>                            
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table13b.category.report.other")%></td>                            
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table13b.category.report.none")%></td>                            
                            <td></td>
                        </tr>
                    </table>                            
                    <h3></h3>
                    <table id="t13_3_3">
                        
                    </table>

                                
                    <h2>13.4 <%=qlr.getString("data.comments.title")%></h2>
                    <h3></h3>
                    <table id="t13_4_1">

                    </table>
                </div>
            </div>
        </div>
        <%@include file="jspf/footer.jspf" %>
        <ckeditor:replace replace="originaldataEditor" basePath="/WebApp/ckeditor/"
        events="<%=RTEConfigurationHelper.createEventHandlers()%>"
        globalEvents="<%=RTEConfigurationHelper.createGlobalEventHandler()%>"
                          />
        <ckeditor:replace replace="adjustmentEditor" basePath="/WebApp/ckeditor/"
        events="<%=RTEConfigurationHelper.createEventHandlers()%>"
        globalEvents="<%=RTEConfigurationHelper.createGlobalEventHandler()%>"
                          />

        <ckeditor:replace replace="estimationEditor" basePath="/WebApp/ckeditor/"
        events="<%=RTEConfigurationHelper.createEventHandlers()%>"
        globalEvents="<%=RTEConfigurationHelper.createGlobalEventHandler()%>"
                          />

        <ckeditor:replace replace="reclassificationEditor" basePath="/WebApp/ckeditor/"
        events="<%=RTEConfigurationHelper.createEventHandlers()%>"
        globalEvents="<%=RTEConfigurationHelper.createGlobalEventHandler()%>"
                          />

    </body>
</html>

