<%@ include file="../common/includes/taglibs.jsp"%>
<ul class="nav">
	<li class="${context=='activitylog' ? 'active' : '' }"><a href="adminactivitylog"
		class="tab"> <spring:message code="toolbar.activity_log" /></a></li>
	<li class="${context=='users' ? 'active' : '' }"><a href="${context=='users' ? '#' : 'users/' }"
		class="tab" data-i18n="toolbar_create_users"><spring:message code="toolbar.create.users" /></a></li>
	<li class="${context=='adminexport' ? 'active' : '' }"><a href="adminexport"
		class="tab" data-i18n="toolbar_export"><spring:message code="toolbar.export" /></a></li>
</ul>