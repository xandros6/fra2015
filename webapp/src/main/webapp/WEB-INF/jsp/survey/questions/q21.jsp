<%@ include file="../../common/includes/taglibs.jsp"%>

<c:set var="q" value="_21_" />
<c:set var="hide" value="false" />
<c:if test="${(! fn:contains(notEmptyQuestion,q)) && param.hideEmpty == 'true'}">
  <c:set var="hide" value="true" />
</c:if>

<c:if test="${hide == 'false'}">

<section>
	<div class="page-header">
		<h1>
			21.
			<spring:message code="ref554"></spring:message>
		</h1>
	</div>
	<p class="lead">
		<spring:message code="refq21faq"></spring:message>
	</p>
	
	<fra:reviewers />
	
	<section>
		<h2>
			21.1
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
									code="ref555"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref556"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref557"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref558"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br/>
			<br/>
		</div>
	</section>
	<c:if test="${fn:contains(notEmptyEntry,'_163_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			21.2
			<spring:message code="ref33"></spring:message>
		</h2>
		<section>
			<h3>
				21.2.1
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
										code="ref36"></spring:message></td>
								<td rownumber="0" columnnumber="3"><spring:message
										code="ref37"></spring:message></td>
								<td rownumber="0" columnnumber="4"><spring:message
										code="ref38"></spring:message></td>
								<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
									<td class="action-column" width="80px"></td>
								</c:if>
							</tr>

							<fra:DynamicTableTag numOfColoumn="4" entryItemName="163" numericColoumn="true"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_163_"/>
				<br/>
				<br/>
			</div>
		</section>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_21a_') || fn:contains(notEmptyEntry,'_21b_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			21.3
			<spring:message code="ref49"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_21a_') || param.hideEmpty != 'true'}">
		<div><a id="inpagelink_var_21a"></a>
			<h4>
				<spring:message code="ref559"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rowspan="2" rownumber="0" columnnumber="0"><spring:message
									code="ref192"></spring:message></td>
							<td colspan="2" rownumber="0" columnnumber="1"><spring:message
									code="ref560"></spring:message></td>
						</tr>
                        <tr class="defhead">
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref561"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref562"></spring:message></td>
						</tr>
						<tr rowname="21.1" unit="1000 ha"
							class="summary-aggregated-2020-2030">
							<td class="title" rownumber="2" columnnumber="0"><spring:message
									code="ref555"></spring:message></td>
							<td columnname="2020-2030" class="entry-item editable text"
								rownumber="2" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="21a"><span class="entry_item_placeholder" id="_fraVariable_21a_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_21a_2_1_}</div></td>
							<td columnname="2020-2030" class="entry-item editable text"
								rownumber="2" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="21a"><span class="entry_item_placeholder" id="_fraVariable_21a_2_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_21a_2_2_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_21a_"/>
			<br/>
			<br/>
		</div>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_21b_') || param.hideEmpty != 'true'}">
		<div><a id="inpagelink_var_21b"></a>
			<h4>
				<spring:message code="ref563"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rowspan="2" rownumber="0" columnnumber="0"><spring:message
									code="ref192"></spring:message></td>
							<td rownumber="0" columnnumber="1"><spring:message
									code="ref560"></spring:message></td>
						</tr>
                        <tr class="defhead">
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref564"></spring:message></td>
						</tr>
						<tr rowname="21.2" unit="1000 ha" class="summary-aggregated-2013">
							<td class="title" rownumber="2" columnnumber="0"><spring:message
									code="ref557"></spring:message></td>
							<td columnname="2013" class="entry-item editable text"
								rownumber="2" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="21b"><span class="entry_item_placeholder" id="_fraVariable_21b_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_21b_2_1_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_21b_"/>
			<br/>
			<br/>
		</div>
		</c:if>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_164_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			21.4
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
									code="ref126"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref555"></spring:message></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="164"><span class="entry_item_placeholder" id="_fraVariable_164_1_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_164_1_1_}</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref557"></spring:message></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="164"><span class="entry_item_placeholder" id="_fraVariable_164_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_164_2_1_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_164_"/>
			<br/>
			<br/>
		</div>
	</section>
	</c:if>
</section>

</c:if>