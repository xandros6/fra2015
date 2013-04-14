<%@ include file="../common/includes/taglibs.jsp"%>

<div class='pull-right label label-inverse'>
	<spring:message code="survey.country">: </spring:message><spring:message code="country.${country}"></spring:message>
	<br/>
	<spring:message code="survey.status">: 
	<span id="statuslabelhoverable" href="#" data-toggle="tooltip" 
		 data-original-title="<spring:message code="survey.status.${statuscode}.description" text=""></spring:message>"
		title
		data-placement="bottom">
		</spring:message><spring:message code="${statuscode}"></spring:message>
	</span>
</div>
<script>
$(function(){
	$('#statuslabelhoverable').tooltip();
});
</script>