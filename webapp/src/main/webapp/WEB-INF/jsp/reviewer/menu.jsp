<%@ include file="../common/includes/taglibs.jsp"%>
<ul class="nav">
	<jsp:include page="../common/survey_menu.jsp" />
	<li class="${context=='surveylist' ? 'active' : '' }"><a
		href="${pageContext.request.contextPath}/surveylist/0" class="tab" data-i18n="toolbar_surveys"><spring:message
				code="toolbar.surveys" /></a></li>
	<li class="${context=='activitylog' ? 'active' : '' }"><a
		href="${pageContext.request.contextPath}/revieweractivitylog" class="tab"> <spring:message
				code="toolbar.activity_log" /></a></li>
	<li><a class="${context=='export' ? 'active' : '' }" href="${pageContext.request.contextPath}/revexport"
		data-i18n="toolbar_export"><spring:message
				code="toolbar.export" /></a></li>
	<li class="${context=='settings' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/usersettings"
		class="tab"><spring:message code="toolbar.settings" /></a></li>
	<li class="${context=='summaryStatus' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/summaryStatus/0"
		class="tab"><spring:message code="toolbar.summaryStatus" /></a></li>
</ul>