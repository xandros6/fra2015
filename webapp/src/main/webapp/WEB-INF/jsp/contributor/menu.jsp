<%@ include file="../common/includes/taglibs.jsp"%>
<ul class="nav">
	<li class="${context=='survey' ? 'active' : '' }"><a
		href="${pageContext.request.contextPath}/survey/0" class="tab"><spring:message code="toolbar.survey" /></a></li>
	<li class="${context=='check' ? 'active' :'' }"><a href="${pageContext.request.contextPath}/check"
		class="tab"><spring:message code="toolbar.check" /></a></li>
	<li class="${context=='summary' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/summary"
		class="tab"><spring:message code="toolbar.summary" /></a></li>
	<li class="${context=='export' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/export"
		class="tab"><spring:message code="toolbar.export" /></a></li>
</ul>