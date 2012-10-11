<%-- 
    Document   : template
    Created on : 2-ott-2012, 10.11.06
    Author     : francesco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FRA 2015 Template page</title>
        <link href="includes/css/minimal.css" type="text/css" rel="stylesheet"/>
        <script src="includes/jquery-1.8.2.min.js" type="text/javascript">
        </script>
		<script src="includes/jquery-ui.min.js"></script>
		<link href="includes/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
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
                </div>
                <div class="content">
                </div>
            </div>
        </div>
        <%@include file="jspf/footer.jspf" %>
    </body>
</html>
