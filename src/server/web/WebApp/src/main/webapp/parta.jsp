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
        <script src="includes/jquery-1.8.2.min.js" type="text/javascript"/>
        <script lang="javascript">
            <!--
            $(document).ready(function(){
                // @todo add code here
            });
            -->
        </script>

    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
<div id="main">
            <div id="topmenu">
                <%@include file="WEB-INF/jspf/sectionmenu.jspf" %>
            </div>
            <div class="tablelayout">
                &nbsp;
                <div class="navigation">
                    <%@include file="WEB-INF/jspf/partamenu.jspf" %>
                </div>
                <div class="content">
                </div>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
