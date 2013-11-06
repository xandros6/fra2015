<%@ include file="../../common/includes/taglibs.jsp"%>
<c:set var="q" value="20" />
	<c:set var ="qpath" value="${surveypath}/${q}" />
			<tr>
				<td rowspan="2"><a href="${qpath}#20">20</a></td>
			</tr>
			<tr class="summaryRow">
				<td>20.1 <spring:message code="ref552"></spring:message></td>
				<td>1000 local currency</td>
				<td class="numeric"  colspan=5>${_fraVariable_20_1_1_}</td>
			</tr>