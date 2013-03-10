<%@ include file="../common/includes/taglibs.jsp"%>
<div>
	<div>
		<div class="container">
			<div class="check-page">


				<div id="messagePanel" class="alert alert-error">
					<spring:message code="error.violateconstraints"></spring:message>
					<ul>
						<li><spring:message code="refrule_error_1"></spring:message></li>
						<li><spring:message code="refrule_error_2"></spring:message></li>
						<li><spring:message code="refrule_error_3"></spring:message></li>
						<li><spring:message code="refrule_error_4"></spring:message></li>
						<li><spring:message code="refrule_error_5"></spring:message></li>
						<li><spring:message code="refrule_error_7"></spring:message></li>
						<li><spring:message code="refrule_error_8"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
						<li><spring:message code="refref_to_error_message"></spring:message></li>
					</ul>
				</div>
				<form method="POST" action="">
				<div id="textPanel">

					<p><spring:message code="submit.addnote"/></p>
					<textarea id="submitmessage" name="submitmessage" rows="5" class="span12"></textarea>
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
$(function(){
	$('#submitmessage').keyup(function(){
		$('#submitButton').toggleClass('disabled',!$('#submitmessage').val()!="");
			 
	
	})

});


</script>