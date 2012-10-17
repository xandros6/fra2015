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

    final boolean debug = true;

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
                
                var table = $("#t1_2_1");
                
                var model = new ColumnModel();
                
                model.addColumn("id", "#", false);
                model.addColumn("reference", "<%=qlr.getString("data.sources.header.reference")%>", true);
                model.addColumn("variable","<%=qlr.getString("data.sources.header.variable")%>", true);
                model.addColumn("year","<%=qlr.getString("data.sources.header.year")%>", true );
                model.addColumn("comments", "<%=qlr.getString("data.sources.header.comments")%>",true);
                
                table.data('columnModel', model);
                
                KT.configureTable(table);
                
                table = $("#t1_2_2");
                
                model = new ColumnModel();
                
                model.addColumn("id", "#");
                model.addColumn("class", "<%=qlr.getString("classification.header.class")%>",true);
                model.addColumn("definition", "<%=qlr.getString("classification.header.definition")%>",true);

                table.data('columnModel',model);
                
                KT.configureTable(table);
                
                table = $("#t1_4_1");
                
                model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("1990", "1990", true);
                model.addColumn("2000", "2000", true);
                model.addColumn("2005", "2005", true);
                model.addColumn("2010", "2010", true);
                model.addColumn("2015", "2015", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table, true);
                
                table = $("#t1_4_2");
                
                model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("annual_1990", "1990", true);
                model.addColumn("annual_2000", "2000", true);
                model.addColumn("annual_2005", "2005", true);
                model.addColumn("annual_2010", "2010", true);
                model.addColumn("introduced_1990", "1990", true);
                model.addColumn("introduced_2000", "2000", true);
                model.addColumn("introduced_2005", "2005", true);
                model.addColumn("introduced_2010", "2010", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table, true);
                
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
                <%
                    if (debug) {
                        System.out.println("navigation");
                    }
                %>
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
                <%
                    if (debug) {
                        System.out.println("content");
                    }
                %>
                <div class="content">
                    <h1><%= slr.getString("q1.title")%>:<%=slr.getString("q1.body")%></h1>

                    <h2>1.1 <%=qlr.getString("fra2015.categories.title")%></h2>
                    <table>
                        <tr>
                            <th><%=qlr.getString("fra2015.categories.name")%></th>
                            <th><%=qlr.getString("fra2015.categories.definition")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.forest.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.forest.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.other.wooded.land.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.other.wooded.land.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.other.land.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.other.land.definition")%></td>
                        </tr>
                    </table>

                    <h2>1.2 <%=qlr.getString("national.data")%></h2>
                    <h3>1.2.1 <%=qlr.getString("data.sources.title")%></h3>
                    <table id="t1_2_1">

                    </table>

                    <h3>1.2.2 <%=qlr.getString("classification.title")%></h3>
                    <table id="t1_2_2">

                    </table>
                    <h3>1.2.3 <%=qlr.getString("original.data.title")%></h3>
                    <textarea id="originaldataEditor" name="originalDataEditor"></textarea>

                    <h2>1.3 <%=qlr.getString("analysis.title")%></h2>

                    <h3>1.3.1 <%=qlr.getString("adjustment.title")%></h3>
                    <textarea id="adjustmentEditor" name="adjustmentEditor"></textarea>

                    <h3>1.3.2 <%=qlr.getString("estimation.title")%></h3>
                    <textarea id="estimationEditor" name="estimationEditor"></textarea>

                    <h3>1.3.3 <%=qlr.getString("reclassification.title")%></h3>
                    <textarea id="reclassificationEditor" name="reclassificationEditor"></textarea>


                    <h2>1.4 <%=qlr.getString("data.title")%></h2>
                    <h3>1.4.1 <%=qlr.getString("data.table1a.title")%></h3>
                    <table id="t1_4_1">

                        <tr style="display:none">
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                        <tr class="warning">
                            <th colspan="6">
                                <span class="warning-message">WARNING!!!
                                    Review data for years 1990 - 2000, please.</span>
                            </th>
                        </tr>
                        <tr>
                            <th rowspan="2"><%=qlr.getString("data.table1a.header.categories")%></th>
                            <th colspan="5"><%=qlr.getString("data.table1a.header.area")%></th>
                        </tr>
                        <tr>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                            <th>2015</th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.forest.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.other.wooded.land.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.other.land.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                    <h3>1.4.2 <%=qlr.getString("data.table1b.title")%></h3>
                    <table id="t1_4_2">
                        <caption><%=qlr.getString("data.table1b.caption")%></caption>
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
                            <th rowspan="2"><%=qlr.getString("data.table1b.header.categories")%></th>
                            <th colspan="4"><%=qlr.getString("data.table1b.header.establishmentloss")%></th>
                            <th colspan="4"><%=qlr.getString("data.table1b.header.ofwhich")%></th>
                        </tr>
                        <tr>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.inland.water.bodies.name")%></td>
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
                            <td><%=qlr.getString("fra2015.categories.afforestation.name")%></td>
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
                            <td><%=qlr.getString("fra2015.categories.reforestation.name")%></td>
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

                    <h3>1.4.3 <%=qlr.getString("data.tiers.title")%></h3>
                    <table>
                        <tr>
                            <th>Category</th>
                            <th>Tier for status</th>
                            <th>Tier for reported trend</th>
                        </tr>
                    </table>

                    <h3>1.4.4 <%=qlr.getString("data.tier.criteria.title")%></h3>
                    <table>
                        <tr>
                            <th>Category</th>
                            <th>Tier for status</th>
                            <th>Tier for reported trend</th>
                        </tr>
                    </table>

                    <h3>1.4.5 <%=qlr.getString("data.comments.title")%></h3>
                    <table>
                        <tr>
                            <th>Category</th>
                            <th>Comments related to data, definitions, etc.</th>
                            <th>Comments on reported status and trends</th>
                        </tr>
                    </table>

                    <h3>1.4.6 <%=qlr.getString("data.other.comments.title")%></h3>
                    <table>
                        <tr>
                            <th>Other general comments to the table</th>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                    </table>

                    <h3>1.4.7 <%=qlr.getString("data.expected.title")%></h3>
                    <table>
                        <tr>
                            <th>&nbsp;</th>
                            <th>Year</th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <%@include file="jspf/footer.jspf" %>

        <%

            if (debug) {

                strings.dumpMissingResources();
                slr.dumpMissingResources();
                qlr.dumpMissingResources();

            }

        %>

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

