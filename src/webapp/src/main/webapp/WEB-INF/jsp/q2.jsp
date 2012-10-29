<%-- 
    Document   : s1q2
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
                
                var table = $("#t2_2_1");
                
                var model = new ColumnModel();
                
                model.addColumn("id", "#", false);
                model.addColumn("reference", "<%=qlr.getString("data.sources.header.reference")%>", true);
                model.addColumn("variable","<%=qlr.getString("data.sources.header.variable")%>", true);
                model.addColumn("year","<%=qlr.getString("data.sources.header.year")%>", true );
                model.addColumn("comments", "<%=qlr.getString("data.sources.header.comments")%>",true);
                
                table.data('columnModel', model);
                
                KT.configureTable(table);                

                table = $("#t2_2_2");
                
                model = new ColumnModel();
                
                model.addColumn("id", "#");
                model.addColumn("class", "<%=qlr.getString("classification.header.class")%>",true);
                model.addColumn("definition", "<%=qlr.getString("classification.header.definition")%>",true);

                table.data('columnModel',model);
                
                KT.configureTable(table);
                
                table = $("#t2_4_1");
                
                model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("1990", "1990", true);
                model.addColumn("2000", "2000", true);
                model.addColumn("2005", "2005", true);
                model.addColumn("2010", "2010", true);
                model.addColumn("2015", "2015", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table, true);                
                
                table = $("#t2_4_2");
                
                model = new ColumnModel();
                
                model.addColumn("other_natural_1990_2000", "1990-2000", true);
                model.addColumn("planted_1990_2000", "1990-2000", true);
                model.addColumn("other_land_1990_2000", "1990-2000", true);
                model.addColumn("other_natural_2000_2010", "2000-2010", true);
                model.addColumn("planted_2000_2010", "2000-2010", true);
                model.addColumn("other_land_2000_2010", "2000-2010", true);
                model.addColumn("other_natural_2010_2015", "2010-2015", true);
                model.addColumn("planted_2010_2015", "2010-2015", true);
                model.addColumn("other_land_2010_2015", "2010-2015", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table, true);

                table = $("#t2_4_3");
                
                model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("1990", "1990", true);
                model.addColumn("2000", "2000", true);
                model.addColumn("2005", "2005", true);
                model.addColumn("2010", "2010", true);
                model.addColumn("2015", "2015", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table, true);         

                table = $("#t2_4_4");
                
                model = new ColumnModel();
                
                model.addColumn("category", "<%=qlr.getString("data.tiers.header.category")%>");
                model.addColumn("status", "<%=qlr.getString("data.tiers.header.status")%>", true);
                model.addColumn("trend", "<%=qlr.getString("data.tiers.header.trend")%>",true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table,true);
                
                table = $("#t2_5_0");
                
                model = new ColumnModel();
                
                model.addColumn("category", "<%=qlr.getString("data.comments.header.category")%>");
                model.addColumn("data", "<%=qlr.getString("data.comments.header.data")%>", true);
                model.addColumn("trends", "<%=qlr.getString("data.comments.header.trends")%>",true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table,true);
                
                table = $("#t2_5_1");
                
                model = new ColumnModel();
                
                model.addColumn("category", "<%=qlr.getString("data.other.header.title")%>",true);
                
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
                    <h1><%= slr.getString("q2.title")%>:<%=slr.getString("q2.body")%></h1>
                    <h2>2.1 <%=qlr.getString("fra2015.categories.title")%></h2>
                    <table>
                        <tr>
                            <th><%=qlr.getString("fra2015.terms.name")%></th>
                            <th><%=qlr.getString("fra2015.terms.definition")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.terms.naturallyregenforest.name")%></td>
                            <td><%=qlr.getString("fra2015.terms.naturallyregenforest.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.terms.introduciedspecies.name")%></td>
                            <td><%=qlr.getString("fra2015.terms.introduciedspecies.definition")%></td>
                        </tr>
                        <tr>
                            <th><%=qlr.getString("fra2015.categories.name")%></th>
                            <th><%=qlr.getString("fra2015.categories.definition")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.primaryforest.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.primaryforest.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.other.naturallyregenerated.forest.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.other.naturallyregenerated.forest.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.other.naturallyregenerated.forest.ofwhich.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.other.naturallyregenerated.forest.ofwhich.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.plantedforest.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.plantedforest.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.plantedforest.ofwhich.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.plantedforest.ofwhich.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.mangroves.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.mangroves.definition")%></td>
                        </tr>
                    </table>
                    <h2>2.2 <%=qlr.getString("national.data")%></h2>
                    <h3>2.2.1 <%=qlr.getString("data.sources.title")%></h3>
                    <table id="t2_2_1">

                    </table>
                    <h3>2.2.2 <%=qlr.getString("classification.title")%></h3>
                    <table id="t2_2_2">

                    </table>
                    <h3>2.2.3 <%=qlr.getString("original.data.title")%></h3>
                    <textarea id="originaldataEditor" name="originalDataEditor"></textarea>

                    <h2>2.3 <%=qlr.getString("analysis.title")%></h2>

                    <h3>2.3.1 <%=qlr.getString("adjustment.title")%></h3>
                    <textarea id="adjustmentEditor" name="adjustmentEditor"></textarea>

                    <h3>2.3.2 <%=qlr.getString("estimation.title")%></h3>
                    <textarea id="estimationEditor" name="estimationEditor"></textarea>

                    <h3>2.3.3 <%=qlr.getString("reclassification.title")%></h3>
                    <textarea id="reclassificationEditor" name="reclassificationEditor"></textarea>

                    <h2>2.4 <%=qlr.getString("data.title")%></h2>
                    <h3>2.4.1 <%=qlr.getString("data.table2a.title")%></h3>
                    <table id="t2_4_1">
                        <tr>
                            <th rowspan="2"><%=qlr.getString("data.table2a.header.categories")%></th>
                            <th colspan="5"><%=qlr.getString("data.table2a.header.area")%></th>
                        </tr>
                        <tr>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                            <th>2015</th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.primaryforest.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.other.naturallyregenerated.forest.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.other.naturallyregenerated.forest.ofwhich.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.plantedforest.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.plantedforest.ofwhich.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table2a.row.total")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                    <h3>2.4.2 <%=qlr.getString("data.table2b.title")%></h3>
                    <table id="t2_4_2">

                        <tr>
                            <th colspan="9"><%=qlr.getString("data.table2b.header.forestconverted")%></th>
                        </tr>
                        <tr>
                            <th colspan="3">1990-2000</th>
                            <th colspan="3">2000-2010</th>
                            <th colspan="3">2000-2015</th>
                        </tr>
                        <tr>
                            <th><%=qlr.getString("data.table2b.header.othernaturalregeneration")%></th>
                            <th><%=qlr.getString("data.table2b.header.planted")%></th>
                            <th><%=qlr.getString("data.table2b.header.otherland")%></th>
                            <th><%=qlr.getString("data.table2b.header.othernaturalregeneration")%></th>
                            <th><%=qlr.getString("data.table2b.header.planted")%></th>
                            <th><%=qlr.getString("data.table2b.header.otherland")%></th>
                            <th><%=qlr.getString("data.table2b.header.othernaturalregeneration")%></th>
                            <th><%=qlr.getString("data.table2b.header.planted")%></th>
                            <th><%=qlr.getString("data.table2b.header.otherland")%></th>
                        </tr>
                        <tr>
                            <td></td>
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
                    <h3>2.4.3 <%=qlr.getString("data.table2c.title")%></h3>
                    <table id="t2_4_3">
                        <tr>
                            <th rowspan="2"><%=qlr.getString("data.table2c.header.categories")%></th>
                            <th colspan="5"><%=qlr.getString("data.table2c.header.area")%></th>
                        </tr>
                        <tr>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                            <th>2015</th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.mangroves.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.mangroves.ofwhich.planted.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>                        
                    <h3>2.4.4 <%=qlr.getString("data.tiers.title")%></h3>
                    <table id="t2_4_4">
                        <tr>
                            <th><%=qlr.getString("data.tiers.header.category")%></th>
                            <th><%=qlr.getString("data.tiers.header.status")%></th>
                            <th><%=qlr.getString("data.tiers.header.trend")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.primaryforest.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.other.naturallyregenerated.forest.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td><%=qlr.getString("fra2015.categories.plantedforest.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td><%=qlr.getString("fra2015.categories.mangroves.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>                        
                    </table> 
                    <h3>2.4.5 <%=qlr.getString("data.tier.criteria.title")%></h3>
                    <table id="t2_4_5">
                        <tr>
                            <th><%=qlr.getString("data.tier.criteria.header.category")%></th>
                            <th><%=qlr.getString("data.tier.criteria.header.status")%></th>
                            <th><%=qlr.getString("data.tier.criteria.header.trend")%></th>
                        </tr>
                        <tr>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("fra2015.categories.primaryforest.name")%></li>
                                    <li><%=qlr.getString("fra2015.categories.other.naturallyregenerated.forest.name")%></li>
                                    <li><%=qlr.getString("fra2015.categories.plantedforest.name")%></li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.status.t3.title")%>:<%=qlr.getString("data.tier.criteria.status.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t2.title")%>:<%=qlr.getString("data.tier.criteria.status.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t1.title")%>:<%=qlr.getString("data.tier.criteria.status.t1.body")%></li>
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
                    </table>

                    <h3>2.5 <%=qlr.getString("data.comments.title")%></h3>
                    <table id="t2_5_0">
                        <tr>
                            <th><%=qlr.getString("data.comments.header.category")%></th>
                            <th><%=qlr.getString("data.comments.header.data")%></th>
                            <th><%=qlr.getString("data.comments.header.trends")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.primaryforest.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.other.naturallyregenerated.forest.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td><%=qlr.getString("fra2015.categories.plantedforest.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td><%=qlr.getString("fra2015.categories.mangroves.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>

                    </table>

                    <h3>2.5.1 <%=qlr.getString("data.other.comments.title")%></h3>
                    <table id="t2_5_1">
                        <tr>
                            <th><%=qlr.getString("data.other.comments.title")%></th>
                        </tr>
                        <tr>
                            <td></td>
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

