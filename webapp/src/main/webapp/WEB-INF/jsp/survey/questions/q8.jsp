<%@ include file="../../common/includes/taglibs.jsp"%>

<c:set var="q" value="_8_" />
<c:set var="hide" value="false" />
<c:if test="${(! fn:contains(notEmptyQuestion,q)) && param.hideEmpty == 'true'}">
  <c:set var="hide" value="true" />
</c:if>

<c:if test="${hide == 'false'}">

<section>
	<div class="page-header">
		<h1>
			8.
			<spring:message code="ref334"></spring:message>
		</h1>
	</div>
	<p class="lead">
		<spring:message code="refq8faq"></spring:message>
	</p>
	
	<fra:reviewers />
	
	<section>
		<h2>
			8.1
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
									code="ref335"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref336"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref337"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref338"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref339"></spring:message></td>
							<td rownumber="3" columnnumber="1"><spring:message
									code="ref340"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref341"></spring:message></td>
							<td rownumber="4" columnnumber="1"><spring:message
									code="ref342"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="5" columnnumber="0"><spring:message
									code="ref343"></spring:message></td>
							<td rownumber="5" columnnumber="1"><spring:message
									code="ref344"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br/> <br/>
		</div>
	</section>
	<c:if test="${fn:contains(notEmptyEntry,'_88_') || fn:contains(notEmptyEntry,'_89_') || fn:contains(notEmptyEntry,'_90_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			8.2
			<spring:message code="ref33"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_88_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				8.2.1
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
							
							<fra:DynamicTableTag numOfColoumn="4" entryItemName="88" numericColoumn="true"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_88_"/>
				<br/> <br/>
			</div>
		</section>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_89_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				8.2.2
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
							
							<fra:DynamicTableTag numOfColoumn="2" entryItemName="89" numericColoumn="2"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_89_"/>
				<br/> <br/>
			</div>
		</section>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_90_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				8.2.3
				<spring:message code="ref44"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_90_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_90_"/>
				<br/> <br/>
			</div>
		</section>
		</c:if>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_91_') || fn:contains(notEmptyEntry,'_92_') || fn:contains(notEmptyEntry,'_93_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			8.3
			<spring:message code="ref45"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_91_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				8.3.1
				<spring:message code="ref46"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_91_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_91_"/>
				<br/> <br/>
			</div>
		</section>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_92_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				8.3.2
				<spring:message code="ref47"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_92_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_92_"/>
				<br/> <br/>
			</div>
		</section>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_93_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				8.3.3
				<spring:message code="ref48"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_93_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_93_"/>
				<br/> <br/>
			</div>
		</section>
		</c:if>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_8a_') || fn:contains(notEmptyEntry,'_8b_') || fn:contains(notEmptyEntry,'_95_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			8.4
			<spring:message code="ref49"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_8a_') || param.hideEmpty != 'true'}">
		<div><a id="inpagelink_var_8a"></a>
			<h4>
				<spring:message code="ref345"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td colspan="2" rowspan="3" rownumber="0" columnnumber="0"><spring:message
									code="ref152"></spring:message></td>
							<td colspan="10" rownumber="0" columnnumber="1"><spring:message
									code="ref346"></spring:message></td>
						</tr>
                        <tr class="defhead">
							<td colspan="2" rownumber="1" columnnumber="0"><spring:message
									code="ref347"></spring:message></td>
							<td colspan="2" rownumber="1" columnnumber="1"><spring:message
									code="ref348"></spring:message></td>
							<td colspan="2" rownumber="1" columnnumber="2"><spring:message
									code="ref55"></spring:message></td>
							<td colspan="2" rownumber="1" columnnumber="3"><spring:message
									code="ref349"></spring:message></td>
							<td colspan="2" rownumber="1" columnnumber="4"><spring:message
									code="ref350"></spring:message></td>
						</tr>
                        <tr class="defhead">
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref351"></spring:message></td>
							<td rownumber="2" columnnumber="1">#</td>
							<td rownumber="2" columnnumber="2"><spring:message
									code="ref351"></spring:message></td>
							<td rownumber="2" columnnumber="3">#</td>
							<td rownumber="2" columnnumber="4"><spring:message
									code="ref351"></spring:message></td>
							<td rownumber="2" columnnumber="5">#</td>
							<td rownumber="2" columnnumber="6"><spring:message
									code="ref351"></spring:message></td>
							<td rownumber="2" columnnumber="7">#</td>
							<td rownumber="2" columnnumber="8"><spring:message
									code="ref351"></spring:message></td>
							<td rownumber="2" columnnumber="9">#</td>
						</tr>
						<tr rowname="8.1" unit="1000 ha"
							class="summary-aggregated-2003-2012">
							<td><img class="cfrq-logo"
								src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="3" columnnumber="0"><spring:message
									code="ref352"></spring:message></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_3_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_3_1_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="3"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_3_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_3_2_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="3"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_3_3_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_3_3_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="3"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_3_4_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_3_4_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="3"
								columnnumber="5" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_3_5_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_3_5_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="3"
								columnnumber="6" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_3_6_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_3_6_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="3"
								columnnumber="7" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_3_7_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_3_7_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="3"
								columnnumber="8" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_3_8_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_3_8_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="3"
								columnnumber="9" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_3_9_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_3_9_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="3"
								columnnumber="10" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_3_10_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_3_10_}</div></td>
						</tr>
						<tr rowname="8.1.1" unit="1000 ha"
							class="summary-aggregated-2003-2012">
							<td><img class="cfrq-logo"
								src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="4" columnnumber="0"><spring:message
									code="ref353"></spring:message></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_4_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_4_1_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="4"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_4_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_4_2_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="4"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_4_3_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_4_3_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="4"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_4_4_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_4_4_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="4"
								columnnumber="5" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_4_5_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_4_5_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="4"
								columnnumber="6" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_4_6_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_4_6_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="4"
								columnnumber="7" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_4_7_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_4_7_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="4"
								columnnumber="8" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_4_8_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_4_8_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="4"
								columnnumber="9" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_4_9_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_4_9_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="4"
								columnnumber="10" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_4_10_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_4_10_}</div></td>
						</tr>
						<tr class="defhead">
							<td colspan="2" rowspan="2" rownumber="5" columnnumber="0"><spring:message
									code="ref152"></spring:message></td>
							<td colspan="2" rownumber="5" columnnumber="1"><spring:message
									code="ref354"></spring:message></td>
							<td colspan="2" rownumber="5" columnnumber="2"><spring:message
									code="ref355"></spring:message></td>
							<td colspan="2" rownumber="5" columnnumber="3"><spring:message
									code="ref56"></spring:message></td>
							<td colspan="2" rownumber="5" columnnumber="4"><spring:message
									code="ref356"></spring:message></td>
							<td colspan="2" rownumber="5" columnnumber="5"><spring:message
									code="ref357"></spring:message></td>
						</tr>
						<tr class="defhead">
							<td rownumber="6" columnnumber="0"><spring:message
									code="ref351"></spring:message></td>
							<td rownumber="6" columnnumber="1">#</td>
							<td rownumber="6" columnnumber="2"><spring:message
									code="ref351"></spring:message></td>
							<td rownumber="6" columnnumber="3">#</td>
							<td rownumber="6" columnnumber="4"><spring:message
									code="ref351"></spring:message></td>
							<td rownumber="6" columnnumber="5">#</td>
							<td rownumber="6" columnnumber="6"><spring:message
									code="ref351"></spring:message></td>
							<td rownumber="6" columnnumber="7">#</td>
							<td rownumber="6" columnnumber="8"><spring:message
									code="ref351"></spring:message></td>
							<td rownumber="6" columnnumber="9">#</td>
						</tr>
						<tr rowname="8.2" unit="Number"
							class="summary-aggregated-2003-2012">
							<td><img class="cfrq-logo"
								src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="7" columnnumber="0"><spring:message
									code="ref352"></spring:message></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="7"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_7_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_7_1_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="7"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_7_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_7_2_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="7"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_7_3_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_7_3_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="7"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_7_4_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_7_4_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="7"
								columnnumber="5" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_7_5_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_7_5_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="7"
								columnnumber="6" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_7_6_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_7_6_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="7"
								columnnumber="7" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_7_7_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_7_7_}</div></td>
							<td columnname="2003-2102"
								class="prefilled entry-item editable text" rownumber="7"
								columnnumber="8" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_7_8_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_7_8_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="7"
								columnnumber="9" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_7_9_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_7_9_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="7"
								columnnumber="10" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_7_10_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_7_10_}</div></td>
						</tr>
						<tr rowname="8.2.1" unit="Number"
							class="summary-aggregated-2003-2012">
							<td><img class="cfrq-logo"
								src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="8" columnnumber="0"><spring:message
									code="ref353"></spring:message></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="8"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_8_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_8_1_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="8"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_8_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_8_2_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="8"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_8_3_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_8_3_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="8"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_8_4_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_8_4_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="8"
								columnnumber="5" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_8_5_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_8_5_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="8"
								columnnumber="6" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_8_6_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_8_6_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="8"
								columnnumber="7" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_8_7_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_8_7_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="8"
								columnnumber="8" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_8_8_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_8_8_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="8"
								columnnumber="9" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_8_9_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_8_9_}</div></td>
							<td columnname="2003-2012"
								class="prefilled entry-item editable text" rownumber="8"
								columnnumber="10" style="background-color: rgb(242, 245, 169);"
								entry-id="8a"><span class="entry_item_placeholder"
								id="_fraVariable_8a_8_10_">&#160;</span>
								<div id="cell-content">${_fraVariable_8a_8_10_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_8a_"/>
			<br/> <br/>
		</div>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_8b_') || param.hideEmpty != 'true'}">
		<div><a name=8b></a>
			<h4>
				<spring:message code="ref358"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rownumber="0" columnnumber="0"><spring:message
									code="ref359"></spring:message></td>
							<td rownumber="0" columnnumber="1"><spring:message
									code="ref360"></spring:message></td>
							<td rownumber="0" columnnumber="2"><spring:message
									code="ref361"></spring:message></td>
							<td rownumber="0" columnnumber="3"><spring:message
									code="ref362"></spring:message></td>
						</tr>
						<tr>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_1_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_1_0_}</div></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_1_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_1_1_}</div></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_1_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_1_2_}</div></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_1_3_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_1_3_}</div></td>
						</tr>
						<tr>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_2_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_2_0_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_2_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_2_1_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_2_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_2_2_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_2_3_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_2_3_}</div></td>
						</tr>
						<tr>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_3_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_3_0_}</div></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_3_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_3_1_}</div></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_3_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_3_2_}</div></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_3_3_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_3_3_}</div></td>
						</tr>
						<tr>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_4_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_4_0_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_4_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_4_1_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_4_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_4_2_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_4_3_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_4_3_}</div></td>
						</tr>
						<tr>
							<td class="entry-item editable text" rownumber="5"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_5_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_5_0_}</div></td>
							<td class="entry-item editable text" rownumber="5"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_5_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_5_1_}</div></td>
							<td class="entry-item editable text" rownumber="5"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_5_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_5_2_}</div></td>
							<td class="entry-item editable text" rownumber="5"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_5_3_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_5_3_}</div></td>
						</tr>
						<tr>
							<td class="entry-item editable text" rownumber="6"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_6_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_6_0_}</div></td>
							<td class="entry-item editable text" rownumber="6"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_6_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_6_1_}</div></td>
							<td class="entry-item editable text" rownumber="6"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_6_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_6_2_}</div></td>
							<td class="entry-item editable text" rownumber="6"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_6_3_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_6_3_}</div></td>
						</tr>
						<tr>
							<td class="entry-item editable text" rownumber="7"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_7_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_7_0_}</div></td>
							<td class="entry-item editable text" rownumber="7"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_7_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_7_1_}</div></td>
							<td class="entry-item editable text" rownumber="7"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_7_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_7_2_}</div></td>
							<td class="entry-item editable text" rownumber="7"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_7_3_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_7_3_}</div></td>
						</tr>
						<tr>
							<td class="entry-item editable text" rownumber="8"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_8_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_8_0_}</div></td>
							<td class="entry-item editable text" rownumber="8"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_8_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_8_1_}</div></td>
							<td class="entry-item editable text" rownumber="8"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_8_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_8_2_}</div></td>
							<td class="entry-item editable text" rownumber="8"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_8_3_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_8_3_}</div></td>
						</tr>
						<tr>
							<td class="entry-item editable text" rownumber="9"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_9_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_9_0_}</div></td>
							<td class="entry-item editable text" rownumber="9"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_9_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_9_1_}</div></td>
							<td class="entry-item editable text" rownumber="9"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_9_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_9_2_}</div></td>
							<td class="entry-item editable text" rownumber="9"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_9_3_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_9_3_}</div></td>
						</tr>
						<tr>
							<td class="entry-item editable text" rownumber="10"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_10_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_10_0_}</div></td>
							<td class="entry-item editable text" rownumber="10"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_10_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_10_1_}</div></td>
							<td class="entry-item editable text" rownumber="10"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_10_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_10_2_}</div></td>
							<td class="entry-item editable text" rownumber="10"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="8b"><span class="entry_item_placeholder"
								id="_fraVariable_8b_10_3_">&#160;</span>
								<div id="cell-content">${_fraVariable_8b_10_3_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_8b_"/>
			<br/> <br/>
		</div>
		<div>
			<div></div>
			<div class="entry">
				<table
					class="table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rownumber="0" columnnumber="0"><spring:message
									code="ref359"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref363"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref364"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref365"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br/> <br/>
		</div>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_95_') || param.hideEmpty != 'true'}">
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
									code="ref199"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref337_tiers"></spring:message></td>
							<td class="tier entry-item" rownumber="1" columnnumber="1"
								entry-id="95"><div id="cell-content">
									<fra:tiers name="_fraVariable_95_1_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
                                </div>
                                </td>
							<td class="tier entry-item" rownumber="1" columnnumber="2"
								entry-id="95"><div id="cell-content">
									<fra:tiers name="_fraVariable_95_1_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div>
              </td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref366_tiers"></spring:message></td>
							<td class="tier entry-item" rownumber="2" columnnumber="1"
								entry-id="95"><div id="cell-content">
									<fra:tiers name="_fraVariable_95_2_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
                                </div></td>
							<td class="tier entry-item" rownumber="2" columnnumber="2"
								entry-id="95"><div id="cell-content">
									<fra:tiers name="_fraVariable_95_2_2_"><option
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
			<fra:feedback feedbackName="_feedback_95_"/>
			<br/> <br/>
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
									code="ref337"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref367"></spring:message></td>
							<td rownumber="1" columnnumber="2"><spring:message
									code="ref79"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref366"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref368"></spring:message></td>
							<td rownumber="2" columnnumber="2"><spring:message
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
	<c:if test="${fn:contains(notEmptyEntry,'_97_') || fn:contains(notEmptyEntry,'_98_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			8.5
			<spring:message code="ref126"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_97_') || param.hideEmpty != 'true'}">
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
									code="ref337"></spring:message></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="97"><span class="entry_item_placeholder"
								id="_fraVariable_97_1_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_97_1_1_}</div></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="97"><span class="entry_item_placeholder"
								id="_fraVariable_97_1_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_97_1_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref369"></spring:message></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="97"><span class="entry_item_placeholder"
								id="_fraVariable_97_2_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_97_2_1_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="97"><span class="entry_item_placeholder"
								id="_fraVariable_97_2_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_97_2_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref370"></spring:message></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="97"><span class="entry_item_placeholder"
								id="_fraVariable_97_3_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_97_3_1_}</div></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="97"><span class="entry_item_placeholder"
								id="_fraVariable_97_3_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_97_3_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref343"></spring:message></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="97"><span class="entry_item_placeholder"
								id="_fraVariable_97_4_1_">&#160;</span>
								<div id="cell-content">${_fraVariable_97_4_1_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="97"><span class="entry_item_placeholder"
								id="_fraVariable_97_4_2_">&#160;</span>
								<div id="cell-content">${_fraVariable_97_4_2_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_97_"/>
			<br/> <br/>
		</div>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_98_') || param.hideEmpty != 'true'}">
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
								entry-id="98"><span class="entry_item_placeholder"
								id="_fraVariable_98_1_0_">&#160;</span>
								<div id="cell-content">${_fraVariable_98_1_0_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_98_"/>
			<br/> <br/>
		</div>
		</c:if>
	</section>
	</c:if>
</section>

</c:if>