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
        <title>FRA 2015 Login</title>
        <link href="includes/css/minimal.css" type="text/css" rel="stylesheet"/>
        <script src="includes/jquery-1.8.2.min.js" type="text/javascript"></script>
        <script>
            
            $(document).ready(function(){
                
                $("#bLogin").click(function(event) {
                    
                    //@todo ajax this 
                    
                    var username = $("#username").val();
                    
                    if (username == null || username == "") {
                        alert("Enter your account name, please.");
                        return;
                    }
                    
                    
                    var password = $("#password").val();
                    if (password == null) {
                        alert("Enter your password, please.");
                        return;
                    }
                    
                    if (username == "admin" && 
                        password == "admin") {
                        document.location = "introduction.jsp ";   
                    } else {
                        alert("Login error, try again");
                    }
                    
                }
            );

            });
        </script>

    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div id="main">
            <div class="login">
                <table>
                    <caption>Login:</caption>
                    <tr>
                        <th>Username:</th>
                        <td><input id="username" type="text"/> </td>
                    </tr>
                    <tr>
                        <th>Password:</th>
                        <td>
                            <input id="password" type="password"/>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <input id="bLogin" type="button" value="Login" />
                        </th>
                    </tr>
                </table>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
