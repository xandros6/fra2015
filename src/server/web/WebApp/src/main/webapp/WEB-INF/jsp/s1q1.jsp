<%-- 
    Document   : s1q1
    Created on : 10-ott-2012, 16.20.45
    Author     : francesco
--%>
<%@taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@page import="it.geosolutions.fra2015.webapp.rte.RTEConfigurationHelper"%>
<%@page import="java.util.ResourceBundle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    ResourceBundle strings = (ResourceBundle) request.getAttribute("strings");

    if (strings == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

    ResourceBundle cats = (ResourceBundle) request.getAttribute("categories");

    if (cats == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

    ResourceBundle forests = (ResourceBundle) request.getAttribute("forests");

    if (forests == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }
%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FRA 2015 Question 1</title>
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
                    <%@include file="jspf/forestmenu.jspf" %>
                </div>
                <div class="content">
                    <h1><%= forests.getString("q1.title")%>:<%=forests.getString("q1.body")%></h1>
                    <h2>1.1 <%=forests.getString("q1.fra2015.categories.title")%></h2>
                    <table>
                        <tr>
                            <th><%=forests.getString("q1.fra2015.categories.category")%></th>
                            <th><%=forests.getString("q1.fra2015.categories.definition")%></th>
                        </tr>

                        <tr>
                            <td><%=cats.getString("q1.forest.category")%></td><td><%=cats.getString("q1.forest.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=cats.getString("q1.other.wooded.land.category")%></td><td><%=cats.getString("q1.other.wooded.land.definition")%></td>
                        </tr>
                        <tr>
                            <td><%=cats.getString("q1.other.land.category")%></td><td><%=cats.getString("q1.other.land.definition")%></td>
                        </tr>

                    </table>

                    <h2>1.2 <%=forests.getString("q1.national.data")%></h2>
                    <h3>1.2.1 <%=forests.getString("q1.data.sources.title")%></h3>
                    <table id="t1_2">
                        <tr>
                            <th>#</th>
                            <th><%=forests.getString("q1.data.sources.header.reference")%></th>
                            <th><%=forests.getString("q1.data.sources.header.variable")%></th>
                            <th><%=forests.getString("q1.data.sources.header.year")%></th>
                            <th><%=forests.getString("q1.data.sources.header.comments")%></th>
                            <th>&nbsp;</th>
                        </tr>
                        <tr>
                            <th colspan="6" class="control">
                                <input id="t1_2Add" type="button" value="+"/>
                                <input id="t1_2Save" type="button" value="Save"/>
                            </th>
                        </tr>
                    </table>
                    <h3>1.2.2 <%=forests.getString("q1.classification.title")%></h3>
                    <table>
                        <tr>
                            <th>#</th>
                            <th><%=forests.getString("q1.classification.header.class")%></th>
                            <th><%=forests.getString("q1.classification.header.definition")%></th>
                        </tr>
                    </table>
                    <h4>1.2.3 <%=forests.getString("q1.original.data.title")%></h4>
                    <textarea id="originaldataEditor" name="originalDataEditor"></textarea>

                    <h2>1.3 <%=forests.getString("q1.analysis.title")%></h2>

                    <h3>1.3.1 <%=forests.getString("q1.adjustment.title")%></h3>
                    <textarea id="adjustmentEditor" name="adjustmentEditor"></textarea>

                    <h3>1.3.2 <%=forests.getString("q1.estimation.title")%></h3>
                    <textarea id="estimationEditor" name="estimationEditor"></textarea>

                    <h3>1.3.3 <%=forests.getString("q1.reclassification.title")%></h3>
                    <textarea id="reclassificationEditor" name="reclassificationEditor"></textarea>


                    <h2>1.4 <%=forests.getString("q1.data.title")%></h2>
                    <h3>1.4.1 <%=forests.getString("q1.data.table1a.title")%></h3>
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
                            <th rowspan="2"><%=forests.getString("q1.data.table1a.header.categories")%></th>
                            <th colspan="5"><%=forests.getString("q1.data.table1a.header.area")%></th>
                        </tr>
                        <tr>
                            <th>1990</th>
                            <th>2000</th>
                            <th>2005</th>
                            <th>2010</th>
                            <th>2015</th>
                        </tr>
                        <tr>
                            <td><%=cats.getString("q1.forest.category")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=cats.getString("q1.other.wooded.land.category")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%=cats.getString("q1.other.land.category")%></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                    <h3>1.4.2 <%=forests.getString("q1.data.table1b.title")%></h3>
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
                            <th rowspan="2"><%=forests.getString("q1.data.table1b.header.categories")%></th>
                            <th colspan="4"><%=forests.getString("q1.data.table1b.header.establishmentloss")%></th>
                            <th colspan="4"><%=forests.getString("q1.data.table1b.header.ofwhich")%></th>
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
                            <td><%=cats.getString("q1.inland.water.bodies.category")%></td>
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
                            <td><%=cats.getString("q1.afforestation.category")%></td>
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
                            <td><%=cats.getString("q1.reforestation.category")%></td>
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

                    <h3>1.4.3 <%=forests.getString("q1.data.tiers.title")%></h3>
                    <table>
                        <tr>
                            <th>Category</th>
                            <th>Tier for status</th>
                            <th>Tier for reported trend</th>
                        </tr>
                    </table>

                    <h3>1.4.4 <%=forests.getString("q1.data.tier.criteria.title")%></h3>
                    <table>
                        <tr>
                            <th>Category</th>
                            <th>Tier for status</th>
                            <th>Tier for reported trend</th>
                        </tr>
                    </table>

                    <h3>1.4.5 <%=forests.getString("q1.data.comments.title")%></h3>
                    <table>
                        <tr>
                            <th>Category</th>
                            <th>Comments related to data, definitions, etc.</th>
                            <th>Comments on reported status and trends</th>
                        </tr>
                    </table>

                    <h3>1.4.6 <%=forests.getString("q1.data.other.comments.title")%></h3>
                    <table>
                        <tr>
                            <th>Other general comments to the table</th>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                    </table>

                    <h3>1.4.7 <%=forests.getString("q1.data.expected.title")%></h3>
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

