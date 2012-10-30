<%-- 
    Document   : index.jsp
    Created on : 30-ott-2012, 11.48.53
    Author     : Francesco Rogo <f.rogo@computernopanic.com>
--%><%@page contentType="text/html" pageEncoding="UTF-8"%><%
String url = session.getServletContext().getContextPath()+"/login.action";

System.out.println("redirecting to "+url);
response.sendRedirect(url);%>

