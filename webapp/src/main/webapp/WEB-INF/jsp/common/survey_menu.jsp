<%@ include file="../common/includes/taglibs.jsp"%>
<!-- menu for editors and reviewers -->
	<c:if test="${not empty country}">
		<li class="dropdown ${not empty country ? 'active' : ''}">
		       <a href="#" class="dropdown-toggle" data-toggle="dropdown"><spring:message code="toolbar.survey" /><b class="caret"></b></a>
		       <ul class="dropdown-menu">
		         <li class="${context=='survey' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/${'survey/review/AFG/0'}"><spring:message code="toolbar.survey" /></a></li>
		         <li class="${context=='check' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/${'check/AFG'}"><spring:message code="toolbar.status" /></a></li>
		         <li class="${context=='summary' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/${'summary/AFG'}"><spring:message code="toolbar.summary" /></a></li>
		       </ul>
	     </li>
    </c:if>