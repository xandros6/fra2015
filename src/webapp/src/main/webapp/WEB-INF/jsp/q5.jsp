<%-- 
    Document   : s1q5
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
                

               var table = $("#t5_2_1");
                
                var model = new ColumnModel();
                
                model.addColumn("id", "#", false);
                model.addColumn("reference", "<%=qlr.getString("data.sources.header.reference")%>", true);
                model.addColumn("variable","<%=qlr.getString("data.sources.header.variable")%>", true);
                model.addColumn("year","<%=qlr.getString("data.sources.header.year")%>", true );
                model.addColumn("comments", "<%=qlr.getString("data.sources.header.comments")%>",true);
                
                table.data('columnModel', model);
                
                KT.configureTable(table);                

                table = $("#t5_2_2");
                
                model = new ColumnModel();
                
                model.addColumn("id", "#");
                model.addColumn("class", "<%=qlr.getString("classification.header.class")%>",true);
                model.addColumn("definition", "<%=qlr.getString("classification.header.definition")%>",true);

                table.data('columnModel',model);
                
                KT.configureTable(table);
                
                table = $("#t5_4_1");
                
                model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("1990", "1990", true);
                model.addColumn("2000", "2000", true);
                model.addColumn("2005", "2005", true);
                model.addColumn("2010", "2010", true);
                model.addColumn("2015", "2015", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table, true);                                
                
                table = $("#t5_4_1_other");
                
                model = new ColumnModel();
                
                model.addColumn("other", "other", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table, true);                                
                
                table = $("#t5_4_2");
                
                model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("1990", "1990", true);
                model.addColumn("2000", "2000", true);
                model.addColumn("2005", "2005", true);
                model.addColumn("2010", "2010", true);
                model.addColumn("2015", "2015", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table, true);                                
                
                table = $("#t5_4_2_other");
                
                model = new ColumnModel();
                
                model.addColumn("other", "other", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table, true);                                
                
                table = $("#t5_5_1");
                
                model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("comment_data", "data", true);
                model.addColumn("comment_trend", "trend", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table,true);
                
                table = $("#t5_5_2");
                
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
                    <h1><%= slr.getString("q5.title")%>:<%=slr.getString("q5.body")%></h1>

                    <h2>5.1 <%=qlr.getString("fra2015.categories.title")%></h2>
                    <table>
                        <tr>
                            <th><%=qlr.getString("fra2015.categories.name")%></th>
                            <th><%=qlr.getString("fra2015.categories.definition")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.protection.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.protection.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.protection.cleanproduction.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.protection.cleanproduction.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.protection.coastalstabilization.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.protection.coastalstabilization.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.protection.desertificationcontrol.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.protection.desertificationcontrol.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.protection.avalanchecontrol.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.protection.avalanchecontrol.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.protection.erosionflood.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.protection.erosionflood.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.protection.other.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.protection.other.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.ecosystemservice.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.ecosystemservice.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.ecosystemservice.publicrecreation.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.ecosystemservice.publicrecreation.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.ecosystemservice.carbonstorage.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.ecosystemservice.carbonstorage.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.ecosystemservice.spiritualcultural.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.ecosystemservice.spiritualcultural.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.ecosystemservice.other.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.ecosystemservice.other.definition")%></td>
                        </tr>
                    </table>
                        
                    <h2>5.2 <%=qlr.getString("national.data")%></h2>
                    <h3>5.2.1 <%=qlr.getString("data.sources.title")%></h3>
                    <table id="t5_2_1">

                    </table>
                    <h3>5.2.2 <%=qlr.getString("classification.title")%></h3>
                    <table id="t5_2_2">

                    </table>
                    <h3>5.2.3 <%=qlr.getString("original.data.title")%></h3>
                    <textarea id="originaldataEditor" name="originalDataEditor"></textarea>

                    <h2>5.3 <%=qlr.getString("analysis.title")%></h2>

                    <h3>5.3.1 <%=qlr.getString("adjustment.title")%></h3>
                    <textarea id="adjustmentEditor" name="adjustmentEditor"></textarea>

                    <h3>5.3.2 <%=qlr.getString("estimation.title")%></h3>
                    <textarea id="estimationEditor" name="estimationEditor"></textarea>

                    <h3>5.3.3 <%=qlr.getString("reclassification.title")%></h3>
                    <textarea id="reclassificationEditor" name="reclassificationEditor"></textarea>

                    <h2>5.4 <%=qlr.getString("data.title")%></h2>
                    <h3>5.4.1 <%=qlr.getString("data.table5a.title")%></h3>                        
                    <table id="t5_4_1">
                        <caption><%=qlr.getString("data.table5a.caption")%></caption>
                        <tr>
                            <th rowspan="2"><%=qlr.getString("data.table5a.header.categories")%></th>
                            <th colspan="5"><%=qlr.getString("data.table5a.header.forestarea")%></th>
                        </tr>
                        <tr>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                            <th>2015</th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.protection.name")%>(1)</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.protection.cleanproduction.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.protection.coastalstabilization.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.protection.desertificationcontrol.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.protection.avalanchecontrol.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.protection.erosionflood.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.protection.other.name")%>
                                <%=qlr.getString("data.table5a.other.detailed")%>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                            
                    <h3></h3>
                    <table id="t5_4_1_other">
                        <tr>
                            <th><%=qlr.getString("data.table5a.other.header")%></th>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                    </table>
                        
                    <h3>5.4.2 <%=qlr.getString("data.table5a.title")%></h3>                        
                    <table id="t5_4_2">
                        <caption><%=qlr.getString("data.table5a.caption")%></caption>
                        <tr>
                            <th rowspan="2"><%=qlr.getString("data.table5a.header.categories")%></th>
                            <th colspan="5"><%=qlr.getString("data.table5a.header.forestarea")%></th>
                        </tr>
                        <tr>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                            <th>2015</th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.ecosystemservice.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.ecosystemservice.publicrecreation.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.ecosystemservice.carbonstorage.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.ecosystemservice.spiritualcultural.name")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.ecosystemservice.other.name")%>
                                <%=qlr.getString("data.table5b.other.detailed")%>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                            
                    <h3></h3>
                    <table id="t5_4_2_other">
                        <tr>
                            <th><%=qlr.getString("data.table5b.other.header")%></th>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                    </table>
                        
                    <h3><%=qlr.getString("data.tiers.title")%></h3>
                    <table id="t5_4_3">
                        <tr>
                            <th><%=qlr.getString("data.tiers.header.category")%></th>
                            <th><%=qlr.getString("data.tiers.header.status")%></th>
                            <th><%=qlr.getString("data.tiers.header.trend")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tiers.category.protection")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tiers.category.ecosystemservice")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                            
                    <h3><%=qlr.getString("data.tier.criteria.title")%></h3>                           
                    <table id="t5_4_4">
                        <tr>
                            <th><%=qlr.getString("data.tier.criteria.header.category")%></th>
                            <th><%=qlr.getString("data.tier.criteria.header.status")%></th>
                            <th><%=qlr.getString("data.tier.criteria.header.trend")%></th>
                        </tr>
                        <tr>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tiers.category.protection")%></li>
                                </ul>                                
                            </td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.status.t3.title")%>:<%=qlr.getString("data.tier.criteria.protection.status.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t2.title")%>:<%=qlr.getString("data.tier.criteria.protection.status.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t1.title")%>:<%=qlr.getString("data.tier.criteria.protection.status.t1.body")%></li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t3.title")%>:<%=qlr.getString("data.tier.criteria.protection.trend.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t2.title")%>:<%=qlr.getString("data.tier.criteria.protection.trend.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t1.title")%>:<%=qlr.getString("data.tier.criteria.protection.trend.t1.body")%></li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tiers.category.ecosystemservice.spiritualculturalvalues")%></li>
                                    <li><%=qlr.getString("data.tiers.category.ecosystemservice.publicrecreation")%></li>
                                    <li><%=qlr.getString("data.tiers.category.ecosystemservice.spiritualculturalservices")%></li>
                                    <li><%=qlr.getString("data.tiers.category.ecosystemservice.carbonstorage")%></li>
                                    <li><%=qlr.getString("data.tiers.category.ecosystemservice.other")%></li>
                                </ul>                                
                            </td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.status.t3.title")%>:<%=qlr.getString("data.tier.criteria.ecosystemservice.status.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t2.title")%>:<%=qlr.getString("data.tier.criteria.ecosystemservice.status.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t1.title")%>:<%=qlr.getString("data.tier.criteria.ecosystemservice.status.t1.body")%></li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t3.title")%>:<%=qlr.getString("data.tier.criteria.ecosystemservice.trend.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t2.title")%>:<%=qlr.getString("data.tier.criteria.ecosystemservice.trend.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t1.title")%>:<%=qlr.getString("data.tier.criteria.ecosystemservice.trend.t1.body")%></li>
                                </ul>
                            </td>
                        </tr>                        
                    </table>
                                
                    <h2>5.5 <%=qlr.getString("data.comments.title")%></h2>
                    <h3></h3>
                    <table id="t5_5_1">
                        <tr>
                            <th><%=qlr.getString("data.comments.header.category")%></th>
                            <th><%=qlr.getString("data.comments.header.data")%></th>
                            <th><%=qlr.getString("data.comments.header.category")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comment.category.protection")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comment.category.protection.cleanproduction")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comment.category.protection.coastalstabilization")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comment.category.protection.desertificationcontrol")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comment.category.protection.avalanchecontrol")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comment.category.protection.erosionflood")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comment.category.protection.other")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comment.category.ecosystemservice")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comment.category.ecosystemservice.publicrecreation")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comment.category.ecosystemservice.spiritualcultural")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comment.category.ecosystemservice.other")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comment.category.ecosystemservice.other")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                    
                    <h3></h3>
                    <table id="t5_5_2">
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

