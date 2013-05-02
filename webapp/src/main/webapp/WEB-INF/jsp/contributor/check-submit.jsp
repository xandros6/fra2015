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
				<c:if test="${!denysubmit}">
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
						<textarea id="submitmessage" name="submitmessage" rows="5"
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
</div>
<c:if test="${!allowsubmit}">
<script type="text/javascript">

	$(function() {
		$('#submitmessage').keyup(
				function() {
					var condition = !$('#submitmessage').val() != "";
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