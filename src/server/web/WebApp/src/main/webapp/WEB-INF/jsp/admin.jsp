<%@page import="it.geosolutions.fra2015.webapp.LocalizationBundle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="jspf/userValidation.jspf"%>
<%LocalizationBundle rb = (LocalizationBundle) request.getAttribute("strings");%>
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
                <%@include file="jspf/adminmenu.jspf" %>
            </div>
            <div id="content">
                <img src="images/faologo.png" /><br/>

                <h1>Forestry Department</h1>

                <h2>Food and Agriculture Organization of the United Nations</h2>

                <div>
                    To be written...<br/>

                    The Global Forest Resources Assessment process is coordinated by te Forestry Department at FAO headquarters in Rome. The contact person for matters related to FRA2015 is:
                    To be written...<br/>
                    Kennet MacDicken<br/>
                    Senior Forestry Officer<br/>
                    FAO Forestry Department<br/>
                    Viale delle Terme di Caracalla<br/>
                    Rome 00153, Italy<br/>
                    <br/>
                    E-mail: <a href="mailto:Kenneth.MacDicken@fao.org"> Kenneth.MacDicken@fao.org</a><br/>

                    Readers can also use the following e-mail address: <a href="mailto:fra@fao.org"> fra@fao.org</a>

                </div>

                <div class="disclaimer">
                    <h3><%=rb.getString("disclaimer.title")%></h3>
                    <%=rb.getString("disclaimer.body")%>
                </div>
            </div>
        </div>
        <%@include file="jspf/footer.jspf" %>
    </body>
</html>
