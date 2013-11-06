<%@ include file="../../common/includes/taglibs.jsp"%>
<c:set var="q" value="4" />
	<c:set var ="qpath" value="${surveypath}/${q}" />
			<tr>
				<td rowspan="3"><a href="${qpath}#4a">4a</a></td>
			</tr>
			<tr class="summaryRow">
				<td>4.1 <spring:message code="ref218"></spring:message></td>
				<td>1000 ha</td>
				<td class="numeric">${_fraVariable_4a_2_1_}</td>
				<td class="numeric">${_fraVariable_4a_2_2_}</td>
				<td class="numeric">${_fraVariable_4a_2_3_}</td>
				<td class="numeric">${_fraVariable_4a_2_4_}</td>
				<td class="numeric">${_fraVariable_4a_2_5_}</td>
			</tr>
			<tr class="summaryRow">
				<td>4.2 <spring:message code="ref220"></spring:message></td>
				<td>1000 ha</td>
				<td class="numeric">${_fraVariable_4a_3_1_}</td>
				<td class="numeric">${_fraVariable_4a_3_2_}</td>
				<td class="numeric">${_fraVariable_4a_3_3_}</td>
				<td class="numeric">${_fraVariable_4a_3_4_}</td>
				<td class="numeric">${_fraVariable_4a_3_5_}</td>
			</tr>
			<% /* <tr>
				<td>4.3 <spring:message code="ref222"></spring:message></td>
				<td>1000 ha</td>
				<td class="numeric">${_fraVariable_4a_4_1_}</td>
				<td class="numeric">${_fraVariable_4a_4_2_}</td>
				<td class="numeric">${_fraVariable_4a_4_3_}</td>
				<td class="numeric">${_fraVariable_4a_4_4_}</td>
				<td class="numeric">${_fraVariable_4a_4_5_}</td>
			</tr>
			*/ %>
			<tr class="summaryRow">
				<td><a href="${qpath}#4b">4b</a></td>
				<td><spring:message code="ref231"></spring:message>
				<td>1000 local currency</td><%//TODO localize %>
				<td class="notpresent"></td>
				<td class="notpresent"></td>
				<td class="notpresent"></td>
				<td class="numeric">
					<c:catch var="exception1">
				    	 ${_fraVariable_4b_2_3_ + 
						  _fraVariable_4b_3_3_ +
						  _fraVariable_4b_4_3_ +
						  _fraVariable_4b_5_3_ + 
						  _fraVariable_4b_6_3_ + 
						  _fraVariable_4b_7_3_ +
						  _fraVariable_4b_8_3_ + 
						  _fraVariable_4b_9_3_ + 
						  _fraVariable_4b_10_3_ +
						  _fraVariable_4b_11_3_
						  }
	    			</c:catch>
					<c:if test="${not empty exception1}">
					    N/A
					</c:if>
   				</td>
				<td class="notpresent"></td>
			</tr>
			<tr>
				<td rowspan="3"><a href="${qpath}#4c">4c</a></td>
			</tr>
			<tr>
				<td><spring:message code="ref222"></spring:message></td>
				<td colspan="8" rowspan="2" class="notpresent"><small><spring:message code="refq4prffaostat"></spring:message></small></td>
			</tr>
			<tr>
				<td><spring:message code="refq4twrfcat"></spring:message></td>
			</tr>
			