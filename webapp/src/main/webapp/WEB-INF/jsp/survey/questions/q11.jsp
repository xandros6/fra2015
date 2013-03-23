<%@ include file="../../common/includes/taglibs.jsp"%>
<section>
	<div class="page-header">
		<h1>
			11.
			<spring:message code="ref392"></spring:message>
		</h1>
	</div>
	<section>
		<h2>
			11.1
			<spring:message code="ref12"></spring:message>
		</h2>
		<div>
			<div></div>
			<div class="entry">
				<table
					class="table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rownumber="0" columnnumber="0"><spring:message
									code="ref13"></spring:message></td>
							<td rownumber="0" columnnumber="1"><spring:message
									code="ref14"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref393"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref394"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<br> <br>
		</div>
	</section>
	<section>
		<h2>
			11.2
			<spring:message code="ref33"></spring:message>
		</h2>
		<section>
			<h3>
				11.2.1
				<spring:message code="ref34"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<table
						class="editable extensible table table-bordered table-hover table-condensed table-striped">
						<tbody>
							<tr>
								<td rownumber="0" columnnumber="0"></td>
								<td rownumber="0" columnnumber="1"><spring:message
										code="ref35"></spring:message></td>
								<td rownumber="0" columnnumber="2"><spring:message
										code="ref37"></spring:message></td>
								<td rownumber="0" columnnumber="3"><spring:message
										code="ref38"></spring:message></td>
								<c:if test="${profile == 'CONTRIBUTOR'}">
									<td class="action-column" width="80px"></td>
								</c:if>
							</tr>

							<fra:DynamicTableTag numOfColoumn="3" entryItemName="107" numericColoumn="true"/>

						</tbody>
					</table>
				</div>
				<div class="control pull-right">
					<c:if test="${profile == 'CONTRIBUTOR'}">
						<a  href="#" class="btn btn-mini addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_107_"/>
				<br> <br>
			</div>
			<div>
				<h4>
					<spring:message code="ref395"></spring:message>
				</h4>
				<div></div>
				<div class="entry">
					<table
						class="editable table table-bordered table-hover table-condensed table-striped">
						<tbody>
							<tr rowname="11.1" unit="Boolean">
								<td class="title" style="width: 60%" colspan="2" rownumber="0"
									columnnumber="0"><spring:message code="ref396"></spring:message></td>
								<fra:yesno name="_fraVariable_11_0_1_"  rownumber="0"
									columnnumber="1" style="background-color: rgb(242, 245, 169);"
									entryId="11"></fra:yesno>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="control pull-right"></div>
				<fra:feedback feedbackName="_feedback_11_"/>
				<br> <br>
			</div>
		</section>
	</section>
	<section>
		<h2>
			11.3
			<spring:message code="ref126"></spring:message>
		</h2>
		<div>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rownumber="0" columnnumber="0"><spring:message
									code="ref13"></spring:message></td>
							<td rownumber="0" columnnumber="1"><spring:message
									code="ref81"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref393"></spring:message></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="108"><span class="entry_item_placeholder"
								id="_fraVariable_108_1_1_">&nbsp;</span>
								<div id="cell-content">${_fraVariable_108_1_1_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_108_"/>
			<br> <br>
		</div>
	</section>
</section>