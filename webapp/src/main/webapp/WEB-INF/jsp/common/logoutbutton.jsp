<%@ include file="includes/taglibs.jsp"%>
<button type="submit" class="logout btn"
	onClick="location.href='<c:url value="/j_spring_security_logout" />'">
	<i class="icon-off"></i>
	<spring:message code="toolbar.logout" />
</button>
<!-- MESSAGE UTILITY -->
<c:if test="${(not empty messageCode) && (not empty messageType)}">
<div id="savemessage" class="modal hide fade alert alert-${messageType}"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<button type="button" class="close" data-dismiss="alert">×</button>
	<div class="modal-body" style="text-align: center;">
		<strong><spring:message code="${messageCode}"></spring:message>
		${not empty messageTrailCode ?':':''}
		</strong>
		<c:if test="${(not empty messageTrailCode)}">
		<spring:message code="${messageTrailCode}"></spring:message>
		</c:if>
		<c:if test="${(not empty notLocalizedMessage)}">
		${notLocalizedMessage}
		</c:if>
	</div>

</div>
</c:if>