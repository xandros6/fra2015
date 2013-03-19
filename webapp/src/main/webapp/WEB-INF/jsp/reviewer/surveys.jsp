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
					<th></th>
				</tr>
			</thead>
			<tbody>



				<c:forEach items='${surveys}' var='survey' varStatus='rowItem'>
					<tr class="rowItem">
						<td>${survey.country.name} ( ${survey.country.iso3} )</td>
						<td>TODO</td>

						<td>${survey.status.status}</td>
						<%-- 								<td>${user.countries}</td> --%>
						<td><a href="../survey/review/${survey.country.iso3}/0" class="btn">View</a></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<ul class="pager pull-right">
			<c:if test="${prev}">
			<li class="${prev?'':'disabled'}"><a href="${prev?page-1:'#'}">Prev</a></li>
			</c:if>
			<c:if test="${next}">
			<li class="${next?'':'disabled'}"><a href="${next?page+1:'#'}">Next</a></li>
			</c:if>
		</ul>
	</div>
</div>