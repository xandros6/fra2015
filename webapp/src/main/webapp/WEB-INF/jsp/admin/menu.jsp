<%@ include file="../common/includes/taglibs.jsp"%>
<ul class="nav">
	<li class="${context=='activitylog' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/adminactivitylog"
		class="tab"> <spring:message code="toolbar.activity_log" /></a></li>
	<li class="${context=='users' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/users"
		class="tab" data-i18n="toolbar_create_users"><spring:message code="toolbar.create.users" /></a></li>
	<li class="${context=='adminexport' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/adminexport"
		class="tab" data-i18n="toolbar_export"><spring:message code="toolbar.importexport" /></a></li>
	<li class="${context=='settings' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/usersettings"
		class="tab"><spring:message code="toolbar.settings" /></a></li>
</ul>