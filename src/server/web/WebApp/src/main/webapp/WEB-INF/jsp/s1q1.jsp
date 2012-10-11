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
        <script type="text/javascript">
            <!--
            $(document).ready(function(){
                // @todo add code here
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
                    <table>
                        <caption>1.1 <%=forests.getString("q1.fra2015.categories.title")%></caption>
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
                    <h3>1.2 <%=forests.getString("q1.national.data")%></h3>
                    <table>
                        <caption>1.2.1 <%=forests.getString("q1.data.sources.title")%></caption>
                        <tr>
                            <th>#</th>
                            <th><%=forests.getString("q1.data.sources.header.reference")%></th>
                            <th><%=forests.getString("q1.data.sources.header.variable")%></th>
                            <th><%=forests.getString("q1.data.sources.header.year")%></th>
                            <th><%=forests.getString("q1.data.sources.header.comments")%></th>
                        </tr>
                    </table>
                    <table>
                        <caption>1.2.2 <%=forests.getString("q1.classification.title")%></caption>
                        <tr>
                            <th>#</th>
                            <th><%=forests.getString("q1.classification.header.class")%></th>
                            <th><%=forests.getString("q1.classification.header.definition")%></th>
                        </tr>
                    </table>
                    <h4>1.2.3 <%=forests.getString("q1.original.data.title")%></h4>
                    <textarea id="originaldataEditor" name="originalDataEditor"></textarea>

                    <h3>1.3 <%=forests.getString("q1.analysis.title")%></h3>

                    <h4>1.3.1 <%=forests.getString("q1.adjustment.title")%></h4>
                    <textarea id="adjustmentEditor" name="adjustmentEditor"></textarea>

                    <h4>1.3.2 <%=forests.getString("q1.estimation.title")%></h4>
                    <textarea id="estimationEditor" name="estimationEditor"></textarea>

                    <h4>1.3.3 <%=forests.getString("q1.reclassification.title")%></h4>
                    <textarea id="reclassificationEditor" name="reclassificationEditor"></textarea>


                    <h3>1.4 <%=forests.getString("q1.data.title")%></h3>

                    <table>
                        <caption>1.4.1 <%=forests.getString("q1.data.table1a.title")%></caption>
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
                                <span style="background-color: red">WARNING!!!</span>
                                Review data for years 1990 - 2000, please.</th>
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

                    <table>
                        <caption>1.4.2 <%=forests.getString("q1.data.table1b.title")%></caption>
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

                    <table>
                        <caption>1.4.3 <%=forests.getString("q1.data.tiers.title")%></caption>
                    </table>
                    <table>
                        <caption>1.4.4 <%=forests.getString("q1.data.tier.criteria.title")%></caption>
                    </table>
                    <table>
                        <caption>1.4.5 <%=forests.getString("q1.data.comments.title")%></caption>
                    </table>

                    <table>
                        <caption>1.4.6 <%=forests.getString("q1.data.other.comments.title")%></caption>
                    </table>

                    <table>
                        <caption>1.4.7 <%=forests.getString("q1.data.expected.title")%></caption>
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

