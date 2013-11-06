<%@ include file="../../common/includes/taglibs.jsp"%>
<c:set var="q" value="11" />
	<c:set var ="qpath" value="${surveypath}/${q}" />
<tr>
				<td rowspan="2"><a href="${qpath}#11">11</a></td>
			</tr>
			<tr class="summaryRow">
				<td>11.1 <spring:message code="ref396"></spring:message></td>
				<td>Boolean</td>
				<td class="notpresent" ></td>
				<td class="notpresent" ></td>
				<td class="notpresent" ></td>
				<td class="boolean"><c:if test="${_fraVariable_11_0_1_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_11_0_1_ =='no'}"><spring:message code="chk.no"></spring:message></c:if></td>
				<td class="notpresent" ></td>
			</tr>