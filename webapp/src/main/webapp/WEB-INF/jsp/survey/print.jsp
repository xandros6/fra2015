<%@ page isELIgnored="false" %>
<%@ include file="../common/includes/taglibs.jsp"%>
<html>
  <head>
    <title><c:out value="${country}"/></title>	   
    <meta id="baseUrl" content="${baseURL}" />
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <jsp:include page="../common/includes/css.jsp" />
	</head>
	<body>
	  <div style="display:none">
	     <c:forEach var="key" items="${messageKeys}" >
			    <span id="${key}"><spring:message code="${key}"/></span>
			 </c:forEach>
	  </div>
		<div id="all" style="padding: 30px">
		<jsp:include page="questions/q0.jsp" />
		<jsp:include page="questions/q1.jsp" />
		<jsp:include page="questions/q2.jsp" />
		<jsp:include page="questions/q3.jsp" />
		<jsp:include page="questions/q4.jsp" />
		<jsp:include page="questions/q5.jsp" />
		<jsp:include page="questions/q6.jsp" />
		<jsp:include page="questions/q7.jsp" />
		<jsp:include page="questions/q8.jsp" />
		<jsp:include page="questions/q9.jsp" />
		<jsp:include page="questions/q10.jsp" />
		<jsp:include page="questions/q11.jsp" />
		<jsp:include page="questions/q12.jsp" />
		<jsp:include page="questions/q13.jsp" />
		<jsp:include page="questions/q14.jsp" />
		<jsp:include page="questions/q15.jsp" />
		<jsp:include page="questions/q16.jsp" />
		<jsp:include page="questions/q17.jsp" />
		<jsp:include page="questions/q18.jsp" />
		<jsp:include page="questions/q19.jsp" />
		<jsp:include page="questions/q20.jsp" />
		<jsp:include page="questions/q21.jsp" />
		</div>
	</body>
</html>