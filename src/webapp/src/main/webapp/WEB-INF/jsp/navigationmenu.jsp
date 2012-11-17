<%-- 
    Document   : navigationmenu
    Created on : 15-ott-2012, 11.16.32
    Author     : Francesco Rogo <f.rogo@computernopanic.com>
--%><%@page import="it.geosolutions.fra2015.webapp.LocalizationBundle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><% {
        LocalizationBundle lb = (LocalizationBundle) request.getAttribute("sectionBundle");
        if (lb == null) {
            System.out.println("section resource bundle not found");
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
%><dl>
    <dt class="accordion-header"><%=lb.getString("preparation.title")%></dt>
    <dd>
        <ul>
            <li><a href="preparation.action"><%= lb.getString("report.title")%></a></li>
            <li><a href="preparation.action"><%= lb.getString("introduction.title")%></a></li>
        </ul>
    </dd>
    <dt class="accordion-header"><%=lb.getString("topic1.title")%></dt>
    <dd>
        <ul>
            <li class="warn"><a href="question1.action"><%= lb.getString("q1.title")%>: <%=lb.getString("q1.body")%></a></li>
            <li><a href="question2.action"><%= lb.getString("q2.title")%>: <%=lb.getString("q2.body")%></a></li>
        </ul>
    </dd>
    <dt class="accordion-header"><%=lb.getString("topic2.title")%></dt>
    <dd>
        <ul>
            <li><a href="question3.action"><%= lb.getString("q3.title")%>: <%=lb.getString("q3.body")%></a></li>
            <li><a href="question4.action"><%= lb.getString("q4.title")%>: <%=lb.getString("q4.body")%></a></li>

        </ul>
    </dd>
    <dt class="accordion-header"><%=lb.getString("topic3.title")%></dt>
    <dd>
        <ul>
            <li><a href="question5.action"><%= lb.getString("q5.title")%>: <%=lb.getString("q5.body")%></a></li>

        </ul>
    </dd>
    <dt class="accordion-header"><%=lb.getString("topic4.title")%></dt><dd>
        <ul>
            <li><a href="question6.action"><%= lb.getString("q6.title")%>: <%=lb.getString("q6.body")%></a></li>
            <li><a href="question7.action"><%= lb.getString("q7.title")%>: <%=lb.getString("q7.body")%></a></li>
        </ul>
    </dd>
    <dt class="accordion-header" ><%=lb.getString("topic5.title")%></dt><dd>
        <ul>
            <li><a href="question8.action"><%= lb.getString("q8.title")%>: <%=lb.getString("q8.body")%></a></li>
            <li><a href="question9.action"><%= lb.getString("q9.title")%>: <%=lb.getString("q9.body")%></a></li>
        </ul>
    </dd>
    <dt class="accordion-header"><%=lb.getString("topic6.title")%></dt><dd>
        <dl>
            <dt><%=lb.getString("topic6.1.title")%></dt>
            <dd>        
                <ul>
                    <li><a href="question10.action"><%= lb.getString("q10.title")%>: <%=lb.getString("q10.body")%></a></li>
                    <li><a href="question11.action"><%=lb.getString("q11.title")%>:<%=lb.getString("q11.body")%></a></li>
                    <li><a href="question12.action"><%=lb.getString("q12.title")%>:<%=lb.getString("q12.body")%></a></li>
                    <li><a href="question13.action"><%=lb.getString("q13.title")%>:<%=lb.getString("q13.body")%></a></li>
                </ul>
            </dd>
            <dt><%=lb.getString("topic6.2.title")%></dt>
            <dd>        
                <ul>
                    <li><a href="question14.action"><%=lb.getString("q14.title")%>:<%=lb.getString("q14.body")%></a></li>
                    <li><a href="question15.action"><%=lb.getString("q15.title")%>:<%=lb.getString("q15.body")%></a></li>
                    <li><a href="question16.action"><%=lb.getString("q16.title")%>:<%=lb.getString("q16.body")%></a></li>
                </ul>
            </dd>
        </dl>

    </dd>
    <dt class="accordion-header"><%=lb.getString("topic7.title")%></dt><dd>
        <ul>
            <li><a href="question18.action"><%=lb.getString("q18.title")%>:<%=lb.getString("q18.body")%></a></li>
            <li><a href="question19.action"><%=lb.getString("q19.title")%>:<%=lb.getString("q19.body")%></a></li>
            <li><a href="question20.action"><%=lb.getString("q20.title")%>:<%=lb.getString("q20.body")%></a></li>
        </ul>
    </dd>
    <dt class="accordion-header"><%=lb.getString("topic8.title")%></dt><dd>
        <ul>
            <li><a href="question21.action"><%=lb.getString("q21.title")%>:<%=lb.getString("q21.body")%></a></li>
        </ul>
    </dd>
</dl>
<script>
  $(function(){
    $(".navigation").accordion({header:'dt.accordion-header',heightStyle:'content',autoHeight: false,collapsible:true});    
  })
</script>
<%}%>

