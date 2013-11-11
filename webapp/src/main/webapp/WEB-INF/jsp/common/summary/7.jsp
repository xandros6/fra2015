<%@ include file="../../common/includes/taglibs.jsp"%>
<c:set var="q" value="7" />
	<c:set var ="qpath" value="${surveypath}/${q}" />
			<!--
			<tr>
				<td rowspan="2"><a href="${qpath}#7">7</a></td>
			</tr>
			<tr>
				<td>7.2</td>
				<td>1000 ha</td>
				<td class="notpresent" ></td>
				<td class="notpresent" ></td>
				<td class="numeric">
					<c:catch var="exception2">
						${_fraVariable_7_12_1_} 
				    </c:catch>
				    <c:if test="${not empty exception2}">
					    N/A
					</c:if>
			    </td>
				<td class="numeric">
					<c:catch var="exception3">
						${_fraVariable_7_12_2_} 
				  	</c:catch>
				    <c:if test="${not empty exception3}">
					    N/A
					</c:if></td>
				<td class="notpresent" ></td>
			</tr>
			-->

			<tr>
				<td rowspan="2"><a href="${qpath}#inpagelink_var_7">7</a></td>
			</tr>
			
			<tr class="summaryRow">
			    <td><spring:message code="ref323"></spring:message></td>
				<td>1000 ha</td>						
				<td class="notpresent"></td>
				<td class="notpresent"></td>
				<td class="numeric">${_fraVariable_7_12_1_}</td>
				<td class="numeric">${_fraVariable_7_12_2_}</td>
				<td class="notpresent"></td>
			<tr>