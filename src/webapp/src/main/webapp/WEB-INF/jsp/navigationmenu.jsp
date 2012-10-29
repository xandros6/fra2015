<%-- 
    Document   : navigationmenu
    Created on : 15-ott-2012, 11.16.32
    Author     : Francesco Rogo <f.rogo@computernopanic.com>
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int section = (Integer) request.getAttribute("section");

    switch (section) {
        case 1:
%><%@include file="jspf/section1.jspf"%><%
        break;
    case 2:
%><%@include file="jspf/section2.jspf"%><%
        break;
    case 3:
%><%@include file="jspf/section3.jspf"%><%
        break;
    case 4:
%><%@include file="jspf/section4.jspf"%><%
            break;
        default:
    }
%>

