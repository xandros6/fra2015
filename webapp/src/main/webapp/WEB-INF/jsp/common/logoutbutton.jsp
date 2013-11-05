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
		
		<button type="button" class="close" data-dismiss="modal">×</button>
		
		<c:if test="${messageType == 'confirm'}">
			<div class="modal-header">
				<h3>
					<spring:message code="reviewers.submit"></spring:message>
				</h3>
			</div>
		</c:if>
		
		<div class="modal-body" style="text-align: center;">
			<strong>
				<spring:message code="${messageCode}"></spring:message>
				${not empty messageTrailCode ?':':''}
			</strong>
			<c:if test="${(not empty messageTrailCode)}">
				<spring:message code="${messageTrailCode}"></spring:message>
			</c:if>
			<c:if test="${(not empty notLocalizedMessage)}">
				${notLocalizedMessage}
			</c:if>
		</div>
		
		<c:if test="${messageType == 'confirm'}">
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">
					<spring:message	code="close"></spring:message>
				</a> 
				
				<a id="updateBtn" href="../reviewersubmitconfirmed/${confirmedAttribute}" class="btn btn-primary confirm">
					<spring:message code="reviewers.submit.button"></spring:message>
				</a>
			</div>
		</c:if>
	</div>
</c:if>