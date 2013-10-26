<%@ include file="../../common/includes/taglibs.jsp"%>

<c:set var="q" value="_14_" />
<c:set var="hide" value="false" />
<c:if test="${(! fn:contains(notEmptyQuestion,q)) && param.hideEmpty == 'true'}">
  <c:set var="hide" value="true" />
</c:if>

<c:if test="${hide == 'false'}">

<section>
	<div class="page-header">
		<h1>
			14.
			<spring:message code="ref435"></spring:message>
		</h1>
	</div>
	<p class="lead">
		<spring:message code="refq14faq"></spring:message>
	</p>
	
	<fra:reviewers />
	
	<section>
		<h2>
			14.1
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
									code="ref436"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref437"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref438"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref439"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref440"></spring:message></td>
							<td rownumber="3" columnnumber="1"><spring:message
									code="ref441"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref442"></spring:message></td>
							<td rownumber="4" columnnumber="1"><spring:message
									code="ref443"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br/>
			<br/>
		</div>
	</section>
	<c:if test="${fn:contains(notEmptyEntry,'_125_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			14.2
			<spring:message code="ref33"></spring:message>
		</h2>
		<section>
			<h3>
				14.2.1
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
							
							<fra:DynamicTableTag numOfColoumn="4" entryItemName="125" numericColoumn="true"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_125_"/>
				<br/>
				<br/>
			</div>
		</section>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_14_') || fn:contains(notEmptyEntry,'_14b_') || fn:contains(notEmptyEntry,'_14c_') 
	|| fn:contains(notEmptyEntry,'_126_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			14.3
			<spring:message code="ref49"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_14_') || param.hideEmpty != 'true'}">
		<div><a id="inpagelink_var_14a"></a>
			<h4>
				<spring:message code="ref444"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rownumber="0" columnnumber="0"><spring:message
									code="ref445"></spring:message></td>
							<td rownumber="0" columnnumber="1"><spring:message
									code="ref403"></spring:message></td>
						</tr>
						<tr rowname="14.1" unit="1000 ha">
							<td class="title" rownumber="1" columnnumber="0"><spring:message
									code="ref436"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="14"><span class="entry_item_placeholder" id="_fraVariable_14_1_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_14_1_1_}</div></td>
						</tr>
						<tr rowname="14.1.1" unit="1000 ha">
							<td class="title" rownumber="2" columnnumber="0"><spring:message
									code="ref446"></spring:message></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="14"><span class="entry_item_placeholder" id="_fraVariable_14_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_14_2_1_}</div></td>
						</tr>
						<tr rowname="14.1.2" unit="1000 ha">
							<td class="title" rownumber="3" columnnumber="0"><spring:message
									code="ref447"></spring:message></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="14"><span class="entry_item_placeholder" id="_fraVariable_14_3_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_14_3_1_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_14_"/>
			<br/>
			<br/>
		</div>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_14b_') || param.hideEmpty != 'true'}">
		<div><a id="inpagelink_var_14b"></a>
			<h4>
				<spring:message code="ref448"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
<tr rowname="14.2" unit="Boolean">
<td class="title" colspan="3" rownumber="0" columnnumber="0"><spring:message code="ref449"></spring:message></td>
</tr>
<tr rowname="14.2.1" unit="Boolean">
<td class="title" colspan="2" rownumber="1" columnnumber="0"><spring:message code="ref450"></spring:message></td>
<fra:yesno mod=" editable " name="_fraVariable_14b_1_1_"  rownumber="1" columnnumber="1" style="background-color: rgb(242, 245, 169); " entryId="14b"></fra:yesno>
</tr>
<tr rowname="14.2.2" unit="Boolean">
<td class="title" colspan="2" rownumber="3" columnnumber="0"><spring:message code="ref451"></spring:message></td>
<fra:yesno mod=" editable " name="_fraVariable_14b_3_1_"  rownumber="3" columnnumber="1" style="background-color: rgb(242, 245, 169); " entryId="14b"></fra:yesno>
</tr>
<tr rowname="14.2.3" unit="Boolean">
<td class="title" colspan="2" rownumber="5" columnnumber="0"><spring:message code="ref452"></spring:message></td>
<fra:yesno mod=" editable " name="_fraVariable_14b_5_1_"  rownumber="5" columnnumber="1" style="background-color: rgb(242, 245, 169); " entryId="14b"></fra:yesno>
</tr>
</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_14b_"/>
			<br/>
			<br/>
		</div>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_14c_') || param.hideEmpty != 'true'}">
		<div><a id="inpagelink_var_14c"></a>
			<h4>
				<spring:message code="ref453"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr rowname="14.3" unit="%">
							<td class="title" style="width: 60%" colspan="2" rownumber="0"
								columnnumber="0"><spring:message code="ref454"></spring:message></td>
							<td class="entry-item editable number" rownumber="0"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="14c"><span class="entry_item_placeholder" id="_fraVariable_14c_0_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_14c_0_1_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_14c_"/>
			<br/>
			<br/>
		</div>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_126_') || param.hideEmpty != 'true'}">
		<div>
			<h4>
				<spring:message code="ref73"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rownumber="0" columnnumber="0"><spring:message
									code="ref13"></spring:message></td>
							<td rownumber="0" columnnumber="1"><spring:message
									code="ref74"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref436"></spring:message></td>
							<td class="tier entry-item" rownumber="1" columnnumber="1"
								entry-id="126"><div id="cell-content">
									<fra:tiers name="_fraVariable_126_1_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref454"></spring:message></td>
							<td class="tier entry-item" rownumber="2" columnnumber="1"
								entry-id="126"><div id="cell-content">
									<fra:tiers name="_fraVariable_126_2_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_126_"/>
			<br/>
			<br/>
		</div>
		<div>
			<h4>
				<spring:message code="ref76"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rownumber="0" columnnumber="0"><spring:message
									code="ref13"></spring:message></td>
							<td rownumber="0" columnnumber="1"><spring:message
									code="ref74"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref436"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref455"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref454"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref456"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br/>
			<br/>
		</div>
	</c:if>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_128_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			14.4
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
							<td class="entry-item editable text" rownumber="1"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="128"><span class="entry_item_placeholder" id="_fraVariable_128_1_0_">&#160;</span>
							<div id="cell-content">${_fraVariable_128_1_0_}</div></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="128"><span class="entry_item_placeholder" id="_fraVariable_128_1_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_128_1_1_}</div></td>
						</tr>
						<tr>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="128"><span class="entry_item_placeholder" id="_fraVariable_128_2_0_">&#160;</span>
							<div id="cell-content">${_fraVariable_128_2_0_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="128"><span class="entry_item_placeholder" id="_fraVariable_128_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_128_2_1_}</div></td>
						</tr>
						<tr>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="128"><span class="entry_item_placeholder" id="_fraVariable_128_3_0_">&#160;</span>
							<div id="cell-content">${_fraVariable_128_3_0_}</div></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="128"><span class="entry_item_placeholder" id="_fraVariable_128_3_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_128_3_1_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_128_"/>
			<br/>
			<br/>
		</div>
	</section>
	</c:if>
</section>

</c:if>