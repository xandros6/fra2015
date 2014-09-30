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
	  <div style="display:none" id="profileName">${profileName}</div>
	  <div style="display:none" id="userName">${userName}</div>
	  <div style="display:none" id="currentDate">${currentDate}</div>
	  <div style="display:none">
	     <c:forEach var="key" items="${messageKeys}" >
			    <div id="${key}"><spring:message code="${key}"/></div>
			 </c:forEach>
	  </div>
		<div id="all" style="padding: 30px">
	  <c:if test="${fraFnUtils:contains(questions,0)}">
		<jsp:include page="questions/q0.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,1)}">
		<jsp:include page="questions/q1.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
	  <c:if test="${fraFnUtils:contains(questions,2)}">
		<jsp:include page="questions/q2.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,3)}">
		<jsp:include page="questions/q3.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,4)}">
		<jsp:include page="questions/q4.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,5)}">
		<jsp:include page="questions/q5.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,6)}">
		<jsp:include page="questions/q6.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,7)}">
		<jsp:include page="questions/q7.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,8)}">
		<jsp:include page="questions/q8.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,9)}">
		<jsp:include page="questions/q9.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,10)}">
		<jsp:include page="questions/q10.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,11)}">
		<jsp:include page="questions/q11.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,12)}">
		<jsp:include page="questions/q12.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,13)}">
		<jsp:include page="questions/q13.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,14)}">
		<jsp:include page="questions/q14.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,15)}">
		<jsp:include page="questions/q15.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,16)}">
		<jsp:include page="questions/q16.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,17)}">
		<jsp:include page="questions/q17.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,18)}">
		<jsp:include page="questions/q18.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,19)}">
		<jsp:include page="questions/q19.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,20)}">
		<jsp:include page="questions/q20.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		<c:if test="${fraFnUtils:contains(questions,21)}">
		<jsp:include page="questions/q21.jsp" ><jsp:param name="hideEmpty" value="${hideEmpty}" /></jsp:include>
		</c:if>
		</div>
	</body>
</html>