<%-- 
    Document   : template
    Created on : 2-ott-2012, 10.11.06
    Author     : francesco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/userValidation.jspf" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FRA 2015 Home page</title>
        <link href="includes/css/minimal.css" type="text/css" rel="stylesheet"/>
        <script src="includes/jquery-1.8.2.min.js" type="text/javascript"></script>
        <script>
            
            $(document).ready(function(){
         

            });
        </script>

    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div id="main">
            <div id="topmenu">
                <%@include file="WEB-INF/jspf/sectionmenu.jspf" %>
            </div>

            <div id="content">
                <img src="images/faologo.png" /><br/>
                <h1>Forestry Department</h1>
                <h2>Food and Agriculture Organization of the United Nations</h2>
            </div>


        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
