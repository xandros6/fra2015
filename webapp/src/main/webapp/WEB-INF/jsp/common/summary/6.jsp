<%@ include file="../../common/includes/taglibs.jsp"%>
<c:set var="q" value="6" />
	<c:set var ="qpath" value="${surveypath}/${q}" />
			<tr>
				<td rowspan="3"><a href="${qpath}#6">6</a></td>
			</tr>
			<tr class="summaryRow">
				<td>6.1 <spring:message code="ref311"></spring:message></td>
				<td>1000 ha</td>
				<td class="numeric">${_fraVariable_6_2_1_}</td>
				<td class="numeric">${_fraVariable_6_2_2_}</td>
				<td class="numeric">${_fraVariable_6_2_3_}</td>
				<td class="numeric">${_fraVariable_6_2_4_}</td>
				<td class="numeric">${_fraVariable_6_2_5_}</td>
			</tr>
			<tr class="summaryRow">
				<td>6.2 <spring:message code="ref313"></spring:message></td>
				<td>1000 ha</td>
				<td class="numeric">${_fraVariable_6_3_1_}</td>
				<td class="numeric">${_fraVariable_6_3_2_}</td>
				<td class="numeric">${_fraVariable_6_3_3_}</td>
				<td class="numeric">${_fraVariable_6_3_4_}</td>
				<td class="numeric">${_fraVariable_6_3_5_}</td>
			</tr>