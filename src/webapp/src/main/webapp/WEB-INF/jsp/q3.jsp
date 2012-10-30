<%-- 
    Document   : s1q3
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
              var table = $("#t3_2_1");
                
                var model = new ColumnModel();
                
                model.addColumn("id", "#", false);
                model.addColumn("reference", "<%=qlr.getString("data.sources.header.reference")%>", true);
                model.addColumn("variable","<%=qlr.getString("data.sources.header.variable")%>", true);
                model.addColumn("year","<%=qlr.getString("data.sources.header.year")%>", true );
                model.addColumn("comments", "<%=qlr.getString("data.sources.header.comments")%>",true);
                
                table.data('columnModel', model);
                
                KT.configureTable(table);
                
                table = $("#t3_2_2");
                
                model = new ColumnModel();
                
                model.addColumn("id", "#");
                model.addColumn("class", "<%=qlr.getString("classification.header.class")%>",true);
                model.addColumn("definition", "<%=qlr.getString("classification.header.definition")%>",true);

                table.data('columnModel',model);
                
                KT.configureTable(table);                
                
                table = $("#t3_4_1");
                
                model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("forest_1990", "1990", true);
                model.addColumn("forest_2000", "2000", true);
                model.addColumn("forest_2005", "2005", true);
                model.addColumn("forest_2010", "2010", true);
                model.addColumn("forest_2015", "2015", true);
                model.addColumn("other_wooded_1990", "1990", true);
                model.addColumn("other_wooded_2000", "2000", true);
                model.addColumn("other_wooded_2005", "2005", true);
                model.addColumn("other_wooded_2010", "2010", true);
                model.addColumn("other_wooded_2015", "2015", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table, true);
                
                table = $("#t3_4_2");
                
                model = new ColumnModel();
                
                model.addColumn("rank");
                model.addColumn("name_scientific", "scientific", true);
                model.addColumn("name_common", "common", true);
                model.addColumn("growingstock_1990", "1990", true);
                model.addColumn("growingstock_2000", "2000", true);
                model.addColumn("growingstock_2005", "2005", true);
                model.addColumn("growingstock_2010", "2010", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table, true);
                
                table = $("#t3_4_2_b");
                
                model = new ColumnModel();
                
                model.addColumn("item");
                model.addColumn("item_value", "value", true)
                model.addColumn("complementary_information", "complementary", true)
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table, true);
                
                table = $("#t3_4_3");
                
                model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("mai_1990", "1990", true);
                model.addColumn("mai_2000", "2000", true);
                model.addColumn("mai_2005", "2005", true);
                model.addColumn("mai_2010", "2010", true);
                model.addColumn("mai_2015", "2015", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table, true);
                
                table = $("#t3_4_4");
                
                model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("biomass_forest_1990", "1990", true);
                model.addColumn("biomass_forest_2000", "2000", true);
                model.addColumn("biomass_forest_2005", "2005", true);
                model.addColumn("biomass_forest_2010", "2010", true);
                model.addColumn("biomass_forest_2015", "2015", true);
                model.addColumn("biomass_owl_1990", "1990", true);
                model.addColumn("biomass_owl_2000", "2000", true);
                model.addColumn("biomass_owl_2005", "2005", true);
                model.addColumn("biomass_owl_2010", "2010", true);
                model.addColumn("biomass_owl_2015", "2015", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table, true);

                table = $("#t3_4_5");
                
                model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("carbon_forest_1990", "1990", true);
                model.addColumn("carbon_forest_2000", "2000", true);
                model.addColumn("carbon_forest_2005", "2005", true);
                model.addColumn("carbon_forest_2010", "2010", true);
                model.addColumn("carbon_forest_2015", "2015", true);
                model.addColumn("carbon_owl_1990", "1990", true);
                model.addColumn("carbon_owl_2000", "2000", true);
                model.addColumn("carbon_owl_2005", "2005", true);
                model.addColumn("carbon_owl_2010", "2010", true);
                model.addColumn("carbon_owl_2015", "2015", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table, true);

                table = $("#t3_4_6");
                
                model = new ColumnModel();
                
                model.addColumn("category", "<%=qlr.getString("data.tiers.header.category")%>");
                model.addColumn("status", "<%=qlr.getString("data.tiers.header.status")%>", true);
                model.addColumn("trend", "<%=qlr.getString("data.tiers.header.trend")%>",true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table,true);
                
                table = $("#t3_5_1");
                
                model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("comment_data", "data", true);
                model.addColumn("comment_trend", "trend", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table,true);
                
                table = $("#t3_5_2");
                
                model = new ColumnModel();
                
                model.addColumn("comments", "comments", true);
                
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
                    <h1><%= slr.getString("q3.title")%>:<%=slr.getString("q3.body")%></h1>
                    <h2>3.1 <%=qlr.getString("fra2015.categories.title")%></h2>
                    <table>
                        <tr>
                            <th><%=qlr.getString("fra2015.categories.name")%></th>
                            <th><%=qlr.getString("fra2015.categories.definition")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.growingstock.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.growingstock.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.netannualincrement.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.netannualincrement.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.biomass.aboveground.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.biomass.aboveground.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.biomass.belowground.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.biomass.belowground.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.deadwood.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.deadwood.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.biomass.aboveground.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.biomass.aboveground.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.biomass.belowground.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.biomass.belowground.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.carbon.deadwood.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.carbon.deadwood.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.carbon.litter.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.carbon.litter.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.carbon.soil.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.carbon.soil.definition")%></td>
                        </tr>
                    </table>
                    <h2>3.2 <%=qlr.getString("national.data")%></h2>
                    <h3>3.2.1 <%=qlr.getString("data.sources.title")%></h3>
                    <table id="t3_2_1">

                    </table>

                    <h3>3.2.2 <%=qlr.getString("classification.title")%></h3>
                    <table id="t3_2_2">

                    </table>
                    <h3>3.2.3 <%=qlr.getString("original.data.title")%></h3>
                    <textarea id="originaldataEditor" name="originalDataEditor"></textarea>

                    <h2>3.3 <%=qlr.getString("analysis.title")%></h2>

                    <h3>3.3.1 <%=qlr.getString("adjustment.title")%></h3>
                    <textarea id="adjustmentEditor" name="adjustmentEditor"></textarea>

                    <h3>3.3.2 <%=qlr.getString("estimation.title")%></h3>
                    <textarea id="estimationEditor" name="estimationEditor"></textarea>

                    <h3>3.3.3 <%=qlr.getString("reclassification.title")%></h3>
                    <textarea id="reclassificationEditor" name="reclassificationEditor"></textarea>
                    
                    <h2>3.4 <%=qlr.getString("data.title")%></h2>
                    <h3>3.4.1 <%=qlr.getString("data.table3a.title")%></h3>
                    <table id="t3_4_1">
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
                            <th></th>
                            <th></th>
                        </tr>
                        <tr>
                            <th rowspan="3" ><%=qlr.getString("data.table3a.header.categories")%></th>
                            <th colspan="10"><%=qlr.getString("data.table3a.header.growingstockvolume")%></th>
                        </tr>
                        <tr>
                            <th colspan="5"><%=qlr.getString("data.table3a.header.forest.name")%></th>
                            <th colspan="5"><%=qlr.getString("data.table3a.header.other.wooded.land.name")%></th>
                        </tr>
                        <tr>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                            <th>2015</th>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                            <th>2015</th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table3a.row.totalgrowingstock")%></td>
                            <td></td>
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
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.totalgrowingstock.ofwichconiferous.name")%></td>
                            <td></td>
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
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.totalgrowingstock.ofwichbroadleaved.name")%></td>
                            <td></td>
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
                            
                    <h3>3.4.2 <%=qlr.getString("data.table3b.title")%></h3>
                    <table id="t3_4_2">
                        <caption><%=qlr.getString("data.table3b.caption")%></caption>
                        <tr style="display:none">
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                        <tr>
                            <th colspan="3"><%=qlr.getString("data.table3b.header.categories")%></th>
                            <th colspan="4"><%=qlr.getString("data.table3b.header.growingstock")%></th>
                        </tr>
                        <tr>
                            <th ><%=qlr.getString("data.table3b.header.rank")%></th>
                            <th ><%=qlr.getString("data.table3b.header.name.scientific")%></th>
                            <th ><%=qlr.getString("data.table3b.header.name.common")%></th>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table3b.row.rank.1st")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table3b.row.rank.2nd")%></td>                          
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table3b.row.rank.3rd")%></td>                          
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table3b.row.rank.4th")%></td>                          
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table3b.row.rank.5th")%></td>                          
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table3b.row.rank.6th")%></td>                          
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table3b.row.rank.7th")%></td>                          
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table3b.row.rank.8th")%></td>                          
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table3b.row.rank.9th")%></td>                          
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table3b.row.rank.10th")%></td>                          
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table3b.row.remaining")%></td>                          
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>                            
                        <tr>
                            <td><%=qlr.getString("data.table3b.row.total")%></td>                          
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>

                    <h3><%=qlr.getString("data.tableprefilled.title")%></h3>
                    <table id="t3_4_2_b">
                        <caption><%=qlr.getString("data.tableprefilled.caption")%></caption>
                       <tr style="display:none">
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                        <tr>
                            <th><%=qlr.getString("data.tableprefilled.header.item")%></th>
                            <th><%=qlr.getString("data.tableprefilled.header.value")%></th>
                            <th><%=qlr.getString("data.tableprefilled.header.complementaryinfo")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tableprefilled.items.mindiameter.breast")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tableprefilled.items.mindiameter.topend")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tableprefilled.items.mindiameter.branch")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tableprefilled.items.volume")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                    <h3><%=qlr.getString("data.tableprefilled.note")%></h3>
                     
                    <h3>3.4.3 <%=qlr.getString("data.table3c.title")%></h3>
                    <table id="t3_4_3">
                        <tr style="display:none">
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                        <tr>
                            <th rowspan="3"><%=qlr.getString("data.table3c.header.category")%></th>
                            <th colspan="5"><%=qlr.getString("data.table3c.header.mai")%></th>
                        </tr>
                        <tr>
                            <th colspan="5"><%=qlr.getString("data.table3c.header.forest.name")%></th>
                        </tr>
                        <tr>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                            <th>2015</th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.netannualincrement.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.netannualincrement.ofwichconiferous.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.netannualincrement.ofwichbroadleaved.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>                            
                    <h3>3.4.4 <%=qlr.getString("data.table3d.title")%></h3>
                    <table id="t3_4_4">
                        <tr>
                            <th rowspan="3"><%=qlr.getString("data.table3d.header.category")%></th>
                            <th colspan="10"><%=qlr.getString("data.table3d.header.biomass")%></th>
                        </tr>
                        <tr>
                            <th colspan="5"><%=qlr.getString("data.table3d.header.forest.name")%></th>
                            <th colspan="5"><%=qlr.getString("data.table3d.header.other.wooded.land.name")%></th>
                        </tr>
                        <tr>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                            <th>2015</th>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                            <th>2015</th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.biomass.aboveground.name")%></td>
                            <td></td>
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
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.biomass.belowground.name")%></td>
                            <td></td>
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
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.deadwood.name")%></td>
                            <td></td>
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
                        <tr>
                            <td><%=qlr.getString("data.table3d.row.total")%></td>
                            <td></td>
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
                    <h3>3.4.5 <%=qlr.getString("data.table3e.title")%></h3>
                    <table id="t3_4_5">
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
                            <th></th>
                            <th></th>
                        </tr>
                        <tr>
                            <th rowspan="3"><%=qlr.getString("data.table3e.header.category")%></th>
                            <th colspan="10"><%=qlr.getString("data.table3e.header.carbon")%></th>
                        </tr>
                        <tr>
                            <th colspan="5"><%=qlr.getString("data.table3e.header.forest.name")%></th>
                            <th colspan="5"><%=qlr.getString("data.table3e.header.other.wooded.land.name")%></th>
                        </tr>
                        <tr>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                            <th>2015</th>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                            <th>2015</th>
                        </tr>
                        <tr>
                            <td ><%=qlr.getString("fra2015.categories.biomass.aboveground.carbon.name")%></td>
                            <td></td>
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
                        <tr>
                            <td ><%=qlr.getString("fra2015.categories.biomass.belowground.carbon.name")%></td>
                            <td></td>
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
                        <tr>
                            <td ><%=qlr.getString("data.table3e.row.subtotal.livingbiomass")%></td>
                            <td></td>
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
                        <tr>
                            <td ><%=qlr.getString("fra2015.categories.carbon.deadwood.name")%></td>
                            <td></td>
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
                        <tr>
                            <td ><%=qlr.getString("fra2015.categories.carbon.litter.name")%></td>
                            <td></td>
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
                        <tr>
                            <td ><%=qlr.getString("fra2015.categories.carbon.soil.name")%></td>
                            <td></td>
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
                        <tr>
                            <td ><%=qlr.getString("data.table3e.row.total")%></td>
                            <td></td>
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
                            
                    <h3>3.4.6 <%=qlr.getString("data.tiers.title")%></h3>
                    <table id="t3_4_6">
                        <tr>
                            <th><%=qlr.getString("data.tiers.header.category")%></th>
                            <th><%=qlr.getString("data.tiers.header.status")%></th>
                            <th><%=qlr.getString("data.tiers.header.trend")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tiers.category.totalgrowingstock.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tiers.category.netannualincrement.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td><%=qlr.getString("data.tiers.category.biomass.aboveground.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td><%=qlr.getString("data.tiers.category.biomass.belowground.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td><%=qlr.getString("data.tiers.category.deadwood.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td><%=qlr.getString("fra2015.categories.biomass.aboveground.carbon.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td><%=qlr.getString("data.tiers.category.carbon.biomass.aboveground.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td><%=qlr.getString("data.tiers.category.carbon.biomass.belowground.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td><%=qlr.getString("data.tiers.category.carbon.biomass.deadwoodandlitter.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td><%=qlr.getString("data.tiers.category.carbon.soil.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>

                    </table>
                    <h3>3.4.7 <%=qlr.getString("data.tier.criteria.title")%></h3>
                    <table id="t3_4_7">
                        <tr>
                            <th><%=qlr.getString("data.tier.criteria.header.category")%></th>
                            <th><%=qlr.getString("data.tier.criteria.header.status")%></th>
                            <th><%=qlr.getString("data.tier.criteria.header.trend")%></th>
                        </tr>
                        <tr>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tiers.category.totalgrowingstock.name")%></li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.status.t3.title")%>:<%=qlr.getString("data.tier.criteria.status.totalgrowingstock.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t2.title")%>:<%=qlr.getString("data.tier.criteria.status.totalgrowingstock.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t1.title")%>:<%=qlr.getString("data.tier.criteria.status.totalgrowingstock.t1.body")%></li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t3.title")%>:<%=qlr.getString("data.tier.criteria.trend.totalgrowingstock.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t2.title")%>:<%=qlr.getString("data.tier.criteria.trend.totalgrowingstock.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t1.title")%>:<%=qlr.getString("data.tier.criteria.trend.totalgrowingstock.t1.body")%></li>
                                </ul>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tiers.category.netannualincrement.name")%></li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.status.t3.title")%>:<%=qlr.getString("data.tier.criteria.status.netannualincrement.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t2.title")%>:<%=qlr.getString("data.tier.criteria.status.netannualincrement.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t1.title")%>:<%=qlr.getString("data.tier.criteria.status.netannualincrement.t1.body")%></li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t3.title")%>:<%=qlr.getString("data.tier.criteria.trend.netannualincrement.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t2.title")%>:<%=qlr.getString("data.tier.criteria.trend.netannualincrement.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t1.title")%>:<%=qlr.getString("data.tier.criteria.trend.netannualincrement.t1.body")%></li>
                                </ul>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tiers.category.biomass.name")%></li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.status.t3.title")%>:<%=qlr.getString("data.tier.criteria.status.biomass.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t2.title")%>:<%=qlr.getString("data.tier.criteria.status.biomass.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t1.title")%>:<%=qlr.getString("data.tier.criteria.status.biomass.t1.body")%></li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t3.title")%>:<%=qlr.getString("data.tier.criteria.trend.biomass.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t2.title")%>:<%=qlr.getString("data.tier.criteria.trend.biomass.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t1.title")%>:<%=qlr.getString("data.tier.criteria.trend.biomass.t1.body")%></li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tiers.category.carbon.biomass.aboveground.name")%></li>
                                    <li><%=qlr.getString("data.tiers.category.carbon.biomass.belowground.name")%></li>
                                    <li><%=qlr.getString("data.tiers.category.carbon.biomass.deadwoodandlitter.name")%></li>
                                    <li><%=qlr.getString("data.tiers.category.carbon.soil.name")%></li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.status.t3.title")%>:<%=qlr.getString("data.tier.criteria.status.carbon.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t2.title")%>:<%=qlr.getString("data.tier.criteria.status.carbon.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t1.title")%>:<%=qlr.getString("data.tier.criteria.status.carbon.t1.body")%></li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t3.title")%>:<%=qlr.getString("data.tier.criteria.trend.carbon.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t2.title")%>:<%=qlr.getString("data.tier.criteria.trend.carbon.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t1.title")%>:<%=qlr.getString("data.tier.criteria.trend.carbon.t1.body")%></li>
                                </ul>
                            </td>
                        </tr>
                    </table>
                    <h3>3.5 <%=qlr.getString("data.comments.title")%></h3>
                    <table id="t3_5_1">
                        <tr>
                            <th><%=qlr.getString("data.comments.header.category")%></th>
                            <th><%=qlr.getString("data.comments.header.data")%></th>
                            <th><%=qlr.getString("data.comments.header.trend")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comments.row.growingstock.total")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comments.row.growingstock.coniferousbroadleaved")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comments.row.growingstock.composition")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.netannualincrement.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.biomass.aboveground.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.biomass.belowground.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.deadwood.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.biomass.aboveground.carbon.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.biomass.belowground.carbon.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.carbon.deadwood.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.carbon.litter.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.carbon.soil.name")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                    <table id="t3_5_2">
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

