<%@ include file="../common/includes/taglibs.jsp"%>
<div>
	<div class="container">
		<table id="surveyListTable"
			class="table table-bordered table-hover table-condensed">
			<thead>
				<tr>
					<th>Survey</th>
					<th>Last update</th>
					<th>Status</th>
					<th>Reviewer complete</th>
					<th>Revision coverage</th>
					<th></th>
					<th>Submit</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items='${surveys}' var='survey' varStatus='rowItem'>
					<c:set scope="page" var="countryIso3" value="${survey.country.iso3}" />
					<tr class="rowItem">
						<td>${survey.country.name} ( ${survey.country.iso3} )</td>
						<td>TODO</td>

						<td><spring:message
								code="survey.status.${survey.status.status}"></spring:message></td>
						<%-- 								<td>${user.countries}</td> --%>
						<td><div>${survey.status.reviewerSubmit}</div></td>
						<td>${survey.status.coverage}</td>
						<td><a href="../survey/review/${survey.country.iso3}/0"
							class="btn"><spring:message code="editor.surveylist.view"></spring:message></a>
						</td>
						<td><a data-toggle="modal" href="#pendingConfirm" class="btn"><spring:message
									code="editor.surveylist.pending"></spring:message></a> <a
							data-toggle="modal" href="#completedConfirm" class="btn"><spring:message
									code="editor.surveylist.completed"></spring:message></a></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<ul class="pager pull-right">
			<c:if test="${prev}">
				<li class="${prev?'':'disabled'}"><a href="${prev?page-1:'#'}"><spring:message
							code="prev"></spring:message></a></li>
			</c:if>
			<c:if test="${next}">
				<li class="${next?'':'disabled'}"><a href="${next?page+1:'#'}"><spring:message
							code="next"></spring:message></a></li>
			</c:if>
		</ul>
	</div>

	<div id="pendingConfirm" class="modal hide fade span8">
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
				class="btn btn-primary"><spring:message
					code="editor.surveylist.pending"></spring:message></a>
		</div>
	</div>

	<div id="completedConfirm" class="modal hide fade span8">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">x</button>
			<h3>
				<spring:message code="editor.submit"></spring:message>
			</h3>
		</div>

		<div id="modal-body" class="modal-body">
			<spring:message code="editor.surveylist.completed.msg"></spring:message>
			<br /> <b><spring:message code="editor.surveylist.alert"></spring:message></b>
		</div>

		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal"><spring:message
					code="close"></spring:message></a> <a id="updateBtn"
				href="../editorCompleted/${countryIso3}"
				class="btn btn-primary"><spring:message code="editor.surveylist.completed"></spring:message></a>
		</div>
	</div>

</div>