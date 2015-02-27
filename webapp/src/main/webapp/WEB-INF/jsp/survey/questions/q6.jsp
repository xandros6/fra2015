<%@ include file="../../common/includes/taglibs.jsp"%>

<c:set var="q" value="_6_" />
<c:set var="hide" value="false" />
<c:if test="${(! fn:contains(notEmptyQuestion,q)) && param.hideEmpty == 'true'}">
  <c:set var="hide" value="true" />
</c:if>

<c:if test="${hide == 'false'}">

<section>
	<div class="page-header">
		<h1>
			6.
			<spring:message code="ref310"></spring:message>
		</h1>
	</div>
	<p class="lead">
		<spring:message code="refq6faq"></spring:message>
	</p>
	
	<fra:reviewers />
	
	<section>
		<h2>
			6.1
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
									code="ref311"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref312"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref313"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref314"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br/>
			<br/>
		</div>
	</section>
	<c:if test="${fn:contains(notEmptyEntry,'_65_') || fn:contains(notEmptyEntry,'_66_') || fn:contains(notEmptyEntry,'_67_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			6.2
			<spring:message code="ref33"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_65_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				6.2.1
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
							
							<fra:DynamicTableTag numOfColoumn="4" entryItemName="65" numericColoumn="true"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_65_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_66_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				6.2.2
				<spring:message code="ref42"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<table
						class="extensible editable table table-bordered table-hover table-condensed table-striped">
						<tbody>
							<tr>
								<td rownumber="0" columnnumber="0"><spring:message
										code="ref43"></spring:message></td>
								<td rownumber="0" columnnumber="1"><spring:message
										code="ref14"></spring:message></td>
								<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
									<td class="action-column" width="80px"></td>
								</c:if>
							</tr>
							
							<fra:DynamicTableTag numOfColoumn="2" entryItemName="66" numericColoumn="false"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_66_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_67_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				6.2.3
				<spring:message code="ref44"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_67_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_67_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_68_') || fn:contains(notEmptyEntry,'_69_') || fn:contains(notEmptyEntry,'_70_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			6.3
			<spring:message code="ref45"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_68_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				6.3.1
				<spring:message code="ref46"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_68_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_68_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_69_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				6.3.2
				<spring:message code="ref47"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_69_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_69_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_70_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				6.3.3
				<spring:message code="ref48"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_70_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_70_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_6_') || fn:contains(notEmptyEntry,'_71_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			6.4
			<spring:message code="ref49"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_6_') || param.hideEmpty != 'true'}">
		<div><a id="inpagelink_var_6"></a>
			<h4>
				<spring:message code="ref315"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td colspan="2" rowspan="2" rownumber="0" columnnumber="0"><spring:message
									code="ref65"></spring:message></td>
							<td colspan="5" rownumber="0" columnnumber="1"><spring:message
									code="ref109"></spring:message></td>
						</tr>
                        <tr class="defhead">
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref53"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref54"></spring:message></td>
							<td rownumber="1" columnnumber="2"><spring:message
									code="ref55"></spring:message></td>
							<td rownumber="1" columnnumber="3"><spring:message
									code="ref56"></spring:message></td>
							<td rownumber="1" columnnumber="4"><spring:message
									code="ref57"></spring:message></td>
						</tr>
						<tr rowname="6.1" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="2" columnnumber="0"><spring:message
									code="ref311"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="6"><span class="entry_item_placeholder" id="_fraVariable_6_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_6_2_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="6"><span class="entry_item_placeholder" id="_fraVariable_6_2_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_6_2_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="6"><span class="entry_item_placeholder" id="_fraVariable_6_2_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_6_2_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="6"><span class="entry_item_placeholder" id="_fraVariable_6_2_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_6_2_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="2" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="6"><span class="entry_item_placeholder" id="_fraVariable_6_2_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_6_2_5_}</div></td>
						</tr>
						<tr rowname="6.2" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="3" columnnumber="0"><spring:message
									code="ref313"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="6"><span class="entry_item_placeholder" id="_fraVariable_6_3_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_6_3_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="6"><span class="entry_item_placeholder" id="_fraVariable_6_3_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_6_3_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="6"><span class="entry_item_placeholder" id="_fraVariable_6_3_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_6_3_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="6"><span class="entry_item_placeholder" id="_fraVariable_6_3_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_6_3_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="3" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="6"><span class="entry_item_placeholder" id="_fraVariable_6_3_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_6_3_5_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_6_"/>
			<br/>
			<br/>
		</div>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_71_') || param.hideEmpty != 'true'}">
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
							<td rownumber="0" columnnumber="2"><spring:message
									code="ref75"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref311"></spring:message></td>
							<td class="tier entry-item" rownumber="1" columnnumber="1"
								entry-id="71"><div id="cell-content">
									<fra:tiers name="_fraVariable_71_1_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="1" columnnumber="2"
								entry-id="71"><div id="cell-content">
									<fra:tiers name="_fraVariable_71_1_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref313"></spring:message></td>
							<td class="tier entry-item" rownumber="2" columnnumber="1"
								entry-id="71"><div id="cell-content">
									<fra:tiers name="_fraVariable_71_2_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="2" columnnumber="2"
								entry-id="71"><div id="cell-content">
									<fra:tiers name="_fraVariable_71_2_2_"><option
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
			<fra:feedback feedbackName="_feedback_71_"/>
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
							<td rownumber="0" columnnumber="2"><spring:message
									code="ref75"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref316"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref317"></spring:message></td>
							<td rownumber="1" columnnumber="2"><spring:message
									code="ref79"></spring:message></td>
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
	<c:if test="${fn:contains(notEmptyEntry,'_73_') || fn:contains(notEmptyEntry,'_74_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			6.5
			<spring:message code="ref126"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_73_') || param.hideEmpty != 'true'}">
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
							<td rownumber="0" columnnumber="2"><spring:message
									code="ref212"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref311"></spring:message></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="73"><span class="entry_item_placeholder" id="_fraVariable_73_1_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_73_1_1_}</div></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="73"><span class="entry_item_placeholder" id="_fraVariable_73_1_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_73_1_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref313"></spring:message></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="73"><span class="entry_item_placeholder" id="_fraVariable_73_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_73_2_1_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="73"><span class="entry_item_placeholder" id="_fraVariable_73_2_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_73_2_2_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_73_"/>
			<br/>
			<br/>
		</div>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_74_') || param.hideEmpty != 'true'}">
		<div>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rownumber="0" columnnumber="0"><spring:message
									code="ref84"></spring:message></td>
						</tr>
						<tr>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="74"><span class="entry_item_placeholder" id="_fraVariable_74_1_0_">&#160;</span>
							<div id="cell-content">${_fraVariable_74_1_0_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_74_"/>
			<br/>
			<br/>
		</div>
		</c:if>
	</section>
	</c:if>
</section>

</c:if>