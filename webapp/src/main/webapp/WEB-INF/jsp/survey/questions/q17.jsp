<%@ include file="../../common/includes/taglibs.jsp"%>

<c:set var="q" value="_17_" />
<c:set var="hide" value="false" />
<c:if test="${(! fn:contains(notEmptyQuestion,q)) && param.hideEmpty == 'true'}">
  <c:set var="hide" value="true" />
</c:if>

<c:if test="${hide == 'false'}">

<section>
	<div class="page-header">
		<h1>
			17.
			<spring:message code="ref487"></spring:message>
		</h1>
	</div>
	<p class="lead">
		<spring:message code="refq17faq"></spring:message>
	</p>
	
	<fra:reviewers />
	
	<section>
		<h2>
			17.1
			<spring:message code="ref12"></spring:message>
		</h2>
		<div>
			<div></div>
			<div class="entry">
				<table
					class="table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rownumber="0" columnnumber="0" class="small_column"><spring:message
									code="ref13"></spring:message></td>
							<td rownumber="0" columnnumber="1"><spring:message
									code="ref14"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref488"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref489"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref490"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref491"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br/>
			<br/>
		</div>
	</section>
	<c:if test="${fn:contains(notEmptyEntry,'_139_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			17.2
			<spring:message code="ref33"></spring:message>
		</h2>
		<section>
			<h3>
				17.2.1
				<spring:message code="ref34"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<table
						class="editable extensible table table-bordered table-hover table-condensed table-striped">
						<tbody>
							<tr>
								<td rownumber="0" columnnumber="0" class="verysmall_column"></td>
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
							
							<fra:DynamicTableTag numOfColoumn="4" entryItemName="139" numericColoumn="true"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_139_"/>
				<br/>
				<br/>
			</div>
		</section>
	</section>
	</c:if>
  <c:if test="${fn:contains(notEmptyEntry,'_17_') || fn:contains(notEmptyEntry,'_140_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			17.3
			<spring:message code="ref49"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_17_') || param.hideEmpty != 'true'}">
		<div><a id="inpagelink_var_17"></a>
			<h4>
				<spring:message code="ref492"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rowspan="2" rownumber="0" columnnumber="0"><spring:message
									code="ref152"></spring:message></td>
							<td colspan="3" rownumber="0" columnnumber="1"><spring:message
									code="ref493"></spring:message></td>
						</tr>
                        <tr class="defhead">
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref54"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref55"></spring:message></td>
							<td rownumber="1" columnnumber="2"><spring:message
									code="ref56"></spring:message></td>
						</tr>
						<tr rowname="17.1" unit="1000 local currency">
							<td class="title" rownumber="2" columnnumber="0"><spring:message
									code="ref488"></spring:message></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="17"><span class="entry_item_placeholder" id="_fraVariable_17_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_17_2_1_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="17"><span class="entry_item_placeholder" id="_fraVariable_17_2_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_17_2_2_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="2" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="17"><span class="entry_item_placeholder" id="_fraVariable_17_2_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_17_2_3_}</div></td>
						</tr>
						<tr rowname="17.2" unit="1000 local currency">
							<td class="title" rownumber="3" columnnumber="0"><spring:message
									code="ref490"></spring:message></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="17"><span class="entry_item_placeholder" id="_fraVariable_17_3_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_17_3_1_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="17"><span class="entry_item_placeholder" id="_fraVariable_17_3_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_17_3_2_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="3" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="17"><span class="entry_item_placeholder" id="_fraVariable_17_3_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_17_3_3_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_17_"/>
			<br/>
			<br/>
		</div>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_140_') || param.hideEmpty != 'true'}">
		<div>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td></td>
							<td><spring:message code="ref54"></spring:message></td>
							<td><spring:message code="ref55"></spring:message></td>
							<td><spring:message code="ref56"></spring:message></td>
						</tr>
						<tr>
							<td><spring:message code="ref494"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="1"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="140"><span class="entry_item_placeholder" id="_fraVariable_140_1_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_140_1_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="1"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="140"><span class="entry_item_placeholder" id="_fraVariable_140_1_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_140_1_2_}</div></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="140"><span class="entry_item_placeholder" id="_fraVariable_140_1_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_140_1_3_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_140_"/>
			<br/>
			<br/>
		</div>
		</c:if>
	</section>
  </c:if>
  <c:if test="${fn:contains(notEmptyEntry,'_141_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			17.4
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
									code="ref488"></spring:message></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="141"><span class="entry_item_placeholder" id="_fraVariable_141_1_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_141_1_1_}</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref490"></spring:message></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="141"><span class="entry_item_placeholder" id="_fraVariable_141_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_141_2_1_}</div></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref490bb"></spring:message></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="141"><span class="entry_item_placeholder" id="_fraVariable_141_3_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_141_3_1_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_141_"/>
			<br/>
			<br/>
		</div>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_911_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				<spring:message code="ref565"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_911_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_911_"/>
				<br/>
				<br/>
			</div>
		</section>
	</c:if>
</section>

</c:if>