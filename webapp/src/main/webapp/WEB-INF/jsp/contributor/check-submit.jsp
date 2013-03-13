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
				<form method="POST" action="">
					<div id="textPanel">

						<p>
							<spring:message code="submit.addnote" />
						</p>
						<textarea id="submitmessage" name="submitmessage" rows="5"
							class="span12"></textarea>
					</div>

					<div id="buttonPanel" class="pull-right">
						<button id="submitButton" class="btn btn-large btn-info disabled">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		$('#submitmessage').keyup(
				function() {
					$('#submitButton').toggleClass('disabled',
							!$('#submitmessage').val() != "");

				})

	});
</script>