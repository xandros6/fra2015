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
				</tr>
			</thead>
			<tbody>
				<c:forEach items='${surveys}' var='survey' varStatus='rowItem'>
					<tr class="rowItem">
						<td>${survey.country.name} ( ${survey.country.iso3} )</td>
						<td>TODO</td>

						<td><spring:message code="survey.status.${survey.status.status}"></spring:message></td>
						<%-- 								<td>${user.countries}</td> --%>
						<td class="countries"><div>${survey.status.reviewerSubmit}</div></td>
						<td>${survey.status.coverage}</td>
						<td>
						<a href="../survey/review/${survey.country.iso3}/0" class="btn"><spring:message code="surveylist.view"></spring:message></a>
						
							<a href="../reviewersubmit/${survey.country.iso3}" class="btn"><spring:message code="surveylist.submit"></spring:message></a>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<ul class="pager pull-right">
			<c:if test="${prev}">
			<li class="${prev?'':'disabled'}"><a href="${prev?page-1:'#'}"><spring:message code="prev"></spring:message></a></li>
			</c:if>
			<c:if test="${next}">
			<li class="${next?'':'disabled'}"><a href="${next?page+1:'#'}"><spring:message code="next"></spring:message></a></li>
			</c:if>
		</ul>
	</div>
</div>