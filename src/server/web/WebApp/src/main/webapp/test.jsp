<%-- 
    Document   : newjsptest
    Created on : 15-ott-2012, 18.12.53
    Author     : Francesco Rogo <f.rogo@computernopanic.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="includes/css/minimal.css" type="text/css" rel="stylesheet"/>
        <script src="includes/jquery-1.8.2.min.js" type="text/javascript">
        </script>
        <script src="includes/grid.kt.js" type="text/javascript">
        </script>
        <link href="includes/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="includes/jquery-ui.min.js"></script>
        <script type="text/javascript">
            <!--
            $(document).ready(function(){
              
              
              $("#io").bind('blur', function(ev) {
                  
                  alert("this.val()");
                  
              });
        
            });
            -->
        </script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <table id="t1" style="width:100%">
            
            <tr>
                <td>
                    
                   <input type="text" id="io"/> 
                </td>
            </tr>
        </table>
    </body>
</html>
