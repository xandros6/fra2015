<%-- 
    Document   : message.json.jsp
    Created on : 11-ott-2012, 8.48.49
    Author     : francesco
--%><%@page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>message:<%
    String message = (String) request.getAttribute("message");
%><%=message%>
