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

                var table = $("#t15_1_1");
                
                var model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("involvement_type","involvement_type", true);
                
                table.data('columnModel',model);
                
                KT.setEditable(table,true);

                
                var table = $("#t15_1_2");
                
                var model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("data.tiers.header.status","data.tiers.header.status", true);
                
                table.data('columnModel',model);
                
                KT.setEditable(table,true);

                var table = $("#t15_2_1");
                
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
                    <h1><%= slr.getString("q15.title")%>:<%=slr.getString("q15.body")%></h1>
                    <h2>15.1 <%=qlr.getString("fra2015.categories.title")%></h2>
                    <table>
                        <tr>
                            <th><%=qlr.getString("fra2015.categories.name")%></th>
                            <th><%=qlr.getString("fra2015.categories.definition")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.stakeholderinvolvement.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.stakeholderinvolvement.definition")%></td>
                        </tr>
                    </table>                    

                    <h2></h2>                    
                    <h3>15.1.1 <%=qlr.getString("data.table15.title")%></h3>         
                    <table id="t15_1_1">
                        <tr style="display:none">
                            <th></th>
                        </tr>
                        <tr>
                            <th colspan="2"><%=qlr.getString("data.table15.header")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table15.values.planningphase")%></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table15.values.operationsphase")%></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table15.values.reviewoperations")%></td>
                            <td></td>
                        </tr>
                    </table>    
                            
                    <h3><%=qlr.getString("data.tiers.title")%></h3>
                    <table id="t15_1_2">
                        <tr style="display:none">
                            <th></th>
                        </tr>
                        <tr>
                            <th><%=qlr.getString("data.tiers.header.category")%></th>
                            <th><%=qlr.getString("data.tiers.header.status")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tiers.category.stakeholderinputs")%></td>
                            <td></td>
                        </tr>
                    </table>           
                            
                    <h3><%=qlr.getString("data.tier.criteria.title")%></h3>                           
                    <table id="t15_1_3">
                        <tr>
                            <th><%=qlr.getString("data.tier.criteria.header.category")%></th>
                            <th><%=qlr.getString("data.tier.criteria.header.status")%></th>
                        </tr>
                        <tr>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tiers.category.stakeholderinputs")%></li>
                                </ul>                                
                            </td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.status.t3.title")%>:<%=qlr.getString("data.tier.criteria.stakeholderinputs.status.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t2.title")%>:<%=qlr.getString("data.tier.criteria.stakeholderinputs.status.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t1.title")%>:<%=qlr.getString("data.tier.criteria.stakeholderinputs.status.t1.body")%></li>
                                </ul>
                            </td>
                        </tr>                 
   
                    </table>
                        
                    <h2>15.2 <%=qlr.getString("data.comments.title")%></h2>
                    <h3></h3>
                    <table id="t15_2_1">

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

