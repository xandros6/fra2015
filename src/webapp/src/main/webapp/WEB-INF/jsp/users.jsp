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
        <title>FRA 2015 Gestione utenti</title>
        <link href="includes/css/minimal.css" type="text/css" rel="stylesheet"/>
        <link href="includes/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="includes/jquery-1.8.2.min.js" type="text/javascript"></script>
        <script src="includes/jquery-ui.min.js"></script>
        <script src="includes/kGrid.js" type="text/javascript">
        </script>
        <script type="text/javascript">
            <!--
            
            names = new Array('John','Michelle','Jack','Robert');
            
            surnames = new Array('Black','White','Red','Green');
            
            nations = new Array('Italy','USA','UK','Germany','France','Spain');            
            
            $(document).ready(function(){
                
                $(":button").button();
                
                
                $("#usersTableAdd").click(function(ev) {
                    
                    var rowIndex;
                    
                    rowIndex = $("#usersTable tr").size();
                    
                    createRow("usersTable",rowIndex);
                                        
                });
                $("#usersTableSave").click(function(ev) {
                    
                    alert('Not supported yet.');
                                        
                });
                
                generateRandomUsers("usersTable");
                
            });
            
            
            function generateRandomUsers(tableId) {
                
                var count = Math.floor(Math.random()*10)+1;
                
                var i=0;
                
                for (i = 0; i < count; i++) {
                    
                    createRow(tableId,i);
            
                    var cells = $("#"+tableId+"Row"+i+" > td");
                    
                    var name, surname, nation, email;
                        
                    var index = Math.floor(Math.random()*names.length);
                        
                    name = names[index];
                        
                    index = Math.floor(Math.random()*surnames.length);
                    surname =surnames[index];
                        
                        
                    index = Math.floor(Math.random()*nations.length);
                    nation = nations[index];
                        
                    email = name+"."+surname+"@"+nation+".example.com";
                    
                    var j = 0;
                    
                    for (j = 0; j < cells.size(); j++) {
                        
                        var cellKey = "#"+tableId+"Row"+i+" td:nth-child("+(j+1)+")";
                        
                        var cell = $(cellKey);
                        
                        switch(j) {
                            case 0:
                                break;
                            case 1:
                                cell.html( name+" "+surname);
                                break;
                            case 2:
                                cell.html(nation);
                                break;
                            case 3:
                                cell.html(email);
                                break;
                            case 4:
                                cell.html("n.a.");
                                break;
                            default:
                                
                                
                        }
                        
                    }
                
                }
                
            }
            
            -->
        </script>

    </head>
    <body>
        <%@include file="jspf/header.jspf" %>
        <div id="main">
            <div id="topmenu">
                <%@include file="jspf/adminmenu.jspf" %>
            </div>
            <div class="admin">
                <table id="usersTable">                
                    <caption>Active users</caption>
                    <thead>
                        <tr id="usersTableHeaderRow">
                            <th>
                                #
                            </th>
                            <th>
                                Name<br/>
                                (FAMILY NAME, First name)
                            </th>
                            <th>
                                Istitution/Address
                            </th>
                            <th>
                                E-mail
                            </th>
                            <th>
                                Tables
                            </th>
                            <th style="width:100px">
                                &nbsp;
                            </th>
                        </tr>
                    </thead>
                    <tbody id="usersTableBody">
                        <tr id="usersTableCommandRow">
                            <td colspan="6" class="control">
                                <input id="usersTableAdd" type="button" value="+"/>
                                <input id="usersTableSave" type="button" value="Save"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <%@include file="jspf/footer.jspf" %>
    </body>
</html>
