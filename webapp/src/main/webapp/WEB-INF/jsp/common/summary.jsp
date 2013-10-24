<%@ include file="../common/includes/taglibs.jsp"%>

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
			<tr>
				<td></td>
				<td colspan="7"><strong><spring:message code="ref10"></spring:message></strong></td>
			</tr>
			<jsp:include page="summary/1.jsp"/>
			
		 	<jsp:include page="summary/2.jsp"/>
		 	<!-- TOPIC II -->
			<tr>
				<td></td>
				<td colspan="7"><strong><spring:message code="ref129"></spring:message></strong></td>
			</tr>
			<jsp:include page="summary/3.jsp"/>
			<jsp:include page="summary/4.jsp"/>
			<!-- TOPIC III -->
			<tr>
				<td></td>
				<td colspan="7"><strong><spring:message code="ref258"></spring:message></strong></td>
			</tr>
			<jsp:include page="summary/5.jsp"/>
			<!-- TOPIC IV -->
			<tr>
				<td></td>
				<td colspan="7"><strong><spring:message code="ref309"></spring:message></strong></td>
			</tr>
			<jsp:include page="summary/6.jsp"/>
			<!-- TOPIC V -->
			<tr>
				<td></td>
				<td colspan="7"><strong><spring:message code="ref318"></spring:message></strong></td>
			</tr>
			<jsp:include page="summary/7.jsp"/>
			<jsp:include page="summary/8.jsp"/>
			<jsp:include page="summary/9.jsp"/>
			<!-- TOPIC VI -->
			<tr>
				<td></td>
				<td colspan="7"><strong><spring:message code="ref376"></spring:message></strong></td>
			</tr>
			<jsp:include page="summary/10.jsp"/>
			<jsp:include page="summary/11.jsp"/>
			<jsp:include page="summary/12.jsp"/>
			<jsp:include page="summary/13.jsp"/>
			<jsp:include page="summary/14.jsp"/>
			<jsp:include page="summary/15.jsp"/>
			<jsp:include page="summary/16.jsp"/>
			<!-- TOPIC VII -->
			<tr>
				<td></td>
				<td colspan="7"><strong><spring:message 	code="ref486"></spring:message></strong></td>
			</tr>
			<jsp:include page="summary/17.jsp"/>
			<jsp:include page="summary/18.jsp"/>
			<jsp:include page="summary/19.jsp"/>
			<jsp:include page="summary/20.jsp"/>
			<!-- TOPIC VIII -->
			<tr>
				<td></td>
				<td colspan="7"><strong><spring:message code="ref553"></spring:message></strong></td>
			</tr>
			<jsp:include page="summary/21.jsp"/>
		</tbody>
	</table>
</div>