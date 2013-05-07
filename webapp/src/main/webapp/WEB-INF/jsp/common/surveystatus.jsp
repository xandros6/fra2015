<%@ include file="../common/includes/taglibs.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../common/includes/javascript.jsp"%>
<jsp:useBean id="dateValue" class="java.util.Date" />

<div>
	<div class="container">
		<h1>
			<spring:message code="country.${countrycode}"
				text="Undefined Country"></spring:message>
		</h1>

		<div class="span6">
			<h3>
				<spring:message code="currentstatus" text="Current Status"></spring:message>
			</h3>
			<dl class="">
				<dt>
					<spring:message code="status" text="Status"></spring:message>
				</dt>
				<dd>
					<spring:message code="${statuscode}"></spring:message>
				</dd>
				<dt>
					<spring:message code="lastmessage" text="Last Message"></spring:message>
				</dt>
				<dd>${status.message}</dd>
				<dt>
					<spring:message code="currentcoverage" text="Current coverage"></spring:message>
				</dt>
				<dd>${status.coverage}</dd>
				<dt>
					<spring:message code="lastreviewersubmit"
						text="Last Review Submitters"></spring:message>
				</dt>
				<dd>${status.reviewerSubmit}</dd>
				<c:if test="${not empty status.lastContributorSubmission}">
					<dt>
						<spring:message code="lastcountributorsubmit"
							text="Last Contributor Submit"></spring:message>
					</dt>

					<dd>
						<jsp:useBean id="lastContributorSubmission" class="java.util.Date" />
						<jsp:setProperty name="lastContributorSubmission" property="time"
							value="${status.lastContributorSubmission}" />
						<fmt:formatDate value="${lastContributorSubmission}"
							pattern="MM/dd/yyyy HH:mm" />
						</p>
					</dd>
				</c:if>
				<c:if test="${not empty status.lastSurveyReview}">

					<dt>
						<spring:message code="lastreview" text="Last Review"></spring:message>
					</dt>
					<dd>
						<jsp:useBean id="lastreview" class="java.util.Date" />
						<jsp:setProperty name="lastreview" property="time"
							value="${status.lastSurveyReview}" />
						<fmt:formatDate value="${lastreview}" pattern="MM/dd/yyyy HH:mm" />
						</p>
					</dd>
				</c:if>
			</dl>
			<h3>
				<spring:message code="user" text="Users"></spring:message>
				</h2>
				<table id="coverage"
					class="table table-bordered table-hover .table-condensed table-striped">
					<thead>
						<tr>
							<th><spring:message code="roles" text="Roles"></spring:message></th>
							<th><spring:message code="number of users"
									text="Number of users"></spring:message></th>
							<th><spring:message code="users" text="users"></spring:message></th>
						</tr>
					</thead>
					<c:forEach items='${users}' var='role' varStatus='rowItem'>
						<tr class="rowItem ${fn:length(role.value)==0 ?'error':'success'}">
							<td class="role"><spring:message code="${role.key}"
									text="${role.key}"></spring:message></td>
							<td class="number">${fn:length(role.value)}</td>
							<td class="role"><c:forEach items='${role.value}' var='user'
									varStatus='rowItem'>
			 	${user.username}
			 </c:forEach></td>

						</tr>
					</c:forEach>
				</table>
		</div>
		<div class="span5">

			<h3>
				<spring:message code="statuschanges" text="Status Changes"></spring:message>
				</h2>
				<table id="coverage"
					class="table table-bordered table-hover .table-condensed">
					<thead>
						<tr>
							<th><spring:message code="question" text="Question"></spring:message></th>
							<th><spring:message code="number of users" text="Coverage"></spring:message></th>
							<th><spring:message code="reviewers" text="Reviewers"></spring:message></th>
						</tr>
					</thead>
					<c:forEach items='${coverage}' var='question' varStatus='rowItem'>
						<tr
							class="rowItem ${fn:length(question.value)==0 ? 'error': 'success'}">
							<td class="Question">${question.key}</td>
							<td class="username">${fn:length(question.value)}</td>
							<td class="role"><c:forEach items='${question.value}'
									var='user' varStatus='rowItem'>
			 	${user.username}
			 </c:forEach></td>

						</tr>
					</c:forEach>
				</table>
		</div>
		<h3>
			<spring:message code="status changes" text="Status Changes"></spring:message>
			</h2>
			<table id="statuschanges"
				class="table table-bordered table-hover .table-condensed">
				<thead>
					<tr>
						  <th><spring:message code="timestamp"></spring:message></th>
			              <th><spring:message code="username"></spring:message></th>
			              <th><spring:message code="country"></spring:message></th>
			              <th><spring:message code="question"></spring:message></th>
			              <th><spring:message code="content"></spring:message></th>
					</tr>
				</thead>
				<c:forEach items='${statuschanges}' var='statuschange'
					varStatus='rowItem'>
					<tr class="rowItem">
						<td class="span2"><div>${statuschange.date}</div></td>
						<td class="span2"><div>${statuschange.username}</div></td>
						<td class="span1"><div>${statuschange.country}</div></td>
						<td class="span1"><div>${statuschange.question_id}</div></td>
						<td class="span2"><div>${statuschange.content}</div></td>

					</tr>
				</c:forEach>
			</table>
	</div>
</div>

