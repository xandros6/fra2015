<%@ include file="../common/includes/taglibs.jsp"%>
<c:choose>
	<c:when test="sessionUser.role = 'validator'">
		<!-- VALIDATOR -->
		<c:set var="surveypath" value="../survey/acceptance/view" scope="request" />
	</c:when>
	<c:when test="sessionUser.role = 'contributor'">
		<!-- CONTRIBUTOR -->
		<c:set var="surveypath" value="../survey/${country}" scope="request" />
	</c:when>
	<c:otherwise>
		<!-- REVIEWER -->
		<c:set var="surveypath" value="../survey/review/${country}" scope="request" />
	</c:otherwise>
</c:choose>

<div class="container">
<c:if test="${not empty statuscode && not empty country }">
				<jsp:include page="../common/statuslabel.jsp"></jsp:include>

	</c:if>

	<br/><br/><br/>
	<table
		class="table table-bordered table-hover table-condensed table-striped summary">
		<thead>
			<tr>
				<th></th>
				<th>Variables / TOPIC</th>
				<th>Unit</th>
				<th>1990</th>
				<th>2000</th>
				<th>2005</th>
				<th>2010</th>
				<th>2015</th>
			</tr>
		</thead>
		<tbody>
			<!-- TOPIC I -->
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q02') || fn:contains(allowedQuestions, 'q01')}">
			<tr>
				<td></td>
				<td colspan="7"><strong><spring:message code="ref10"></spring:message></strong></td>
			</tr>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q01')}">
				<jsp:include page="summary/1.jsp"/>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q02')}">
		 		<jsp:include page="summary/2.jsp"/>
	 		</c:if>
		 	<!-- TOPIC II -->
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q03') || fn:contains(allowedQuestions, 'q04')}">
				<tr>
					<td></td>
					<td colspan="7"><strong><spring:message code="ref129"></spring:message></strong></td>
				</tr>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q03')}">
				<jsp:include page="summary/3.jsp"/>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q04')}">
				<jsp:include page="summary/4.jsp"/>
			</c:if>
			<!-- TOPIC III -->
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q05')}">
				<tr>
					<td></td>
					<td colspan="7"><strong><spring:message code="ref258"></spring:message></strong></td>
				</tr>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q05')}">
				<jsp:include page="summary/5.jsp"/>
			</c:if>
			<!-- TOPIC IV -->
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q06')}">
				<tr>
					<td></td>
					<td colspan="7"><strong><spring:message code="ref309"></spring:message></strong></td>
				</tr>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q06')}">
				<jsp:include page="summary/6.jsp"/>
			</c:if>
			<!-- TOPIC V -->
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q07')|| fn:contains(allowedQuestions, 'q08')|| fn:contains(allowedQuestions, 'q09')}">
				<tr>
					<td></td>
					<td colspan="7"><strong><spring:message code="ref318"></spring:message></strong></td>
				</tr>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q07')}">
				<jsp:include page="summary/7.jsp"/>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q08')}">
				<jsp:include page="summary/8.jsp"/>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q09')}">
				<jsp:include page="summary/9.jsp"/>
			</c:if>
			
			<!-- TOPIC VI -->
			<c:if test="${sessionUser.role!='reviewer'  || fn:contains(allowedQuestions, 'q10')|| fn:contains(allowedQuestions, 'q11')|| fn:contains(allowedQuestions, 'q12')
														|| fn:contains(allowedQuestions, 'q13')
														|| fn:contains(allowedQuestions, 'q14')|| fn:contains(allowedQuestions, 'q15')|| fn:contains(allowedQuestions, 'q16') }">
				<tr>
					<td></td>
					<td colspan="7"><strong><spring:message code="ref376"></spring:message></strong></td>
				</tr>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q10')}">
				<jsp:include page="summary/10.jsp"/>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q11')}">
				<jsp:include page="summary/11.jsp"/>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q12')}">
				<jsp:include page="summary/12.jsp"/>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q13')}">
				<jsp:include page="summary/13.jsp"/>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q14')}">
				<jsp:include page="summary/14.jsp"/>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q15')}">
				<jsp:include page="summary/15.jsp"/>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q16')}">
				<jsp:include page="summary/16.jsp"/>
			</c:if>
			<!-- TOPIC VII -->
			<c:if test="${sessionUser.role!='reviewer'  || fn:contains(allowedQuestions, 'q17')|| fn:contains(allowedQuestions, 'q18')|| fn:contains(allowedQuestions,'q19')
														|| fn:contains(allowedQuestions, 'q20')}">
				<tr>
					<td></td>
					<td colspan="7"><strong><spring:message 	code="ref486"></spring:message></strong></td>
				</tr>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q17')}">			
				<jsp:include page="summary/17.jsp"/>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q18')}">
				<jsp:include page="summary/18.jsp"/>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q19')}">
				<jsp:include page="summary/19.jsp"/>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q20')}">
				<jsp:include page="summary/20.jsp"/>
			</c:if>
			<!-- TOPIC VIII -->
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q21')}">
			<tr>
				<td></td>
				<td colspan="7"><strong><spring:message code="ref553"></spring:message></strong></td>
			</tr>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q21')}">
				<jsp:include page="summary/21.jsp"/>
			</c:if>
		</tbody>
	</table>
</div>