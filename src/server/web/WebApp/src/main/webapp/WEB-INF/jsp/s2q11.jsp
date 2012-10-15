<%-- 
    Document   : s1q1
    Created on : 10-ott-2012, 16.20.45
    Author     : francesco
--%>
<%@page import="java.util.List"%>
<%@page import="it.geosolutions.fra2015.webapp.LocalizationBundle"%>
<%@page import="it.geosolutions.fra2015.webapp.rte.RTEConfigurationHelper"%>
<%@taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    final boolean debug  = true;

    LocalizationBundle strings = (LocalizationBundle) request.getAttribute("strings");

    if (strings == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

    LocalizationBundle cats = (LocalizationBundle) request.getAttribute("categories");

    if (cats == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

    LocalizationBundle parta = (LocalizationBundle) request.getAttribute("parta");

    if (parta == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }
    
    
    
%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FRA 2015 Question 11</title>
        <link href="includes/css/minimal.css" type="text/css" rel="stylesheet"/>
        <script src="includes/jquery-1.8.2.min.js" type="text/javascript">
        </script>
        <script src="includes/gridedit.js" type="text/javascript">
        </script>
        <link href="includes/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="includes/jquery-ui.min.js"></script>
        <script type="text/javascript">
            <!--
            $(document).ready(function(){
                $(":button").button();
                $("#t1_2Add").click(function(ev) {
                    
                    var rowIndex;
                    
                    rowIndex = $("#t1_2  tr").size();
                    
                    createRow("t1_2",rowIndex);
                                        
                });
                $("#t1_2Save").click(function(ev) {
                    
                    alert('Not supported yet.');
                                        
                });
                
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
                    <%@include file="jspf/partamenu.jspf" %>
                </div>
                <div class="content">
                    <h1><%= parta.getString("q11.title")%>:<%=parta.getString("q11.body")%></h1>
                    <h2>1.1 <%=parta.getString("q11.fra2015.categories.title")%></h2>
                    <table>
                        <tr>
                            <th><%=parta.getString("q11.fra2015.categories.category")%></th>
                            <th><%=parta.getString("q11.fra2015.categories.definition")%></th>
                        </tr>
                        <tr>
                            <td><%=cats.getString("q11.forest.category")%></td><td><%=cats.getString("q11.forest.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=cats.getString("q11.other.wooded.land.category")%></td><td><%=cats.getString("q11.other.wooded.land.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=cats.getString("q11.other.land.category")%></td><td><%=cats.getString("q11.other.land.definition")%></td>
                        </tr>

                    </table>

                    <h2>1.2 <%=parta.getString("q11.national.data")%></h2>
                    <h3>1.2.1 <%=parta.getString("q11.data.sources.title")%></h3>
                    <table id="t1_2">
                        <tr>
                            <th>#</th>
                            <th><%=parta.getString("q11.data.sources.header.reference")%></th>
                            <th><%=parta.getString("q11.data.sources.header.variable")%></th>
                            <th><%=parta.getString("q11.data.sources.header.year")%></th>
                            <th><%=parta.getString("q11.data.sources.header.comments")%></th>
                            <th>&nbsp;</th>
                        </tr>
                        <tr>
                            <th colspan="6" class="control">
                                <input id="t1_2Add" type="button" value="+"/>
                                <input id="t1_2Save" type="button" value="Save"/>
                            </th>
                        </tr>
                    </table>
                    <h3>1.2.2 <%=parta.getString("q11.classification.title")%></h3>
                    <table>
                        <tr>
                            <th>#</th>
                            <th><%=parta.getString("q11.classification.header.class")%></th>
                            <th><%=parta.getString("q11.classification.header.definition")%></th>
                        </tr>
                    </table>
                    <h3>1.2.3 <%=parta.getString("q11.original.data.title")%></h3>
                    <textarea id="originaldataEditor" name="originalDataEditor"></textarea>

                    <h2>1.3 <%=parta.getString("q11.analysis.title")%></h2>

                    <h3>1.3.1 <%=parta.getString("q11.adjustment.title")%></h3>
                    <textarea id="adjustmentEditor" name="adjustmentEditor"></textarea>

                    <h3>1.3.2 <%=parta.getString("q11.estimation.title")%></h3>
                    <textarea id="estimationEditor" name="estimationEditor"></textarea>

                    <h3>1.3.3 <%=parta.getString("q11.reclassification.title")%></h3>
                    <textarea id="reclassificationEditor" name="reclassificationEditor"></textarea>


                    <h2>1.4 <%=parta.getString("q11.data.title")%></h2>
                    <h3>1.4.1 <%=parta.getString("q11.data.table1a.title")%></h3>
                    <table>

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
                            <th rowspan="2"><%=parta.getString("q11.data.table1a.header.categories")%></th>
                            <th colspan="5"><%=parta.getString("q11.data.table1a.header.area")%></th>
                        </tr>
                        <tr>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                            <th>2015</th>
                        </tr>
                        <tr>
                            <td><%=cats.getString("q11.forest.category")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=cats.getString("q11.other.wooded.land.category")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=cats.getString("q11.other.land.category")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                    <h3>1.4.2 <%=parta.getString("q11.data.table1b.title")%></h3>
                    <table>

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
                            <th rowspan="2"><%=parta.getString("q11.data.table1b.header.categories")%></th>
                            <th colspan="4"><%=parta.getString("q11.data.table1b.header.establishmentloss")%></th>
                            <th colspan="4"><%=parta.getString("q11.data.table1b.header.ofwhich")%></th>
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
                            <td><%=cats.getString("q11.inland.water.bodies.category")%></td>
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
                            <td><%=cats.getString("q11.afforestation.category")%></td>
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
                            <td><%=cats.getString("q11.reforestation.category")%></td>
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

                    <h3>1.4.3 <%=parta.getString("q11.data.tiers.title")%></h3>
                    <table>
                        <tr>
                            <th>Category</th>
                            <th>Tier for status</th>
                            <th>Tier for reported trend</th>
                        </tr>
                    </table>

                    <h3>1.4.4 <%=parta.getString("q11.data.tier.criteria.title")%></h3>
                    <table>
                        <tr>
                            <th>Category</th>
                            <th>Tier for status</th>
                            <th>Tier for reported trend</th>
                        </tr>
                    </table>

                    <h3>1.4.5 <%=parta.getString("q11.data.comments.title")%></h3>
                    <table>
                        <tr>
                            <th>Category</th>
                            <th>Comments related to data, definitions, etc.</th>
                            <th>Comments on reported status and trends</th>
                        </tr>
                    </table>

                    <h3>1.4.6 <%=parta.getString("q11.data.other.comments.title")%></h3>
                    <table>
                        <tr>
                            <th>Other general comments to the table</th>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                    </table>

                    <h3>1.4.7 <%=parta.getString("q11.data.expected.title")%></h3>
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
                cats.dumpMissingResources();
                parta.dumpMissingResources();
                
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

