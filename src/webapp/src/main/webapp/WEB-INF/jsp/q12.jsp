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

               var table = $("#t12_2_1");
                
                var model = new ColumnModel();
                
                model.addColumn("id", "#", false);
                model.addColumn("reference", "<%=qlr.getString("data.sources.header.reference")%>", true);
                model.addColumn("variable","<%=qlr.getString("data.sources.header.variable")%>", true);
                model.addColumn("year","<%=qlr.getString("data.sources.header.year")%>", true );
                model.addColumn("comments", "<%=qlr.getString("data.sources.header.comments")%>",true);
                
                table.data('columnModel', model);
                
                KT.configureTable(table);                

                table = $("#t12_2_2");
                
                model = new ColumnModel();
                
                model.addColumn("id", "#");
                model.addColumn("class", "<%=qlr.getString("classification.header.class")%>",true);
                model.addColumn("definition", "<%=qlr.getString("classification.header.definition")%>",true);

                table.data('columnModel',model);
                
                KT.configureTable(table);
                
                var table = $("#t12_4_1");
                
                var model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("forestarea", "forestarea", true);
                
                table.data('columnModel',model);
                
                KT.setEditable(table,true);

                table = $("#t12_4_2");
                
                model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("status", "<%=qlr.getString("data.tiers.header.status")%>", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table,true);
                                
                table = $("#t12_5_1");
                
                model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("data", "<%=qlr.getString("data.comments.header.data")%>", true);
                
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
                    <h1><%= slr.getString("q12.title")%>:<%=slr.getString("q12.body")%></h1>
                    <h2>12.1 <%=qlr.getString("fra2015.categories.title")%></h2>
                    <table>
                        <tr>
                            <th><%=qlr.getString("fra2015.categories.name")%></th>
                            <th><%=qlr.getString("fra2015.categories.definition")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.forest.permanentuse.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.forest.permanentuse.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.forest.permanentuse.estate.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.forest.permanentuse.estate.definition")%></td>
                        </tr>
                    </table>        
                        
                    <h2>12.2 <%=qlr.getString("national.data")%></h2>
                    <h3>12.2.1 <%=qlr.getString("data.sources.title")%></h3>
                    <table id="t12_2_1">

                    </table>
                    <h3>12.2.2 <%=qlr.getString("classification.title")%></h3>
                    <table id="t12_2_2">

                    </table>
                    <h3>12.2.3 <%=qlr.getString("original.data.title")%></h3>
                    <textarea id="originaldataEditor" name="originalDataEditor"></textarea>

                    <h2>12.3 <%=qlr.getString("analysis.title")%></h2>

                    <h3>12.3.1 <%=qlr.getString("adjustment.title")%></h3>
                    <textarea id="adjustmentEditor" name="adjustmentEditor"></textarea>

                    <h3>12.3.2 <%=qlr.getString("estimation.title")%></h3>
                    <textarea id="estimationEditor" name="estimationEditor"></textarea>

                    <h3>12.3.3 <%=qlr.getString("reclassification.title")%></h3>
                    <textarea id="reclassificationEditor" name="reclassificationEditor"></textarea>
                    
                    <h2>12.4 <%=qlr.getString("data.title")%></h2>                    
                    <h3>12.4.1 <%=qlr.getString("data.table12.title")%></h3>         
                    <table id="t12_4_1">
                        <tr>
                            <th><%=qlr.getString("data.table12.header.categories")%></th>
                            <th><%=qlr.getString("data.table12.header.forestarea")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.forest.permanentuse.name")%></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.forest.permanentuse.estate.name")%></td>
                            <td></td>
                        </tr>
                    </table>
                            
                    <h3><%=qlr.getString("data.tiers.title")%></h3>
                    <table id="t12_4_2">
                        <tr>
                            <th><%=qlr.getString("data.tiers.header.category")%></th>
                            <th><%=qlr.getString("data.tiers.header.status")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tiers.category.forest.permanentuse")%></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tiers.category.forest.permamentuse.estate")%></td>
                            <td></td>
                        </tr>
                    </table>                       
                        
                    <h3><%=qlr.getString("data.tier.criteria.title")%></h3>                           
                    <table id="t12_4_3">
                        <tr>
                            <th><%=qlr.getString("data.tier.criteria.header.category")%></th>
                            <th><%=qlr.getString("data.tier.criteria.header.status")%></th>
                        </tr>
                        <tr>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tiers.category.forest.permanentuse")%></li>
                                </ul>                                
                            </td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.status.t3.title")%>:<%=qlr.getString("data.tier.criteria.status.forest.permanentuse.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t2.title")%>:<%=qlr.getString("data.tier.criteria.status.forest.permanentuse.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t1.title")%>:<%=qlr.getString("data.tier.criteria.status.forest.permanentuse.t1.body")%></li>
                                </ul>
                            </td>
                        </tr>                 
                        <tr>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tiers.category.forest.permamentuse.estate")%></li>
                                </ul>                                
                            </td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.status.t3.title")%>:<%=qlr.getString("data.tier.criteria.status.forest.permanentuse.estate.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t2.title")%>:<%=qlr.getString("data.tier.criteria.status.forest.permanentuse.estate.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t1.title")%>:<%=qlr.getString("data.tier.criteria.status.forest.permanentuse.estate.t1.body")%></li>
                                </ul>
                            </td>
                        </tr>                 
                    </table>
                                
                    <h2>12.5 <%=qlr.getString("data.comments.title")%></h2>
                    <h3></h3>
                    <table id="t12_5_1">
                        <tr>
                            <th><%=qlr.getString("data.comments.header.category")%></th>
                            <th><%=qlr.getString("data.comments.header.data")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comments.category.forest.permanentuse")%></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comments.category.forest.permamentuse.estate")%></td>
                            <td></td>
                        </tr>
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

