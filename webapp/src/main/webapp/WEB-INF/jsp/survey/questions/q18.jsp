<%@ include file="../../common/includes/taglibs.jsp"%>

<c:set var="q" value="_18_" />
<c:set var="hide" value="false" />
<c:if test="${(! fn:contains(notEmptyQuestion,q)) && param.hideEmpty == 'true'}">
  <c:set var="hide" value="true" />
</c:if>

<c:if test="${hide == 'false'}">

<section>
	<div class="page-header">
		<h1>
			18.
			<spring:message code="ref495"></spring:message>
		</h1>
	</div>
	<p class="lead">
		<spring:message code="refq18faq"></spring:message>
	</p>
	
	<fra:reviewers />
	
	<section>
		<h2>
			18.1
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
									code="ref496"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref497"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref498"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref499"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref500"></spring:message></td>
							<td rownumber="3" columnnumber="1"><spring:message
									code="ref501"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref502"></spring:message></td>
							<td rownumber="4" columnnumber="1"><spring:message
									code="ref503"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="5" columnnumber="0"><spring:message
									code="ref504"></spring:message></td>
							<td rownumber="5" columnnumber="1"><spring:message
									code="ref505"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="6" columnnumber="0"><spring:message
									code="ref506"></spring:message></td>
							<td rownumber="6" columnnumber="1"><spring:message
									code="ref507"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="7" columnnumber="0"><spring:message
									code="ref508"></spring:message></td>
							<td rownumber="7" columnnumber="1"><spring:message
									code="ref509"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="8" columnnumber="0"><spring:message
									code="ref510"></spring:message></td>
							<td rownumber="8" columnnumber="1"><spring:message
									code="ref511"></spring:message></td>
						</tr>
                        <tr class="defhead">
							<td rownumber="9" columnnumber="0"><spring:message code="ref512"></spring:message></td>
							<td rownumber="9" columnnumber="1"><spring:message code="ref14"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="10" columnnumber="0"><spring:message
									code="ref513"></spring:message></td>
							<td rownumber="10" columnnumber="1"><spring:message
									code="ref514"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="11" columnnumber="0"><spring:message
									code="ref515"></spring:message></td>
							<td rownumber="11" columnnumber="1"><spring:message
									code="ref516"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="12" columnnumber="0"><spring:message
									code="ref517"></spring:message></td>
							<td rownumber="12" columnnumber="1"><spring:message
									code="ref518"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="13" columnnumber="0"><spring:message
									code="ref519"></spring:message></td>
							<td rownumber="13" columnnumber="1"><spring:message
									code="ref520"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="14" columnnumber="0"><spring:message
									code="ref521"></spring:message></td>
							<td rownumber="14" columnnumber="1"><spring:message
									code="ref522"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br/>
			<br/>
		</div>
	</section>
	<c:if test="${fn:contains(notEmptyEntry,'_143_') || fn:contains(notEmptyEntry,'_144_') || fn:contains(notEmptyEntry,'_145_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			18.2
			<spring:message code="ref33"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_143_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				18.2.1
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
							
							<fra:DynamicTableTag numOfColoumn="4" entryItemName="143" numericColoumn="true"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_143_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_144_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				18.2.2
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
							
							<fra:DynamicTableTag numOfColoumn="2" entryItemName="144" numericColoumn="false"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_144_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_145_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				18.2.3
				<spring:message code="ref44"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_145_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_145_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_146_') || fn:contains(notEmptyEntry,'_147_') || fn:contains(notEmptyEntry,'_148_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			18.3
			<spring:message code="ref45"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_146_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				18.3.1
				<spring:message code="ref46"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_146_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_146_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_147_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				18.3.2
				<spring:message code="ref47"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_147_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_147_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_148_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				18.3.3
				<spring:message code="ref48"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_148_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_148_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_18a_') || fn:contains(notEmptyEntry,'_149_') || fn:contains(notEmptyEntry,'_18b_') || fn:contains(notEmptyEntry,'_151_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			18.4
			<spring:message code="ref49"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_18a_') || param.hideEmpty != 'true'}">
		<div><a name="18a"></a>
			<h4>
				<spring:message code="ref523"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td colspan="2" rowspan="2" rownumber="0" columnnumber="0"><spring:message
									code="ref65"></spring:message></td>
							<td colspan="4" rownumber="0" columnnumber="1"><spring:message
									code="ref284"></spring:message></td>
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
						</tr>
						<tr rowname="18.1" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="2" columnnumber="0"><spring:message
									code="ref496"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_2_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_2_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_2_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_2_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_2_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="2" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_2_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_2_4_}</div></td>
						</tr>
						<tr rowname="18.1.1" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="3" columnnumber="0"><spring:message
									code="ref524"></spring:message></td>
							<td columnname="1990" class="entry-item editable text"
								rownumber="3" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_3_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_3_1_}</div></td>
							<td columnname="2000" class="entry-item editable text"
								rownumber="3" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_3_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_3_2_}</div></td>
							<td columnname="2005" class="entry-item editable text"
								rownumber="3" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_3_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_3_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="3" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_3_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_3_4_}</div></td>
						</tr>
						<tr rowname="18.1.2" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="4" columnnumber="0"><spring:message
									code="ref525"></spring:message></td>
							<td columnname="1990" class="entry-item editable text"
								rownumber="4" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_4_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_4_1_}</div></td>
							<td columnname="2000" class="entry-item editable text"
								rownumber="4" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_4_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_4_2_}</div></td>
							<td columnname="2005" class="entry-item editable text"
								rownumber="4" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_4_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_4_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="4" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_4_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_4_4_}</div></td>
						</tr>
						<tr rowname="18.2" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="5" columnnumber="0"><spring:message
									code="ref502"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_5_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_5_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_5_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_5_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_5_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_5_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="5" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_5_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_5_4_}</div></td>
						</tr>
						<tr rowname="18.2.1" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="6" columnnumber="0"><spring:message
									code="ref526"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_6_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_6_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_6_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_6_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_6_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_6_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="6" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_6_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_6_4_}</div></td>
						</tr>
						<tr rowname="18.2.2" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="7" columnnumber="0"><spring:message
									code="ref527"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_7_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_7_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_7_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_7_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_7_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_7_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="7" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_7_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_7_4_}</div></td>
						</tr>
						<tr rowname="18.2.3" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="8" columnnumber="0"><spring:message
									code="ref528"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_8_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_8_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_8_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_8_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_8_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_8_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="8" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_8_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_8_4_}</div></td>
						</tr>
						<tr rowname="18.3" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="9" columnnumber="0"><spring:message
									code="ref510"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="9" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_9_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_9_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="9" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_9_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_9_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="9" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_9_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_9_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="9" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="18a"><span class="entry_item_placeholder" id="_fraVariable_18a_9_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_18a_9_4_}</div></td>
						</tr>
						<tr>
							<td rownumber="10" columnnumber="0"><spring:message
									code="ref63"></spring:message></td>
							<td rownumber="10" columnnumber="1"></td>
							<td class="total" rownumber="10" columnnumber="1"></td>
							<td class="total" rownumber="10" columnnumber="2"></td>
							<td class="total" rownumber="10" columnnumber="3"></td>
							<td class="total" rownumber="10" columnnumber="4"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_18a_"/>
			<br/>
			<br/>
		</div>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_149_') || param.hideEmpty != 'true'}">
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
							<td rownumber="0" columnnumber="2"><spring:message
									code="ref74"></spring:message></td>
							<td rownumber="0" columnnumber="1"><spring:message
									code="ref75"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref496"></spring:message></td>
							<td class="tier entry-item" rownumber="1" columnnumber="1"
								entry-id="149"><div id="cell-content">
									<fra:tiers name="_fraVariable_149_1_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="1" columnnumber="2"
								entry-id="149"><div id="cell-content">
									<fra:tiers name="_fraVariable_149_1_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref502"></spring:message></td>
							<td class="tier entry-item" rownumber="2" columnnumber="1"
								entry-id="149"><div id="cell-content">
									<fra:tiers name="_fraVariable_149_2_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="2" columnnumber="2"
								entry-id="149"><div id="cell-content">
									<fra:tiers name="_fraVariable_149_2_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref510"></spring:message></td>
							<td class="tier entry-item" rownumber="3" columnnumber="1"
								entry-id="149"><div id="cell-content">
									<fra:tiers name="_fraVariable_149_3_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="3" columnnumber="2"
								entry-id="149"><div id="cell-content">
									<fra:tiers name="_fraVariable_149_3_2_"><option
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
			<fra:feedback feedbackName="_feedback_149_"/>
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
							<td rownumber="0" columnnumber="2"><spring:message
									code="ref74"></spring:message></td>
							<td rownumber="0" columnnumber="1"><spring:message
									code="ref75"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref529"></spring:message></td>

							<td rownumber="1" columnnumber="1"><spring:message
									code="ref530"></spring:message></td>
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
		<c:if test="${fn:contains(notEmptyEntry,'_18b_') || param.hideEmpty != 'true'}">
		<div><a name="18b"></a>
			<h4>
				<spring:message code="ref531"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rowspan="2" rownumber="0" columnnumber="0"><spring:message
									code="ref65"></spring:message></td>
							<td colspan="4" rownumber="0" columnnumber="1"><spring:message
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
						</tr>
						<tr rowname="18.4" unit="1000 ha">
							<td class="title" rownumber="2" columnnumber="0"><spring:message
									code="ref513"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_2_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_2_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_2_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_2_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_2_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="2" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_2_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_2_4_}</div></td>
						</tr>
						<tr rowname="18.5" unit="1000 ha">
							<td class="title" rownumber="3" columnnumber="0"><spring:message
									code="ref532"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_3_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_3_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_3_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_3_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_3_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_3_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="3" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_3_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_3_4_}</div></td>
						</tr>
						<tr rowname="18.6" unit="1000 ha">
							<td class="title" rownumber="4" columnnumber="0"><spring:message
									code="ref533"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_4_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_4_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_4_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_4_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_4_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_4_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="4" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_4_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_4_4_}</div></td>
						</tr>
						<tr rowname="18.7" unit="1000 ha">
							<td class="title" rownumber="5" columnnumber="0"><spring:message
									code="ref519"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_5_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_5_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_5_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_5_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_5_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_5_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="5" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_5_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_5_4_}</div></td>
						</tr>
						<tr rowname="18.8" unit="1000 ha">
							<td class="title" rownumber="6" columnnumber="0"><spring:message
									code="ref292"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_6_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_6_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_6_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_6_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_6_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_6_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="6" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="18b"><span class="entry_item_placeholder" id="_fraVariable_18b_6_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_18b_6_4_}</div></td>
						</tr>
						<tr>
							<td rownumber="7" columnnumber="0"><spring:message
									code="ref63"></spring:message></td>
							<td class="total" rownumber="7" columnnumber="1"></td>
							<td class="total" rownumber="7" columnnumber="2"></td>
							<td class="total" rownumber="7" columnnumber="3"></td>
							<td class="total" rownumber="7" columnnumber="4"></td>
							
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_18b_"/>
			<br/>
			<br/>
		</div>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_151_') || param.hideEmpty != 'true'}">
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
									code="ref75"></spring:message></td>
							<td rownumber="0" columnnumber="2"><spring:message
									code="ref74"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref513"></spring:message></td>
							<td class="tier entry-item" rownumber="1" columnnumber="1"
								entry-id="151"><div id="cell-content">
									<fra:tiers name="_fraVariable_151_1_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="1" columnnumber="2"
								entry-id="151"><div id="cell-content">
									<fra:tiers name="_fraVariable_151_1_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref532"></spring:message></td>
							<td class="tier entry-item" rownumber="2" columnnumber="1"
								entry-id="151"><div id="cell-content">
									<fra:tiers name="_fraVariable_151_2_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="2" columnnumber="2"
								entry-id="151"><div id="cell-content">
									<fra:tiers name="_fraVariable_151_2_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref533"></spring:message></td>
							<td class="tier entry-item" rownumber="3" columnnumber="1"
								entry-id="151"><div id="cell-content">
									<fra:tiers name="_fraVariable_151_3_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="3" columnnumber="2"
								entry-id="151"><div id="cell-content">
									<fra:tiers name="_fraVariable_151_3_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref519"></spring:message></td>
							<td class="tier entry-item" rownumber="4" columnnumber="1"
								entry-id="151"><div id="cell-content">
									<fra:tiers name="_fraVariable_151_4_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="4" columnnumber="2"
								entry-id="151"><div id="cell-content">
									<fra:tiers name="_fraVariable_151_4_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="5" columnnumber="0"><spring:message
									code="ref292"></spring:message></td>
							<td class="tier entry-item" rownumber="5" columnnumber="1"
								entry-id="151"><div id="cell-content">
									<fra:tiers name="_fraVariable_151_5_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="5" columnnumber="2"
								entry-id="151"><div id="cell-content">
									<fra:tiers name="_fraVariable_151_5_2_"><option
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
			<fra:feedback feedbackName="_feedback_151_"/>
			<br/>
			<br/>
		</div>
		</c:if>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_152_') || fn:contains(notEmptyEntry,'_153_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			18.5
			<spring:message code="ref126"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_152_') || param.hideEmpty != 'true'}">
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
									code="ref496"></spring:message></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="152"><span class="entry_item_placeholder" id="_fraVariable_152_1_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_152_1_1_}</div></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="152"><span class="entry_item_placeholder" id="_fraVariable_152_1_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_152_1_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref502"></spring:message></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="152"><span class="entry_item_placeholder" id="_fraVariable_152_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_152_2_1_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="152"><span class="entry_item_placeholder" id="_fraVariable_152_2_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_152_2_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref510"></spring:message></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="152"><span class="entry_item_placeholder" id="_fraVariable_152_3_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_152_3_1_}</div></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="152"><span class="entry_item_placeholder" id="_fraVariable_152_3_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_152_3_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref535b"></spring:message></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="152"><span class="entry_item_placeholder" id="_fraVariable_152_4_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_152_4_1_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="152"><span class="entry_item_placeholder" id="_fraVariable_152_4_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_152_4_2_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_152_"/>
			<br/>
			<br/>
		</div>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_153_') || param.hideEmpty != 'true'}">
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
								entry-id="153"><span class="entry_item_placeholder" id="_fraVariable_153_1_0_">&#160;</span>
							<div id="cell-content">${_fraVariable_153_1_0_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_153_"/>
			<br/>
			<br/>
		</div>
		</c:if>
	</section>
	</c:if>
</section>

</c:if>