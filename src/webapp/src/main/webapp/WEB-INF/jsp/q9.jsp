<%-- 
    Document   : s1q9
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

                var table = $("#t9_1_1");
                
                var model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("reducedcanopy_area", "reducedcanopyarea", true);
                
                table.data('columnModel',model);
                
                KT.setEditable(table,true);

                var table = $("#t9_2_1");
                
                var model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("reducedcanopy_area", "reducedcanopyarea", true);
                
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
                    <h1><%= slr.getString("q9.title")%>:<%=slr.getString("q9.body")%></h1>
                    <h2>9.1 <%=qlr.getString("fra2015.categories.title")%></h2>
                    <table>
                        <tr>
                            <th><%=qlr.getString("fra2015.categories.name")%></th>
                            <th><%=qlr.getString("fra2015.categories.definition")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.canopycoverreduction.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.canopycoverreduction.definition")%></td>
                        </tr>
                    </table>        
                        
                    <table>
                        <tr>
                            <td>
                                <h3>9.1.1<%=qlr.getString("data.table9.title")%></h3>
                                <table id="t9_1_1">
                                    <tr>
                                        <th><%=qlr.getString("data.table9.header.category")%></th>
                                        <th><%=qlr.getString("data.table9.header.reducedcanopycoverarea")%></th>
                                    </tr>
                                        <td><%=qlr.getString("fra2015.categories.canopycoverreduction.name")%></td>
                                        <td></td>
                                </table>
                            </td>
                            <td></td>
                        </tr>

                        <tr>
                            <td>
                                <h3><%=qlr.getString("data.tier.criteria.title")%></h3>
                                <table>
                                    <tr>
                                        <th><%=qlr.getString("data.tier.criteria.header.category")%></th>
                                        <th><%=qlr.getString("data.tier.criteria.header.trend")%></th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <ul>
                                                <li><%=qlr.getString("fra2015.categories.canopycoverreduction.name")%></li>
                                            </ul>                                
                                        </td>
                                        <td>
                                            <ul>
                                                <li><%=qlr.getString("data.tier.criteria.trend.t3.title")%>:<%=qlr.getString("data.tier.criteria.trend.t3.body")%></li>
                                                <li><%=qlr.getString("data.tier.criteria.trend.t2.title")%>:<%=qlr.getString("data.tier.criteria.trend.t2.body")%></li>
                                                <li><%=qlr.getString("data.tier.criteria.trend.t1.title")%>:<%=qlr.getString("data.tier.criteria.trend.t1.body")%></li>
                                            </ul>
                                        </td>
                                    </tr>                                       
                                </table>
                            </td>
                            <td></td>
                        </tr>
                    </table>
                    <h2>9.2 <%=qlr.getString("data.comments.title")%></h2>
                    <h3></h3>
                    <table id="t9_2_1">
                        <tr>
                            <th><%=qlr.getString("data.comments.header.category")%></th>
                            <th><%=qlr.getString("data.comments.header.comment")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.canopycoverreduction.name")%></td>
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

