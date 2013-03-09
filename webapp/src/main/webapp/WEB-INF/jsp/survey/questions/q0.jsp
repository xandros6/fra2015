<%@ include file="../../common/includes/taglibs.jsp"%>
<section>
	<div class="page-header">
		<h1>
			<spring:message code="ref1"></spring:message>
		</h1>
	</div>
	<div>
		<h4>
			<spring:message code="ref2"></spring:message>
		</h4>
		<p>
			<spring:message code="ref3"></spring:message>
		</p>
		<div></div>
		
		<div class="entry">
		<table
			class="editable extensible table table-bordered table-hover table-condensed table-striped">
			<tbody>
				<tr>
					<td rownumber="0" columnnumber="0"><spring:message code="ref4"></spring:message></td>
					<td rownumber="0" columnnumber="1"><spring:message code="ref5"></spring:message></td>
					<td rownumber="0" columnnumber="2"><spring:message code="ref6"></spring:message></td>
					<td rownumber="0" columnnumber="3"><spring:message code="ref7"></spring:message></td>
					<c:if test="${sessionUser.role == 'contributor' and operationWR == 'WRITE'}">
						<td class="action-column" width="80px"></td>
					</c:if>
				</tr>
				<fra:DynamicTableTag numOfColoumn="4" entryItemName="0" userProfile="" operation="${operationWR}" numericColoumn="false"/>
			</tbody>
		</table>
		</div>
		<div class="control pull-right">
			<c:if test="${sessionUser.role == 'contributor' and operationWR == 'WRITE'}">
				<a  href="#" class="btn btn-mini addBtn"><spring:message code="add.row" /></a>
			</c:if>
		</div>
		<br>
		<br>
	</div>
	<div>
		<h4>
			<spring:message code="ref8"></spring:message>
		</h4>
		<p>
			<spring:message code="ref9"></spring:message>
		</p>
		<div></div>
		<div class="entry">
			<fra:richtextentry operation="${operationWR}" name="_fraVariable_1_"></fra:richtextentry>
		</div>
		<div class="control pull-right"></div>
		<br>
		<br>
	</div>
</section>