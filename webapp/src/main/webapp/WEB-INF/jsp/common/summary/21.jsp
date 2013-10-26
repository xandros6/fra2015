<%@ include file="../../common/includes/taglibs.jsp"%>
<c:set var="q" value="21" />
	<c:set var ="qpath" value="${surveypath}/${q}" />
			<tr>
				<td rowspan="2"><a href="${qpath}#21a">21a</a></td>
			</tr>
			<tr>
				<td>21.1 <spring:message code="ref555"></spring:message></td>
				<td>1000 ha</td>
				<td class="numeric"  colspan="5">${_fraVariable_21a_2_1_}, ${_fraVariable_21a_2_2_}</td>
			</tr>
			<tr>
				<td rowspan="2"><a href="${qpath}#21b">21b</a></td>
			</tr>
			<tr>
				<td>21.2 <spring:message code="ref557"></spring:message></td>
				<td>1000 ha</td>
				<td class="numeric"  colspan="5">${_fraVariable_21b_2_1_}</td>
			</tr>