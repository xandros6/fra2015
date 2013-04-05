<%@ include file="includes/taglibs.jsp"%>
<div class="pull-right">
	<p>
		<spring:message code="user.loggedas" />
		<span id="userField">${sessionUser.name} </span>
		<!-- TODO user name + country -->
	</p>

</div>