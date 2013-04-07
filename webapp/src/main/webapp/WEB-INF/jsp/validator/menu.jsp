<%@ include file="../common/includes/taglibs.jsp"%>
<ul class="nav">
	<li class="${context=='survey' ? 'active' : '' }"><a
		href="${pageContext.request.contextPath}/survey/view/0" class="tab"><spring:message code="toolbar.survey" /></a></li>
	<li class="${context=='export' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/export"
		class="tab"><spring:message code="toolbar.export" /></a></li>

</ul>