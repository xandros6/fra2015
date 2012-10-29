<%-- 
    Document   : template
    Created on : 2-ott-2012, 10.11.06
    Author     : francesco
--%><%@page import="it.geosolutions.fra2015.webapp.LocalizationBundle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%LocalizationBundle rb = (LocalizationBundle) request.getAttribute("strings");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FRA 2015 Login</title>
        <link href="includes/css/login.css" type="text/css" rel="stylesheet"/>
        <script src="includes/jquery-1.8.2.min.js" type="text/javascript"></script>
        <script>
            
            $(document).ready(function(){
                
                $("#bLogin").click(function(event) {
                    
                    //@todo ajax this 
                    
                    var username = $("#username").val();
                    
                    if (username == null || username == "") {
                        alert("<%=rb.getString("login.error.username")%>");
                        return;
                    }
                    
                    var password = $("#password").val();
                    if (password == null) {
                        alert("<%=rb.getString("login.error.password")%>");
                        return;
                    }
                        
                    $.ajax({
                        type:"POST",
                        url:"login.action",
                        data:"username="+username+"&password="+password,
                        dataType:'json',
                        timeout:5000,
                        success: function(d,s) {
                            if (d) {
                                document.location="home.action";
                            } else {
                                alert("<%=rb.getString("login.error.invalid")%>");
                            }
                        },
                        error: function(o,s,e) {
                            alert("<%=rb.getString("login.error.connection")%>");
                        }
                        
                    });

                    
                }
            );

            });
        </script>

    </head>
    <body>
        <%@include file="jspf/header.jspf" %>
        <div id="main">
            <div class="login">
                <table>
                    <caption><%=rb.getString("login.title")%>:</caption>
                    <tr>
                        <th><%=rb.getString("login.header.username")%>:</th>
                        <td><input id="username" type="text"/> </td>
                    </tr>
                    <tr>
                        <th><%=rb.getString("login.header.password")%>:</th>
                        <td>
                            <input id="password" type="password"/>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <input id="bLogin" type="button" value="<%=rb.getString("login.submit")%>" />
                        </th>
                    </tr>
                </table>
            </div>
        </div>
        <%@include file="jspf/footer.jspf" %>
    </body>
</html>
