<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="jspf/userValidation.jspf"%>
<%ResourceBundle rb = (ResourceBundle) request.getAttribute("strings");%>
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
        <%@include file="jspf/header.jspf" %>
        <div id="main">
            <div id="topmenu">
                <%@include file="jspf/sectionmenu.jspf" %>
            </div>
            <div id="content">
                <img src="images/faologo.png" /><br/>
                <h1>Forestry Department</h1>
                <h2>Food and Agriculture Organization of the United Nations</h2>
            </div>
            <div class="disclaimer">
                <h3><%=rb.getString("disclaimer.title")%></h3>
                <%=rb.getString("disclaimer.body")%>
            </div>
        </div>
        <%@include file="jspf/footer.jspf" %>
    </body>
</html>
