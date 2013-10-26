<%@ include file="../../common/includes/taglibs.jsp"%>
<c:set var="q" value="14" />
	<c:set var ="qpath" value="${surveypath}/${q}" />
			<tr>
				<td rowspan="4">14</td>
			</tr>
			<tr>
				<td>14.1 <spring:message code="ref436"></spring:message></td>
				<td>1000 ha</td>
				<td class="notpresent" ></td>
				<td class="notpresent" ></td>
				<td class="notpresent" ></td>
				<td class="numeric">${_fraVariable_14_1_1_}</td>
				<td class="notpresent" ></td>
			</tr>
			<tr>
				<td>14.1.1 <spring:message code="ref446"></spring:message></td>
				<td>1000 ha</td>
				<td class="notpresent" ></td>
				<td class="notpresent" ></td>
				<td class="notpresent" ></td>
				<td class="numeric">${_fraVariable_14_2_1_}</td>
				<td class="notpresent" ></td>
			</tr>
			<tr>
				<td>14.1.2 <spring:message code="ref447"></spring:message></td>
				<td>1000 ha</td>
				<td class="notpresent" ></td>
				<td class="notpresent" ></td>
				<td class="notpresent" ></td>
				<td class="numeric">${_fraVariable_14_3_1_}</td>
				<td class="notpresent" ></td>
			</tr>
			<tr>
				<td rowspan="4">14b</td>
			</tr>
			
			<tr>
				<td>14.2.1 <spring:message code="ref450"></spring:message></td>
				<td>Boolean</td>
				<td class="notpresent" ></td>
				<td class="notpresent" ></td>
				<td class="notpresent" ></td>
				<td class="boolean"><c:if test="${_fraVariable_14b_1_1_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_14b_1_1_ =='no'}"><spring:message code="chk.no"></spring:message></c:if></td>
				<td class="notpresent" ></td>
			</tr>
			<tr>
				<td>14.2.2 <spring:message code="ref451"></spring:message></td>
				<td>Boolean</td>
				<td class="notpresent"></td>
				<td class="notpresent"></td>
				<td class="notpresent"></td>
				<td class="boolean"><c:if test="${_fraVariable_14b_3_1_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_14b_3_1_ =='no'}"><spring:message code="chk.no"></spring:message></c:if></td>
				<td class="notpresent"></td>
			</tr>
			<tr>
				<td>14.2.3 <spring:message code="ref452"></spring:message></td>
				<td>Boolean</td>
				<td class="notpresent"></td>
				<td class="notpresent"></td>
				<td class="notpresent"></td>
				<td class="boolean"><c:if test="${_fraVariable_14b_5_1_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_14b_5_1_ =='no'}"><spring:message code="chk.no"></spring:message></c:if></td>
				<td class="notpresent"></td>
			</tr>
			<tr>
				<td rowspan="2">14c</td>
			</tr>
			<tr>
				<td>14.3 <spring:message code="ref454"></spring:message></td>
				<td>%</td>
				<td class="notpresent"></td>
				<td class="notpresent"></td>
				<td class="notpresent"></td>
				<td class="numeric">${_fraVariable_14c_0_1_}	</td>
				<td class="notpresent"></td>
			</tr>