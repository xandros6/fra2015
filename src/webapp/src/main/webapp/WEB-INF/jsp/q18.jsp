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
               var table = $("#t18_2_1");
                
                var model = new ColumnModel();
                
                model.addColumn("id", "#", false);
                model.addColumn("reference", "<%=qlr.getString("data.sources.header.reference")%>", true);
                model.addColumn("variable","<%=qlr.getString("data.sources.header.variable")%>", true);
                model.addColumn("year","<%=qlr.getString("data.sources.header.year")%>", true );
                model.addColumn("comments", "<%=qlr.getString("data.sources.header.comments")%>",true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.configureTable(table);
                
                table = $("#t18_2_2");
                
                model = new ColumnModel();
                
                model.addColumn("id", "#");
                model.addColumn("class", "<%=qlr.getString("classification.header.class")%>",true);
                model.addColumn("definition", "<%=qlr.getString("classification.header.definition")%>",true);

                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.configureTable(table);
                
                var table = $("#t18_4_1");
                
                var model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("ownership_1990", "ownership1990", true);
                model.addColumn("ownership_2000", "ownership2000", true);
                model.addColumn("ownership_2005", "ownership2005", true);
                model.addColumn("ownership_2005", "ownership2010", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                KT.setEditable(table,true);

                table = $("#t18_4_2");
                
                model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("status", "<%=qlr.getString("data.tiers.header.status")%>", true);
                model.addColumn("trend", "<%=qlr.getString("data.tiers.header.trend")%>", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table,true);

                var table = $("#t18_4_4");
                
                var model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("management_1990", "management1990", true);
                model.addColumn("management_2000", "management2000", true);
                model.addColumn("management_2005", "management2005", true);
                model.addColumn("management_2005", "management2010", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                KT.setEditable(table,true);

                table = $("#t18_4_5");
                
                model = new ColumnModel();
                
                model.addColumn("category");
                model.addColumn("status", "<%=qlr.getString("data.tiers.header.status")%>", true);
                model.addColumn("trend", "<%=qlr.getString("data.tiers.header.trend")%>", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table,true);
                
                table = $("#t18_5_1");
                
                model = new ColumnModel();
                
                model.addColumn("comments_category");
                model.addColumn("comments_data", "<%=qlr.getString("data.comments.header.data")%>", true);
                model.addColumn("comments_trend", "<%=qlr.getString("data.comments.header.trend")%>", true);
                
                table.data(model.DATA_PROPERTY_NAME, model);
                
                KT.setEditable(table,true);
                
                table = $("#t18_5_2");
                
                model = new ColumnModel();

                model.addColumn("comments_other", "othercomments", true);
                
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
                    <h1><%= slr.getString("q18.title")%>:<%=slr.getString("q18.body")%></h1>
                    <h2>18.1 <%=qlr.getString("fra2015.categories.title")%></h2>
                    <table>
                        <tr>
                            <th><%=qlr.getString("fra2015.categories.name")%></th>
                            <th><%=qlr.getString("fra2015.categories.definition")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.ownership.public.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.ownership.public.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.ownership.public.nationalscale.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.ownership.public.nationalscale.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.ownership.public.subnationalscale.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.ownership.public.subnationalscale.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.ownership.private.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.ownership.private.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.ownership.private.individuals.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.ownership.private.individuals.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.ownership.private.businessinstitutions.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.ownership.private.businessinstitutions.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.ownership.private.localtribalindigenous.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.ownership.private.localtribalindigenous.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.ownership.unknown.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.ownership.unknown.definition")%></td>
                        </tr>
                        <tr>
                            <th><%=qlr.getString("fra2015.categories.management.name")%></th>
                            <th><%=qlr.getString("fra2015.categories.definition")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.management.publicadministration.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.management.publicadministration.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.management.individualhouseholds.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.management.individualhouseholds.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.management.privatecompanies.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.management.privatecompanies.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.management.communities.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.management.communities.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("fra2015.categories.management.otherforms.name")%></td>
                            <td><%=qlr.getString("fra2015.categories.management.otherforms.definition")%></td>
                        </tr>
                    </table>

                    <h2>18.2 <%=qlr.getString("national.data")%></h2>
                    <h3>18.2.1 <%=qlr.getString("data.sources.title")%></h3>
                    <table id="t18_2_1">

                    </table>
                    <h3>18.2.2 <%=qlr.getString("classification.title")%></h3>
                    <table id="t18_2_2">

                    </table>
                    <h3>18.2.3 <%=qlr.getString("original.data.title")%></h3>
                    <textarea id="originaldataEditor" name="originalDataEditor"></textarea>

                    <h2>18.3 <%=qlr.getString("analysis.title")%></h2>

                    <h3>18.3.1 <%=qlr.getString("adjustment.title")%></h3>
                    <textarea id="adjustmentEditor" name="adjustmentEditor"></textarea>

                    <h3>18.3.2 <%=qlr.getString("estimation.title")%></h3>
                    <textarea id="estimationEditor" name="estimationEditor"></textarea>

                    <h3>18.3.3 <%=qlr.getString("reclassification.title")%></h3>
                    <textarea id="reclassificationEditor" name="reclassificationEditor"></textarea>
                    
                    <h2>18.4 <%=qlr.getString("data.title")%></h2>
                    <h3>18.4.1 <%=qlr.getString("data.table18a.title")%></h3>      

                    <table id="t18_4_1">
                        <tr>
                            <th rowspan="2"><%=qlr.getString("data.table18a.header.categories")%></th>
                            <th colspan="4"><%=qlr.getString("data.table18a.header.forestarea")%></th>
                        </tr>
                        <tr>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table18a.row.category.ownership.public")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table18a.row.category.ownership.public.nationalscale")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table18a.row.category.ownership.public.subnationalscale")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table18a.row.category.ownership.private")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table18a.row.category.ownership.private.individuals")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table18a.row.category.ownership.private.businessinstitutions")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table18a.row.category.ownership.private.localtribalindigenous")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table18a.row.category.ownership.unknown")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table18a.row.total")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>

                    <h3><%=qlr.getString("data.tiers.title")%></h3>                           
                    <table id="t18_4_2">
                        <tr>
                            <th><%=qlr.getString("data.tiers.header.category")%></th>
                            <th><%=qlr.getString("data.tiers.header.status")%></th>
                            <th><%=qlr.getString("data.tiers.header.trend")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tiers.category.ownership.public")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tiers.category.ownership.private")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tiers.category.ownership.unknown")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>                   
                            
                    <h3><%=qlr.getString("data.tier.criteria.title")%></h3>
                    <table id="t18_4_3">
                        <tr>
                            <th><%=qlr.getString("data.tier.criteria.header.category")%></th>
                            <th><%=qlr.getString("data.tier.criteria.header.status")%></th>
                            <th><%=qlr.getString("data.tier.criteria.header.trend")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tier.criteria.ownership")%></td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.status.t3.title")%>:<%=qlr.getString("data.tier.criteria.ownership.status.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t2.title")%>:<%=qlr.getString("data.tier.criteria.ownership.status.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.status.t1.title")%>:<%=qlr.getString("data.tier.criteria.ownership.status.t1.body")%></li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t3.title")%>:<%=qlr.getString("data.tier.criteria.ownership.trend.t3.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t2.title")%>:<%=qlr.getString("data.tier.criteria.ownership.trend.t2.body")%></li>
                                    <li><%=qlr.getString("data.tier.criteria.trend.t1.title")%>:<%=qlr.getString("data.tier.criteria.ownership.trend.t1.body")%></li>
                                </ul>
                            </td>
                            
                        </tr>
                    </table>

                    <h3><%=qlr.getString("data.table18b.title")%></h3>
                    <table id="t18_4_4">
                        <tr>
                            <th rowspan="2"><%=qlr.getString("data.table18b.header.categories")%></th>
                            <th colspan="4"><%=qlr.getString("data.table18b.header.forestarea")%></th>
                        </tr>
                        <tr>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table18b.row.category.management.publicadministration")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table18b.row.category.management.individuals")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table18b.row.category.management.privatecompanies")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table18b.row.category.management.communities")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table18b.row.category.management.other")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.table18b.row.category.management.total")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>

                    <table id="t18_4_5">
                        <tr>
                            <th><%=qlr.getString("data.tiers.header.category")%></th>
                            <th><%=qlr.getString("data.tiers.header.status")%></th>
                            
                            <th><%=qlr.getString("data.tiers.header.trend")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tiers.category.management.publicadministration")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tiers.category.management.individuals")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tiers.category.management.privatecompanies")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tiers.category.management.communities")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.tiers.category.management.other")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>      
                            
                    <h3><%=qlr.getString("data.comments.title")%></h3>
                    <table id="t18_5_1">
                        <tr>
                            <th><%=qlr.getString("data.comments.header.category")%></th>
                            <th><%=qlr.getString("data.comments.header.data")%></th>
                            <th><%=qlr.getString("data.comments.header.trend")%></th>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comments.row.category.ownership.public")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comments.row.category.ownership.unkwnown")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comments.row.category.ownership.unkwnown")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=qlr.getString("data.comments.row.category.management")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>

                    <h3></h3>
                    <table id="t18_5_2">
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

