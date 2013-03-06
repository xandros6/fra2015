<%@ include file="includes/taglibs.jsp"%>
<button type="submit" class="logout btn"
	onClick="location.href='<c:url value="/j_spring_security_logout" />'">
	<i class="icon-off"></i>
	<spring:message code="toolbar.logout" />
</button>