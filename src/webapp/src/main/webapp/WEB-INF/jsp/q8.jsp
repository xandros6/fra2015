<%-- 
    Document   : s1q8
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

               var table = $("#t8_2_1");
                
                var model = new ColumnModel();
                
                model.addColumn("id", "#", false);
                model.addColumn("reference", "<%=qlr.getString("data.sources.header.reference")%>", true);
                model.addColumn("variable","<%=qlr.getString("data.sources.header.variable")%>", true);
                model.addColumn("year","<%=qlr.getString("data.sources.header.year")%>", true );
                model.addColumn("comments", "<%=qlr.getString("data.sources.header.comments")%>",true);
                
                table.data('columnModel', model);
                
                KT.configureTable(table);                

                table = $("#t8_2_2");
                
                model = new ColumnModel();
                
                model.addColumn("id", "#");
                model.addColumn("class", "<%=qlr.getString("classification.header.class")%>",true);
                model.addColumn("definition", "<%=qlr.getString("classification.header.definition")%>",true);

                table.data('columnModel',model);
                
                KT.configureTable(table);
                
                var table = $("#t8_4_1");
                
                var model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("ha_2003", "ha2003", true);
                model.addColumn("nbr_2003", "nbr2003", true);
                model.addColumn("ha_2004", "ha2004", true);
                model.addColumn("nbr_2004", "nbr2004", true);
                model.addColumn("ha_2005", "ha2005", true);
                model.addColumn("nbr_2005", "nbr2005", true);
                model.addColumn("ha_2006", "ha2006", true);
                model.addColumn("nbr_2006", "nbr2006", true);
                model.addColumn("ha_2007", "ha2007", true);
                model.addColumn("nbr_2007", "nbr2007", true);
                
                table.data('columnModel',model);
                
                KT.setEditable(table,true);

                var table = $("#t8_4_1_0");
                
                var model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("ha_2008", "ha2008", true);
                model.addColumn("nbr_2008", "nbr2008", true);
                model.addColumn("ha_2009", "ha2009", true);
                model.addColumn("nbr_2009", "nbr2009", true);
                model.addColumn("ha_2010", "ha2010", true);
                model.addColumn("nbr_2010", "nbr2010", true);
                model.addColumn("ha_2010", "ha2011", true);
                model.addColumn("nbr_2011", "nbr2011", true);
                model.addColumn("ha_2012", "ha2012", true);
                model.addColumn("nbr_2012", "nbr2012", true);
                
                table.data('columnModel',model);
                
                KT.setEditable(table,true);

              var table = $("#t8_4_2");
                
                var model = new ColumnModel();
                
                model.addColumn("outbreakcategory", "<%=qlr.getString("data.table8b.header.outbreakcategory")%>", true);
                model.addColumn("descriptionname","<%=qlr.getString("data.table8b.header.descriptionname")%>", true);
                model.addColumn("yearoflatestoutbreak","<%=qlr.getString("data.table8b.header.areadamaged")%>", true );
                model.addColumn("areadamaged", "<%=qlr.getString("data.sources.header.comments")%>",true);
                
                table.data('columnModel', model);
                
                KT.configureTable(table);                
                
                table = $("#t8_4_3");
                
                model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("comment_data", "data", true);
                model.addColumn("comment_trend", "trend", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table,true);
                                
                table = $("#t8_5_1");
                
                model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("comment_data", "data", true);
                model.addColumn("comment_trend", "trend", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table,true);
                
                table = $("#t8_5_2");
                
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
                    <h1><%= slr.getString("q8.title")%>:<%=slr.getString("q8.body")%></h1>
                    <h2>8.1 <%=qlr.getString("fra2015.categories.title")%></h2>
                    <table>
                        <tr>
                            <th><%=qlr.getString("fra2015.categories.name")%></th>
                            <th><%=qlr.getString("fra2015.categories.definition")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.numberoffires.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.numberoffires.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.burnedarea.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.burnedarea.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.outbreaks.insects.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.outbreaks.insects.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.outbreaks.diseases.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.outbreaks.diseases.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.severeweatherevents.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.severeweatherevents.definition")%></td>
                        </tr>
                    </table>
                        
                    <h2>8.2 <%=qlr.getString("national.data")%></h2>
                    <h3>8.2.1 <%=qlr.getString("data.sources.title")%></h3>
                    <table id="t8_2_1">

                    </table>
                    <h3>8.2.2 <%=qlr.getString("classification.title")%></h3>
                    <table id="t8_2_2">

                    </table>
                    <h3>8.2.3 <%=qlr.getString("original.data.title")%></h3>
                    <textarea id="originaldataEditor" name="originalDataEditor"></textarea>

                    <h2>8.3 <%=qlr.getString("analysis.title")%></h2>

                    <h3>8.3.1 <%=qlr.getString("adjustment.title")%></h3>
                    <textarea id="adjustmentEditor" name="adjustmentEditor"></textarea>

                    <h3>8.3.2 <%=qlr.getString("estimation.title")%></h3>
                    <textarea id="estimationEditor" name="estimationEditor"></textarea>

                    <h3>8.3.3 <%=qlr.getString("reclassification.title")%></h3>
                    <textarea id="reclassificationEditor" name="reclassificationEditor"></textarea>
                    
                    <h2>8.4 <%=qlr.getString("data.title")%></h2>
                    <h3>8.4.1 <%=qlr.getString("data.table8a.title")%></h3>                        
                    <table id="t8_4_1">
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
                            <th rowspan="3"><%=qlr.getString("data.table8a.header.categories")%></th>
                            <th colspan="10"><%=qlr.getString("data.table8a.header.numberoffiresandarea")%></th>
                        </tr>
                        <tr>
                            <th colspan="2">2003</th>
                            <th colspan="2">2004</th>
                            <th colspan="2">2005</th>
                            <th colspan="2">2006</th>
                            <th colspan="2">2007</th>
                        </tr>
                        <tr>
                            <th><%=qlr.getString("data.table8a.header.area")%></th>
                            <th>#</th>                            
                            <th><%=qlr.getString("data.table8a.header.area")%></th>
                            <th>#</th>                            
                            <th><%=qlr.getString("data.table8a.header.area")%></th>
                            <th>#</th>                            
                            <th><%=qlr.getString("data.table8a.header.area")%></th>
                            <th>#</th>                            
                            <th><%=qlr.getString("data.table8a.header.area")%></th>
                            <th>#</th>                            
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table8a.row.category.burnedarea.total")%></td>
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
                            <td><%=qlr.getString("data.table8a.row.category.burnedarea.forest")%></td>
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
                    <table id="t8_4_1_0">
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
                            <th rowspan="3"><%=qlr.getString("data.table8a.header.categories")%></th>
                            <th colspan="10"><%=qlr.getString("data.table8a.header.numberoffiresandarea")%></th>
                        </tr>
                        <tr>
                            <th colspan="2">2008</th>
                            <th colspan="2">2009</th>
                            <th colspan="2">2010</th>
                            <th colspan="2">2011</th>
                            <th colspan="2">2012</th>
                        </tr>
                        <tr>
                            <th><%=qlr.getString("data.table8a.header.area")%></th>
                            <th>#</th>                            
                            <th><%=qlr.getString("data.table8a.header.area")%></th>
                            <th>#</th>                            
                            <th><%=qlr.getString("data.table8a.header.area")%></th>
                            <th>#</th>                            
                            <th><%=qlr.getString("data.table8a.header.area")%></th>
                            <th>#</th>                            
                            <th><%=qlr.getString("data.table8a.header.area")%></th>
                            <th>#</th>                            
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table8a.row.category.burnedarea.total")%></td>
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
                            <td><%=qlr.getString("data.table8a.row.category.burnedarea.forest")%></td>
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
                            
                    <h3>8.4.2 <%=qlr.getString("data.table8b.title")%></h3>                        
                    <table id="t8_4_2">
                        <caption><%=qlr.getString("data.table8b.caption")%></caption>
                    </table>       

                    <h3></h3>
                    <table>
                        <tr style="display:none">
                            <th></th>
                            <th></th>
                        </tr>
                            
                            <tr>
                                <th><%=qlr.getString("data.table8b.header.outbreakcategory")%></th>
                                <th></th>
                            </tr>
                            <tr>                            
                                <td><%=qlr.getString("data.table8b.row.category.insects")%></td>
                                <td></td>
                            </tr>
                            <tr>                            
                                <td><%=qlr.getString("data.table8b.row.category.diseases")%></td>
                                <td></td>
                            </tr>
                            <tr>                            
                                <td><%=qlr.getString("data.table8b.row.category.severeweatherevents")%></td>
                                <td></td>
                            </tr>
                    </table>
                            
                    <h3><%=qlr.getString("data.tiers.title")%></h3>
                    <table id="t8_4_3">
                        <tr>
                            <th><%=qlr.getString("data.tiers.header.category")%></th>
                            <th><%=qlr.getString("data.tiers.header.status")%></th>
                            <th><%=qlr.getString("data.tiers.header.trend")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tiers.category.areaaffectedbyfire")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tiers.category.insects")%></li>
                                    <li><%=qlr.getString("data.tiers.category.diseases")%></li>
                                    <li><%=qlr.getString("data.tiers.category.severeweatherevents")%></li>
                                </ul>                                
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>                       
                        
                    <h3><%=qlr.getString("data.tier.criteria.title")%></h3>                           
                    <table id="t8_4_4">
                        <tr>
                            <th><%=qlr.getString("data.tier.criteria.header.category")%></th>
                            <th><%=qlr.getString("data.tier.criteria.header.status")%></th>
                            <th><%=qlr.getString("data.tier.criteria.header.trend")%></th>
                        </tr>
                        <tr>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tiers.category.areaaffectedbyfire")%></li>
                                </ul>                                
                            </td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.status.t3.title")%>:<%=qlr.getString("data.tier.criteria.areaaffectedbyfire.status.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t2.title")%>:<%=qlr.getString("data.tier.criteria.areaaffectedbyfire.status.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t1.title")%>:<%=qlr.getString("data.tier.criteria.areaaffectedbyfire.status.t1.body")%></li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t3.title")%>:<%=qlr.getString("data.tier.criteria.areaaffectedbyfire.trend.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t2.title")%>:<%=qlr.getString("data.tier.criteria.areaaffectedbyfire.trend.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t1.title")%>:<%=qlr.getString("data.tier.criteria.areaaffectedbyfire.trend.t1.body")%></li>
                                </ul>
                            </td>
                        </tr>                 
                        <tr>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tiers.category.insects")%></li>
                                    <li><%=qlr.getString("data.tiers.category.diseases")%></li>
                                    <li><%=qlr.getString("data.tiers.category.severeweatherevents")%></li>
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
                                
                    <h2>8.5 <%=qlr.getString("data.comments.title")%></h2>
                    <h3></h3>
                    <table id="t8_5_1">
                        <tr>
                            <th><%=qlr.getString("data.comments.header.category")%></th>
                            <th><%=qlr.getString("data.comments.header.data")%></th>
                            <th><%=qlr.getString("data.comments.header.trend")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comments.category.areaaffectedbyfire")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comments.category.insects")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comments.category.diseases")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comments.category.severeweatherevents")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                    
                    <h3></h3>
                    <table id="t8_5_2">
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

