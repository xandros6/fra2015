<%@ include file="../../common/includes/taglibs.jsp"%>

<c:set var="q" value="_7_" />
<c:set var="hide" value="false" />
<c:if test="${(! fn:contains(notEmptyQuestion,q)) && param.hideEmpty == 'true'}">
  <c:set var="hide" value="true" />
</c:if>

<c:if test="${hide == 'false'}">

<section>
	<div class="page-header">
		<h1>
			7.
			<spring:message code="ref319"></spring:message>
		</h1>
	</div>
	<p class="lead">
		<spring:message code="refq7faq"></spring:message>
	</p>
	
	<fra:reviewers />
	
	<section>
		<h2>
			7.1
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
									code="ref320"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref321"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br/> <br/>
		</div>
	</section>
	<c:if test="${fn:contains(notEmptyEntry,'_76_') || fn:contains(notEmptyEntry,'_77_') || fn:contains(notEmptyEntry,'_78_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			7.2
			<spring:message code="ref33"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_76_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				7.2.1
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
							
							<fra:DynamicTableTag numOfColoumn="4" entryItemName="76" numericColoumn="true"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_76_"/>
				<br/> <br/>
			</div>
		</section>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_77_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				7.2.2
				<spring:message code="ref42"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<table
						class="editable extensible table table-bordered table-hover table-condensed table-striped">
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
							
							<fra:DynamicTableTag numOfColoumn="2" entryItemName="77" numericColoumn="false"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_77_"/>
				<br/> <br/>
			</div>
		</section>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_78_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				7.2.3
				<spring:message code="ref44"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_78_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_78_"/>
				<br/> <br/>
			</div>
		</section>
		</c:if>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_79_') || fn:contains(notEmptyEntry,'_80_') || fn:contains(notEmptyEntry,'_81_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			7.3
			<spring:message code="ref45"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_79_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				7.3.1
				<spring:message code="ref46"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_79_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_79_"/>
				<br/> <br/>
			</div>
		</section>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_80_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				7.3.2
				<spring:message code="ref47"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_80_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_80_"/>
				<br/> <br/>
			</div>
		</section>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_81_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				7.3.3
				<spring:message code="ref48"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_81_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_81_"/>
				<br/> <br/>
			</div>
		</section>
		</c:if>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_7_') || fn:contains(notEmptyEntry,'_83_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			7.4
			<spring:message code="ref49"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_7_') || param.hideEmpty != 'true'}">
		<div>
			<h4>
				<spring:message code="ref322"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rowspan="2" rownumber="0" columnnumber="0"><spring:message
									code="ref323"></spring:message></td>
							<td colspan="2" rownumber="0" columnnumber="1"><spring:message
									code="ref324"></spring:message></td>
						</tr>
                        <tr class="defhead">
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref55"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref56"></spring:message></td>
						</tr>
						<tr rowname="7.1" unit="1000 ha">
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_2_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_2_0_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_2_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_2_1_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_2_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_2_2_}</div></td>
						</tr>
						<tr>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_3_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_3_0_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_3_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_3_1_}</div></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_3_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_3_2_}</div></td>
						</tr>
						<tr>
							<td class="prefilled entry-item editable text" rownumber="4"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_4_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_4_0_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_4_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_4_1_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_4_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_4_2_}</div></td>
						</tr>
						<tr>
							<td class="prefilled entry-item editable text" rownumber="5"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_5_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_5_0_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="5"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_5_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_5_1_}</div></td>
							<td class="entry-item editable text" rownumber="5"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_5_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_5_2_}</div></td>
						</tr>
						<tr>
							<td class="prefilled entry-item editable text" rownumber="6"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_6_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_6_0_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="6"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_6_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_6_1_}</div></td>
							<td class="entry-item editable text" rownumber="6"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_6_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_6_2_}</div></td>
						</tr>
						<tr>
							<td class="prefilled entry-item editable text" rownumber="7"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_7_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_7_0_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="7"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_7_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_7_1_}</div></td>
							<td class="entry-item editable text" rownumber="7"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_7_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_7_2_}</div></td>
						</tr>
						<tr>
							<td class="prefilled entry-item editable text" rownumber="8"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_8_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_8_0_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="8"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_8_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_8_1_}</div></td>
							<td class="entry-item editable text" rownumber="8"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_8_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_8_2_}</div></td>
						</tr>
						<tr>
							<td class="prefilled entry-item editable text" rownumber="9"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_9_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_9_0_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="9"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_9_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_9_1_}</div></td>
							<td class="entry-item editable text" rownumber="9"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_9_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_9_2_}</div></td>
						</tr>
						<tr>
							<td class="prefilled entry-item editable text" rownumber="10"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_10_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_10_0_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="10"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_10_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_10_1_}</div></td>
							<td class="entry-item editable text" rownumber="10"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_10_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_10_2_}</div></td>
						</tr>
						<tr>
							<td class="prefilled entry-item editable text" rownumber="11"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_11_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_11_0_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="11"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_11_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_11_1_}</div></td>
							<td class="entry-item editable text" rownumber="11"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="7"><span class="entry_item_placeholder"
								id="_fraVariable_7_11_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_7_11_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="12" columnnumber="0"><spring:message
									code="ref332"></spring:message></td>
							<td class="total" rownumber="12" columnnumber="1"></td>
							<td class="total" rownumber="12" columnnumber="2"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_7_"/>
			<br/> <br/>
		</div>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_83_') || param.hideEmpty != 'true'}">
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
									code="ref320"></spring:message></td>
							<td class="tier entry-item" rownumber="1" columnnumber="1"
								entry-id="83"><div id="cell-content">
									<fra:tiers name="_fraVariable_83_1_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="1" columnnumber="1"
								entry-id="83"><div id="cell-content">
									<fra:tiers name="_fraVariable_83_1_2_"><option
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
			<fra:feedback feedbackName="_feedback_83_"/>
			<br/> <br/>
		</div>
		<div>
			<h4>
				<spring:message code="ref123"></spring:message>
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
									code="ref320"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref333"></spring:message></td>
							<td rownumber="1" columnnumber="2"><spring:message
									code="ref79"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br/> <br/>
		</div>
		</c:if>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_85_') || fn:contains(notEmptyEntry,'_86_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			7.5
			<spring:message code="ref126"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_85_') || param.hideEmpty != 'true'}">
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
									code="ref320"></spring:message></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="85"><span class="entry_item_placeholder"
								id="_fraVariable_85_1_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_85_1_1_}</div></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="85"><span class="entry_item_placeholder"
								id="_fraVariable_85_1_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_85_1_2_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_85_"/>
			<br/> <br/>
		</div>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_86_') || param.hideEmpty != 'true'}">
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
								entry-id="86"><span class="entry_item_placeholder"
								id="_fraVariable_86_1_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_86_1_0_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_86_"/>
			<br/>
			<br/>
		</div>
		</c:if>
	</section>
	</c:if>
</section>

</c:if>