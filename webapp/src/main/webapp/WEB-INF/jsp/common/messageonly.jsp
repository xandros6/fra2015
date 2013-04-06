<%@ include file="../common/includes/taglibs.jsp"%>
<c:if test="${(not empty messageCode) && (not empty messageType)}">
	<div>
		<div>
		<div class="container">
	<div id="savemessage" class="alert alert-${messageType}">
		
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
	</div></div></div>
</c:if>