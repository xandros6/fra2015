<%-- 
    Document   : s1q1
    Created on : 10-ott-2012, 16.20.45
    Author     : francesco
--%>
<%@page import="java.util.ResourceBundle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    ResourceBundle strings = (ResourceBundle) request.getAttribute("strings");


    ResourceBundle cats = (ResourceBundle) request.getAttribute("categories");
    
    ResourceBundle forests = (ResourceBundle) request.getAttribute("forests");


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
                        <caption>1.1 <%=forests.getString("t1.1.title")%></caption>
                        <tr>
                            <th><%=forests.getString("t1.1.category.header")%></th>
                            <th><%=forests.getString("t1.1.definition.header")%></th>
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
                </div>
            </div>
        </div>
        <%@include file="jspf/footer.jspf" %>
    </body>
</html>

