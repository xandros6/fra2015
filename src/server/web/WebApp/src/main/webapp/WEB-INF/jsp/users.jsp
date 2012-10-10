<%-- 
    Document   : template
    Created on : 2-ott-2012, 10.11.06
    Author     : francesco
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="jspf/userValidation.jspf" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FRA 2015 Gestione utenti</title>
        <link href="includes/css/minimal.css" type="text/css" rel="stylesheet"/>
        <script src="includes/jquery-1.8.2.min.js" type="text/javascript">
        </script>

        <script type="text/javascript">
            <!--
            
            names = new Array('John','Michelle','Jack','Robert');
            
            surnames = new Array('Black','White','Red','Green');
            
            nations = new Array('Italy','USA','UK','Germany','France','Spain');            
            
            $(document).ready(function(){
                
                $("#usersTableAdd").click(function(ev) {
                    
                    var rowIndex, db;
                    
                    rowIndex = $("#usersTableBody > tr").size();
                    
                    createRow(rowIndex);
                                        
                });
                
                $("#usersTableSave").click(function(ev) {
                    
                    alert("Not supported yet.")
                    
                });
                
                // @todo load users
                
                generateRandomUsers();
                
                
                
            });
            
            function createRow(rowIndex) {
                var control, cols;
                 
                control = $("#usersTableCommandRow");
                    
                cols = $("#usersTableHeaderRow > th").size();

                control.before( "<tr id=usersTableRow"+rowIndex+"></tr>");
                
                var row = $("#usersTableRow"+rowIndex);
                    
                row = configRow(row, rowIndex, cols, true );
                
                var db = $("#usersTableDeleteRow"+rowIndex);
                    
                db.click(function(ev) {
                        
                    deleteRow(rowIndex);
                        
                });
                
                return row;
            }
            
            function configRow(row, rowIndex, cols, controls) {
                
                var result= "", i=0;
                
                for (i;i<cols;i++) {
                    result+="<td>";
                    switch (i) {
                        case 0:
                            result+=rowIndex;
                            break;
                        case cols-1:
                            if (controls)  {
                                result+='<input id="usersTableDeleteRow'+
                                    rowIndex+
                                    '" type="button" value="-" />';
                            }
                            break;
                        default:
                    }

                    result+="</td>";
                }
                
                row.html(result);
                
                return row;
            }
            
            function deleteRow(rowIndex) {
                
                $("#usersTableRow"+rowIndex).remove();
                
            }
            
            function generateRandomUsers() {
                
                var count = Math.floor(Math.random()*10)+1;
                
                //                alert('genero '+count+" utenti "+nations[3]);
                
                var i=0;
                
                var cols = $("#usersTableHeaderRow > th").size();
                
                for (i = 0; i < count; i++) {
                    
                    var row = createRow(i);
                    
                    
            
                    var cells = $("#usersTableRow"+i+" > td");
                    
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
                        
                        var cellKey = "#usersTableRow"+i+" td:nth-child("+(j+1)+")";
                        
                        var cell = $(cellKey);
                        
                        //                        cell.html(i+","+j);
                        
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
                <%@include file="jspf/sectionmenu.jspf" %>
            </div>
            <div class="admin">
                <table>                
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
