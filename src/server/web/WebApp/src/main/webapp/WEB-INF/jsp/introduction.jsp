<%-- 
    Document   : template
    Created on : 2-ott-2012, 10.11.06
    Author     : francesco
--%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="it.geosolutions.fra2015.webapp.rte.RTEConfigurationHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@include file="jspf/userValidation.jspf" %>
<%

    ResourceBundle strings = (ResourceBundle) request.getAttribute("strings");

    if (strings == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FRA 2015 Introduction</title>
        <link href="includes/css/minimal.css" type="text/css" rel="stylesheet"/>
        <script src="includes/jquery-1.8.2.min.js" type="text/javascript"></script>
        <script src="includes/gridedit.js" type="text/javascript">
        </script>
        <script>
            
            $(document).ready(function(){
                
                $("#bSave").click(function(event) {

                    var editor = CKEDITOR.instances['editor'];
                    
                    var text = editor.getData();
                    
                        
                    $.ajax({
                        type:"POST",
                        url:"introduction.action",
                        data:"body="+text,
                        dataType:'json',
                        timeout:5000,
                        success: function(d,s) {
                            if (d) {
                                $("#bSave").attr("disabled", "disabled");
                                alert("Data saved");
                            } else {
                                alert("An error has occurred while saving data!");
                            }
                        },
                        error: function(o,s,e) {
                            alert("Connection error, try again later pls");
                        }
                        
                    });
                   
                });
                
                $("#bReload").click(function(event) {
                    
                    var value = CKEDITOR.instances['editor'];
                    
                    value.setData(window.richtext);
                   
                });
                
                $("#personsTableAdd").click(function(ev) {
                    
                    var rowIndex;
                    
                    rowIndex = $("#personsTable  tr").size();
                    
                    createRow("personsTable",rowIndex);
                                        
                });
                $("#personsTableSave").click(function(ev) {
                    
                    alert('Not supported yet.');
                                        
                });
                
                

            });
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
                    <%@include file="jspf/introductionmenu.jspf" %>
                </div>
                <div class="content">
                    <h3>Report preparation and contact persons</h3>
                    <table id="personsTable">                
                        <caption>The present report was prepared by the following person(s)</caption>
                        <thead>
                            <tr>
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
                            <tr >
                                <td colspan="6" class="control">
                                    <input id="personsTableAdd" type="button" value="+"/>
                                    <input id="personsTableSave" type="button" value="Save"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <label for="editor"><%=strings.getString("introduction.title")%>:</label>
                    <textarea id="editor" name="editor" cols="80" rows="10"></textarea>
                    <br/>
                    <input id="bReload" type="button" value="Cancel"/>
                    <input id="bSave" type="button" value="Save"/>

                </div>
            </div>
        </div>
        <%@include file="jspf/footer.jspf" %>
        <ckeditor:replace replace="editor" basePath="/WebApp/ckeditor/"
        events="<%=RTEConfigurationHelper.createEventHandlers()%>"
        globalEvents="<%=RTEConfigurationHelper.createGlobalEventHandler()%>"
                          />
</html>
