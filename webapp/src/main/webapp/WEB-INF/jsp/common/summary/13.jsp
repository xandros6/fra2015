<%@ include file="../../common/includes/taglibs.jsp"%>
<c:set var="q" value="13" />
	<c:set var ="qpath" value="${surveypath}/${q}" />

			<tr>
				<td rowspan="6"><a href="${qpath}#13a">13a</a></td>
			</tr>
			<tr>
				<td colspan="2"></td>
				<td><strong><spring:message code="ref414"></spring:message></strong></td>
				<td><strong><spring:message code="ref415"></spring:message></strong></td>
				<td colspan="3"><strong>Checkboxes</strong></td>
			</tr>
			<tr>
				<td>13.1 <spring:message code="ref423"></spring:message></td>
				<td>%,year,checkboxes</td>
				<td>${_fraVariable_13a_2_1_}</td>
				<td>${_fraVariable_13a_2_2_}</td>
				<td colspan="3">
					<c:if test="${_fraVariable_13a_2_3_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_13a_2_3_ =='no'}"><spring:message code="chk.no"></spring:message></c:if>,
					<c:if test="${_fraVariable_13a_2_4_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_13a_2_4_ =='no'}"><spring:message code="chk.no"></spring:message></c:if>,
					<c:if test="${_fraVariable_13a_2_5_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_13a_2_5_ =='no'}"><spring:message code="chk.no"></spring:message></c:if>,
					<c:if test="${_fraVariable_13a_2_6_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_13a_2_6_ =='no'}"><spring:message code="chk.no"></spring:message></c:if>,
					<c:if test="${_fraVariable_13a_2_7_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_13a_2_7_ =='no'}"><spring:message code="chk.no"></spring:message></c:if>,
					<c:if test="${_fraVariable_13a_2_8_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_13a_2_8_ =='no'}"><spring:message code="chk.no"></spring:message></c:if>	
				</td>
			</tr>
			<tr>
				<td>13.2 <spring:message code="ref424"></spring:message></td>
				<td>%,year,checkboxes</td>
				<td>${_fraVariable_13a_3_1_}</td>
				<td>${_fraVariable_13a_3_2_}</td>
				<td colspan="3">
					<c:if test="${_fraVariable_13a_3_3_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_13a_3_3_ =='no'}"><spring:message code="chk.no"></spring:message></c:if>,
					<c:if test="${_fraVariable_13a_3_4_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_13a_3_4_ =='no'}"><spring:message code="chk.no"></spring:message></c:if>,
					<c:if test="${_fraVariable_13a_3_5_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_13a_3_5_ =='no'}"><spring:message code="chk.no"></spring:message></c:if>,
					<c:if test="${_fraVariable_13a_3_6_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_13a_3_6_ =='no'}"><spring:message code="chk.no"></spring:message></c:if>,
					<c:if test="${_fraVariable_13a_3_7_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_13a_3_7_ =='no'}"><spring:message code="chk.no"></spring:message></c:if>,
					<c:if test="${_fraVariable_13a_3_8_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_13a_3_8_ =='no'}"><spring:message code="chk.no"></spring:message></c:if>
				</td>
			</tr>
			<tr>
				<td>13.3 <spring:message code="ref425"></spring:message></td>
				<td>%,year,checkboxes</td>
				<td>${_fraVariable_13a_4_1_}</td>
				<td>${_fraVariable_13a_4_2_}</td>
				<td colspan="3">
					<c:if test="${_fraVariable_13a_4_3_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_13a_4_3_ =='no'}"><spring:message code="chk.no"></spring:message></c:if>,
					<c:if test="${_fraVariable_13a_4_4_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_13a_4_4_ =='no'}"><spring:message code="chk.no"></spring:message></c:if>
				</td>
			</tr>
			<tr>
				<td>13.4 <spring:message code="ref426"></spring:message></td>
				<td>%,year,checkboxes</td>
				<td>${_fraVariable_13a_5_1_}</td>
				<td>${_fraVariable_13a_5_2_}</td>
				<td colspan="3" class="notpresent"></td>
			</tr>
			<tr>
				<td rowspan="6"><a href="${qpath}#13b">13b</a></td>
			</tr>
			<tr>
				<td>13.5 <spring:message code="ref428"></spring:message></td>
				<td>%,year,checkboxes</td>
				<td class="numeric" colspan="5">${_fraVariable_13a_2_2_}, ${_fraVariable_13a_3_2_}, ${_fraVariable_13a_4_2_}, ${_fraVariable_13a_5_2_}</td>
				
			</tr>
			<tr>
				<td>13.5.1 <spring:message code="ref430"></spring:message></td>
				<td>checkbox</td>
				<td class="notpresent" ></td>
				<td class="notpresent" ></td>
				<td class="notpresent" ></td>
				<td class="boolean"><c:if test="${_fraVariable_13b_1_1_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_13b_1_1_ =='no'}"><spring:message code="chk.no"></spring:message></c:if></td>
				<td class="notpresent" ></td>
			</tr>
			<tr>
				<td>13.5.2 <spring:message code="ref431"></spring:message></td>
				<td>checkbox</td>
				<td class="notpresent" ></td>
				<td class="notpresent" ></td>
				<td class="notpresent" ></td>
				<td class="boolean"><c:if test="${_fraVariable_13b_3_1_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_13b_3_1_ =='no'}"><spring:message code="chk.no"></spring:message></c:if></td>
				<td class="notpresent" ></td>
			</tr>
			<tr>
				<td>13.5.3 <spring:message code="ref432"></spring:message></td>
				<td>checkbox</td>
				<td class="notpresent" ></td>
				<td class="notpresent" ></td>
				<td class="notpresent" ></td>
				<td class="boolean"><c:if test="${_fraVariable_13b_5_1_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_13b_5_1_ =='no'}"><spring:message code="chk.no"></spring:message></c:if></td>
				<td class="notpresent" ></td>
			</tr>
			<tr>
				<td>13.5.4 <spring:message code="ref433"></spring:message></td>
				<td>checkbox</td>
				<td class="notpresent" ></td>
				<td class="notpresent" ></td>
				<td class="notpresent" ></td>
				<td class="boolean"><c:if test="${_fraVariable_13b_7_1_ =='yes'}"><spring:message code="chk.yes"></spring:message></c:if><c:if test="${_fraVariable_13b_7_1_ =='no'}"><spring:message code="chk.no"></spring:message></c:if></td>
				<td class="notpresent" ></td>
			</tr>