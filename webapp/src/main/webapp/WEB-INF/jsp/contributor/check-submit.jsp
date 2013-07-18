<%@ include file="../common/includes/taglibs.jsp"%>
<div>
	<div>
		<div class="container">
			<div class="check-page">
				
				<c:if
					test="${not empty validationResult && !validationResult.success}">

					<div id="messagePanel" class="alert alert-error">
						<spring:message code="error.violateconstraints"></spring:message>
						<ul>
							<c:forEach var="mess" items="${validationResult.errorMessages}">
								<c:if test="${ !mess.success }">
									<li><spring:message code="${mess.message}"></spring:message>:
										<c:forEach var="el" items="${mess.sortedElements}">
					 				${el},
					 		
					 				</c:forEach></li>
								</c:if>

							</c:forEach>
						</ul>

					</div>
				</c:if>
				<c:if test="${not empty validationResult.successMessages}">
					<div id="messagePanel" class="alert alert-success">
						<spring:message code="alert.passedcontraints"></spring:message>
						<ul>
							<c:forEach var="mess" items="${validationResult.messages}">

								<c:if test="${ mess.success }">
									<li><spring:message code="${mess.message}"></spring:message></li>
								</c:if>
							</c:forEach>
						</ul>

					</div>
				</c:if>
				<c:if test="${!denysubmit && cansubmit}">
				<c:if test="${allowsubmit}">
				<div id="messagePanel" class="alert alert-success"><spring:message code="validation.success"></spring:message></div>
				</c:if>
				<form method="POST" action="">
					<div id="textPanel">
						<c:if test="${!allowsubmit}">
						<p>
							<spring:message code="submit.addnote" />
						</p>
						</c:if>
						<textarea id="submitmessage" name="submitmessage" rows="5" onKeyUp="limitText(15);"
							class="span12"></textarea>
					</div>
					
					<div id="buttonPanel" class="pull-right">
						<button id="submitButton"
							class="btn btn-large btn-info ${!allowsubmit ? 'disabled':''}" ${!allowsubmit ? 'disabled':''}><spring:message code="submit.button" /></button>
					</div>
				</form>
				</c:if>
				<c:if test="${denysubmit}">
				<div id="messagePanel" class="alert alert-warning"><spring:message code="submit.statuserror"></spring:message></div>
				</c:if>
				

			</div>
		</div>
	</div>
	
	<%--
	<div id="submitConfirm" class="modal hide fade span8">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">x</button>
			<h3>
				<spring:message code="editor.submit"></spring:message>
			</h3>
		</div>

		<div id="modal-body" class="modal-body">
			<spring:message code="editor.surveylist.pending.msg"></spring:message>
			<br /> <b><spring:message code="editor.surveylist.alert"></spring:message></b>
		</div>

		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal"><spring:message
					code="close"></spring:message></a> <a id="updateBtn"
				href="../editorPendingFix/${countryIso3}"
				class="btn btn-primary confirm"><spring:message
					code="editor.surveylist.pending"></spring:message></a>
		</div>
	</div>
	
	<script type="text/javascript">
	$(function(){
		var sethref 
		$('.submitConfirm').click(function(){
			$('#submitConfirm .confirm').attr('href','../editorCompleted/'+$(this).attr('data-country'));
			
		});
	});
	
	</script>
	--%>
</div>

<c:if test="${!allowsubmit}">
<script type="text/javascript">

	$(function() {
		$('#submitmessage').keyup(
				function() {
					var condition = !$('#submitmessage').val() != "";
					$('#submitmessage').val($('#submitmessage').val().substring(0,4000));
					$('#submitButton').toggleClass('disabled',
							condition);
					if (condition){
						$('#submitButton').attr("disabled","disabled");
					}else{
						
						$('#submitButton').removeAttr("disabled");
					}
				})

	});
	
	
</script>
</c:if>