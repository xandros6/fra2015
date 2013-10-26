<%@ include file="../../common/includes/taglibs.jsp"%>
<c:set var="q" value="8" />
	<c:set var ="qpath" value="${surveypath}/${q}" />
			<tr>
				<td rowspan="5"><a href="${qpath}#8a">8a</a></td>
			</tr>
			<tr>
				<td>8.1 <spring:message code="ref352"></spring:message></td>
				<td>1000 ha</td>
				<td class="numeric" colspan="5">${_fraVariable_8a_3_1_}, ${_fraVariable_8a_3_3_}, ${_fraVariable_8a_3_5_}, ${_fraVariable_8a_3_7_}, ${_fraVariable_8a_3_9_}, ${_fraVariable_8a_7_1_}, ${_fraVariable_8a_7_3_}, ${_fraVariable_8a_7_5_}, ${_fraVariable_8a_7_7_}, ${_fraVariable_8a_7_9_ }</td>
			</tr>
			<tr>
				<td>8.1.1 <spring:message code="ref353"></spring:message></td>
				<td>1000 ha</td>
				<td class="numeric" colspan="5">${_fraVariable_8a_4_1_}, ${_fraVariable_8a_4_3_}, ${_fraVariable_8a_4_5_}, ${_fraVariable_8a_4_7_}, ${_fraVariable_8a_4_9_}, ${_fraVariable_8a_8_1_}, ${_fraVariable_8a_8_3_}, ${_fraVariable_8a_8_5_}, ${_fraVariable_8a_8_7_}, ${_fraVariable_8a_8_9_}</td>
			</tr>
			<tr>
				<td>8.2 <spring:message code="ref352"></spring:message></td>
				<td>Number</td>
				<td class="numeric" colspan="5">${_fraVariable_8a_3_2_}, ${_fraVariable_8a_3_4_}, ${_fraVariable_8a_3_6_}, ${_fraVariable_8a_3_8_}, ${_fraVariable_8a_3_10_}, ${_fraVariable_8a_7_2_}, ${_fraVariable_8a_7_4_}, ${_fraVariable_8a_7_6_}, ${_fraVariable_8a_7_8_}, ${_fraVariable_8a_7_10_}</td>
			</tr>
			<tr>
				<td>8.2.1 <spring:message code="ref353"></spring:message></td>
				<td>Number</td>
				<td class="numeric" colspan="5">${_fraVariable_8a_4_2_}, ${_fraVariable_8a_4_4_}, ${_fraVariable_8a_4_6_}, ${_fraVariable_8a_4_8_}, ${_fraVariable_8a_4_10_}, ${_fraVariable_8a_8_2_}, ${_fraVariable_8a_8_4_}, ${_fraVariable_8a_8_6_}, ${_fraVariable_8a_8_8_}, ${_fraVariable_8a_8_10_}</td>
			</tr>
			<tr><td><a href="${qpath}#8b">8b</a></td><td><spring:message	code="ref362"></spring:message></td>
			<td>1000 ha</td>						
			<td class="numeric" colspan="5">
				<c:catch var="exception4">
					${_fraVariable_8b_1_3_ + _fraVariable_8b_2_3_ + _fraVariable_8b_3_3_  +
					  _fraVariable_8b_4_3_ + _fraVariable_8b_5_3_ + _fraVariable_8b_6_3_  +
					  _fraVariable_8b_7_3_ + _fraVariable_8b_8_3_ + _fraVariable_8b_9_3_ + _fraVariable_8b_10_3_} 
			  	</c:catch>
			    <c:if test="${not empty exception4}">
				</c:if>
			</td>
			<tr>
