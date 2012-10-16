<%-- 
    Document   : template
    Created on : 2-ott-2012, 10.11.06
    Author     : francesco
--%>
<%@page import="it.geosolutions.fra2015.webapp.LocalizationBundle"%>
<%@page import="it.geosolutions.fra2015.webapp.rte.RTEConfigurationHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@include file="jspf/userValidation.jspf" %>
<%

    LocalizationBundle strings = (LocalizationBundle) request.getAttribute("strings");

    if (strings == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

    LocalizationBundle slr = (LocalizationBundle) request.getAttribute("sectionBundle");

    if (slr == null) {
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
        <script src="includes/gridedit.js" type="text/javascript"></script>
        <link href="includes/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="includes/jquery-ui.min.js"></script>
        <script>
            
            $(document).ready(function(){
                $(":button").button();
                $("#bSave").click(function(event) {

                    var editor = CKEDITOR.instances['editor'];
                    
                    var text = editor.getData();
                    
                        
                    $.ajax({
                        type:"POST",
                        url:"introduction.action/save",
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
                    <%@include file="jspf/section1.jspf" %>
                </div>
                <div class="content">
                    <h1><%=slr.getString("title")%></h1>
                    <h3><caption><%=slr.getString("report.label")%>:</h3>
                    <table id="personsTable">                
                        <thead>
                            <tr>
                                <th>
                                    &nbsp;
                                </th>
                                <th>
                                    <%=slr.getString("report.header.name")%><br/>
                                    <%=slr.getString("report.header.subtitle")%>
                                </th>
                                <th>
                                    <%=slr.getString("report.header.istitution")%>
                                </th>
                                <th>
                                    <%=slr.getString("report.header.email")%>
                                </th>
                                <th>
                                    <%=slr.getString("report.header.tables")%>
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
                    <h3><%=slr.getString("introduction.label")%>:</h3>
                    <textarea id="editor" name="editor" cols="80" rows="10"></textarea>
                    <br/>
                    <input id="bReload" type="button" value="Cancel"/>
                    <input id="bSave" type="button" value="Save"/>

                </div>
            </div>
        </div>

        <%


            strings.dumpMissingResources();
            slr.dumpMissingResources();


        %>
        <%@include file="jspf/footer.jspf" %>
        <ckeditor:replace replace="editor" basePath="/WebApp/ckeditor/"
        events="<%=RTEConfigurationHelper.createEventHandlers()%>"
        globalEvents="<%=RTEConfigurationHelper.createGlobalEventHandler()%>"
                          />
</html>
