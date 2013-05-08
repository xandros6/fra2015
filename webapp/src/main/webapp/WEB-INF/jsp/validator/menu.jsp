<%@ include file="../common/includes/taglibs.jsp"%>
<ul class="nav">
	<li class="${context=='survey' ? 'active' : '' }"><a
		href="${pageContext.request.contextPath}/acceptance/view/0" class="tab"><spring:message code="toolbar.survey" /></a></li>
	<li class="${context=='export' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/export"
		class="tab"><spring:message code="toolbar.export" /></a></li>
	<c:if test="${status=='completed'}">
		<li><a data-toggle="modal" href="#acceptConfirm"
			class="tab"><spring:message code="acceptance.accept"></spring:message></a></li>
			<li><a data-toggle="modal" href="#acceptDecline"
			class="tab"><spring:message code="acceptance.decline" text="Decline"></spring:message></a></li>
	</c:if>
</ul>
<div id="acceptConfirm" class="modal hide fade span8">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">x</button>
			<h3><spring:message code="acceptance.acceptSurvey"></spring:message></h3>
		</div>
		
		<div id="modal-body" class="modal-body">
		<spring:message code="acceptance.acceptConfirmBody"></spring:message>
		</div>
		
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal"><spring:message code="close"></spring:message></a> 
			<a id="updateBtn" href="${pageContext.request.contextPath}/acceptance/accept/" class="btn btn-primary"><spring:message code="acceptance.accept"></spring:message></a>
		</div>
</div>
<div id="acceptDecline" class="modal hide fade span8">
	<form>
		<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">x</button>
		
			<h3><spring:message code="acceptance.declineSurvey" text="Decline survey"></spring:message></h3>
		</div>
		
		<div id="modal-body" class="modal-body">
		<spring:message code="acceptance.acceptDeclineBody" text="do you want to reject this survey? Please leave a message:"></spring:message>
		<textarea style="width:90%" name="message"></textarea>
		
		</div>
		
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal"><spring:message code="close"></spring:message></a> 
			<a id="declineBtn" href="${pageContext.request.contextPath}/acceptance/decline/" class="btn btn-primary"><spring:message code="acceptance.decline" text="Decline"></spring:message></a>
		</div>
	</form>
</div>