<%@ include file="../../common/includes/taglibs.jsp"%>
<section>
	<div class="page-header">
		<h1>
			2.
			<spring:message code="ref89"></spring:message>
		</h1>
	</div>
	<p class="lead">
		<spring:message code="refq2faq"></spring:message>
	</p>
	
	<fra:reviewers />
	
	<section>
		<h2>
			2.1
			<spring:message code="ref12"></spring:message>
		</h2>
		<div>
			<div></div>
			<div class="entry">
				<table
					class="table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rownumber="0" columnnumber="0"><spring:message code="ref90"></spring:message></td>
							<td rownumber="0" columnnumber="1"><spring:message code="ref14"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message code="ref91"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message code="ref92"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message code="refq2nister"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message code="refq2nisdef"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message code="ref93"></spring:message></td>
							<td rownumber="3" columnnumber="1"><spring:message code="ref94"></spring:message></td>
						</tr>
						<tr class="defhead">
							<td rownumber="4" columnnumber="0"><spring:message code="ref13"></spring:message></td>
							<td rownumber="4" columnnumber="1"><spring:message code="ref14"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="5" columnnumber="0"><spring:message code="ref95"></spring:message></td>
							<td rownumber="5" columnnumber="1"><spring:message code="ref96"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="6" columnnumber="0"><spring:message code="ref97"></spring:message></td>
							<td rownumber="6" columnnumber="1"><spring:message code="ref98"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="7" columnnumber="0"><spring:message code="ref99"></spring:message></td>
							<td rownumber="7" columnnumber="1"><spring:message code="ref100"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="8" columnnumber="0"><spring:message code="refq2nrncat"></spring:message></td>
							<td rownumber="8" columnnumber="1"><spring:message code="refq2nrndef"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="9" columnnumber="0"><spring:message code="ref101"></spring:message></td>
							<td rownumber="9" columnnumber="1"><spring:message code="ref102"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="10" columnnumber="0"><spring:message code="ref103"></spring:message></td>
							<td rownumber="10" columnnumber="1"><spring:message code="ref104"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="11" columnnumber="0"><spring:message code="ref105"></spring:message></td>
							<td rownumber="11" columnnumber="1"><spring:message code="ref106"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="12" columnnumber="0"><spring:message code="refq2mpcat"></spring:message></td>
							<td rownumber="12" columnnumber="1"><spring:message code="refq2mpdef"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br/>
			<br/>
		</div>
	</section>
	<section>
		<h2>
			2.2
			<spring:message code="ref33"></spring:message>
		</h2>
		<section>
			<h3>
				2.2.1
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
							
							<fra:DynamicTableTag numOfColoumn="4" entryItemName="15x" numericColoumn="true"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_15x_"/>
				<br/>
				<br/>
			</div>
		</section>
		<section>
			<h3>
				2.2.2
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
							
							<fra:DynamicTableTag numOfColoumn="2" entryItemName="16x" numericColoumn="false"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_16x_"/>
				<br/>
				<br/>
			</div>
		</section>
		<section>
			<h3>
				2.2.3
				<spring:message code="ref44"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_17x_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_17x_"/>
				<br/>
				<br/>
			</div>
		</section>
	</section>
	<section>
		<h2>
			2.3
			<spring:message code="ref45"></spring:message>
		</h2>
		<section>
			<h3>
				2.3.1
				<spring:message code="ref46"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_18x_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_18x_"/>
				<br/>
				<br/>
			</div>
		</section>
		<section>
			<h3>
				2.3.2
				<spring:message code="ref107"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_19x_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_19x_"/>
				<br/>
				<br/>
			</div>
		</section>
		<section>
			<h3>
				2.3.3
				<spring:message code="ref48"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_20x_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_20x_"/>
				<br/>
				<br/>
			</div>
		</section>
	</section>
	<section>
		<h2>
			2.4
			<spring:message code="ref49"></spring:message>
		</h2>
		<div>
			<h4>
				<spring:message code="ref108"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<!--?xml version="1.0"?-->
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rowspan="2" colspan="3" rownumber="0" columnnumber="0"><spring:message
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
						<tr rowname="2.1" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" colspan="2" rownumber="2" columnnumber="0"><spring:message
									code="ref95"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_2_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_2_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_2_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_2_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_2_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_2_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_2_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="2" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_2_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_2_5_}</div></td>
						</tr>
						<tr rowname="2.2" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" colspan="2" rownumber="3" columnnumber="0"><spring:message
									code="ref97"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_3_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_3_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_3_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_3_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_3_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_3_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_3_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_3_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="3" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_3_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_3_5_}</div></td>
						</tr>
						<tr rowname="2.1.1" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" colspan="2" rownumber="4" columnnumber="0"><spring:message
									code="ref110"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_4_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_4_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_4_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_4_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_4_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_4_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_4_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_4_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="4" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_4_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_4_5_}</div></td>
						</tr>
						<tr rowname="2.1.1.1" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" colspan="2" rownumber="5" columnnumber="0"><spring:message
									code="ref111"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_5_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_5_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_5_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_5_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_5_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_5_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_5_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_5_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="5" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_5_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_5_5_}</div></td>
						</tr>
						<tr rowname="2.3" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" colspan="2" rownumber="6" columnnumber="0"><spring:message
									code="ref101"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_6_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_6_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_6_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_6_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_6_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_6_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_6_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_6_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="6" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_6_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_6_5_}</div></td>
						</tr>
						<tr rowname="2.3.1" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" colspan="2" rownumber="7" columnnumber="0"><spring:message
									code="ref110"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_7_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_7_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_7_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_7_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_7_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_7_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_7_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_7_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="7" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="2a"><span class="entry_item_placeholder" id="_fraVariable_2a_7_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_2a_7_5_}</div></td>
						</tr>
						<tr>
							<td colspan="2" rownumber="10" columnnumber="0"><spring:message
									code="ref63"></spring:message></td>
							<td  rownumber="10" columnnumber="1"></td>
							<td class="total" rownumber="10" columnnumber="1"></td>
							<td class="total" rownumber="10" columnnumber="2"></td>
							<td class="total" rownumber="10" columnnumber="3"></td>
							<td class="total" rownumber="10" columnnumber="4"></td>
							<td class="total" rownumber="10" columnnumber="5"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_2a_"/>
			<br/>
			<br/>
		</div>
		<div>
			<h4>
				<spring:message code="ref112"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<!--?xml version="1.0"?-->
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td colspan="9" rownumber="0" columnnumber="0"><spring:message
									code="ref113"></spring:message></td>
						</tr>
                        <tr class="defhead">
							<td colspan="3" rownumber="1" columnnumber="0"><spring:message
									code="ref114"></spring:message></td>
							<td colspan="3" rownumber="1" columnnumber="1"><spring:message
									code="ref115"></spring:message></td>
							<td colspan="3" rownumber="1" columnnumber="2"><spring:message
									code="ref116"></spring:message></td>
						</tr>
                        <tr class="defhead">
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref117"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref118"></spring:message></td>
							<td rownumber="2" columnnumber="2"><spring:message
									code="ref19"></spring:message></td>
							<td rownumber="2" columnnumber="3"><spring:message
									code="ref117"></spring:message></td>
							<td rownumber="2" columnnumber="4"><spring:message
									code="ref118"></spring:message></td>
							<td rownumber="2" columnnumber="5"><spring:message
									code="ref19"></spring:message></td>
							<td rownumber="2" columnnumber="6"><spring:message
									code="ref117"></spring:message></td>
							<td rownumber="2" columnnumber="7"><spring:message
									code="ref118"></spring:message></td>
							<td rownumber="2" columnnumber="8"><spring:message
									code="ref19"></spring:message></td>
						</tr>

						<tr rowname="2.4" class="summary-aggregated" unit="1000 ha">
							<td columnname="1990-2000"
								class="prefilled entry-item editable text" rownumber="7"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="2b"><span class="entry_item_placeholder" id="_fraVariable_2b_7_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_2b_7_1_}</div></td>
							<td columnname="1990-2000"
								class="prefilled entry-item editable text" rownumber="7"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="2b"><span class="entry_item_placeholder" id="_fraVariable_2b_7_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_2b_7_2_}</div></td>
							<td columnname="1990-2000"
								class="prefilled entry-item editable text" rownumber="7"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="2b"><span class="entry_item_placeholder" id="_fraVariable_2b_7_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_2b_7_3_}</div></td>
							<td columnname="2000-2010"
								class="prefilled entry-item editable text" rownumber="7"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="2b"><span class="entry_item_placeholder" id="_fraVariable_2b_7_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_2b_7_4_}</div></td>
							<td columnname="2000-2010"
								class="prefilled entry-item editable text" rownumber="7"
								columnnumber="5" style="background-color: rgb(242, 245, 169);"
								entry-id="2b"><span class="entry_item_placeholder" id="_fraVariable_2b_7_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_2b_7_5_}</div></td>
							<td columnname="2000-2010"
								class="prefilled entry-item editable text" rownumber="7"
								columnnumber="6" style="background-color: rgb(242, 245, 169);"
								entry-id="2b"><span class="entry_item_placeholder" id="_fraVariable_2b_7_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_2b_7_6_}</div></td>
							<td columnname="2010-2015"
								class="prefilled entry-item editable text" rownumber="7"
								columnnumber="7" style="background-color: rgb(242, 245, 169);"
								entry-id="2b"><span class="entry_item_placeholder" id="_fraVariable_2b_7_7_">&#160;</span>
							<div id="cell-content">${_fraVariable_2b_7_7_}</div></td>
							<td columnname="2010-2015"
								class="prefilled entry-item editable text" rownumber="7"
								columnnumber="8" style="background-color: rgb(242, 245, 169);"
								entry-id="2b"><span class="entry_item_placeholder" id="_fraVariable_2b_7_8_">&#160;</span>
							<div id="cell-content">${_fraVariable_2b_7_8_}</div></td>
							<td columnname="2010-2015" class="entry-item editable text"
								rownumber="7" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="2b"><span class="entry_item_placeholder" id="_fraVariable_2b_7_9_">&#160;</span>
							<div id="cell-content">${_fraVariable_2b_7_9_}</div></td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_2b_"/>
			<br/>
			<br/>
		</div>
		<div>
			<h4>
				<spring:message code="ref120"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<!--?xml version="1.0"?-->
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rowspan="2" colspan="2" rownumber="0" columnnumber="0"><spring:message
									code="ref65"></spring:message></td>
							<td colspan="5" rownumber="0" columnnumber="1"><spring:message
									code="ref52"></spring:message></td>
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
						<tr rowname="2.5" unit="1000 ha">
							<td class="title" colspan="2" rownumber="2" columnnumber="0"><spring:message
									code="ref121"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="2c"><span class="entry_item_placeholder" id="_fraVariable_2c_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_2c_2_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="2c"><span class="entry_item_placeholder" id="_fraVariable_2c_2_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_2c_2_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="2c"><span class="entry_item_placeholder" id="_fraVariable_2c_2_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_2c_2_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="2c"><span class="entry_item_placeholder" id="_fraVariable_2c_2_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_2c_2_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="2" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="2c"><span class="entry_item_placeholder" id="_fraVariable_2c_2_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_2c_2_5_}</div></td>
						</tr>
						<tr rowname="2.5.1" unit="1000 ha">
							<td class="title" colspan="2" rownumber="3" columnnumber="0"><spring:message
									code="ref122"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="2c"><span class="entry_item_placeholder" id="_fraVariable_2c_3_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_2c_3_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="2c"><span class="entry_item_placeholder" id="_fraVariable_2c_3_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_2c_3_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="2c"><span class="entry_item_placeholder" id="_fraVariable_2c_3_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_2c_3_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="2c"><span class="entry_item_placeholder" id="_fraVariable_2c_3_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_2c_3_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="3" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="2c"><span class="entry_item_placeholder" id="_fraVariable_2c_3_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_2c_3_5_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_2c_"/>
			<br/>
			<br/>
		</div>
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
									code="ref95"></spring:message></td>
							<td class="tier entry-item" rownumber="1" columnnumber="1"
								entry-id="21"><div id="cell-content">
									<fra:tiers name="_fraVariable_21x_1_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="1" columnnumber="2"
								entry-id="21"><div id="cell-content">
									<fra:tiers name="_fraVariable_21x_1_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref97"></spring:message></td>
							<td class="tier entry-item" rownumber="2" columnnumber="1"
								entry-id="21"><div id="cell-content">
									<fra:tiers name="_fraVariable_21x_2_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="2" columnnumber="2"
								entry-id="21"><div id="cell-content">
									<fra:tiers name="_fraVariable_21x_2_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref101"></spring:message></td>
							<td class="tier entry-item" rownumber="3" columnnumber="1"
								entry-id="21"><div id="cell-content">
									<fra:tiers name="_fraVariable_21x_3_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="3" columnnumber="2"
								entry-id="21"><div id="cell-content">
									<fra:tiers name="_fraVariable_21x_3_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref105"></spring:message></td>
							<td class="tier entry-item" rownumber="4" columnnumber="1"
								entry-id="21"><div id="cell-content">
									<fra:tiers name="_fraVariable_21x_4_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="4" columnnumber="2"
								entry-id="21"><div id="cell-content">
									<fra:tiers name="_fraVariable_21x_4_2_"><option
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
			<fra:feedback feedbackName="_feedback_21x_"/>
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
									code="ref124"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref125"></spring:message></td>
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
	</section>
	<section>
		<h2>
			2.5
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
							<td rownumber="0" columnnumber="2"><spring:message
									code="ref127"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref95"></spring:message></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="23"><span class="entry_item_placeholder" id="_fraVariable_23x_1_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_23x_1_1_}</div></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="23"><span class="entry_item_placeholder" id="_fraVariable_23x_1_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_23x_1_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref128"></spring:message></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="23"><span class="entry_item_placeholder" id="_fraVariable_23x_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_23x_2_1_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="23"><span class="entry_item_placeholder" id="_fraVariable_23x_2_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_23x_2_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref101"></spring:message></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="23"><span class="entry_item_placeholder" id="_fraVariable_23x_3_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_23x_3_1_}</div></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="23"><span class="entry_item_placeholder" id="_fraVariable_23x_3_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_23x_3_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref105"></spring:message></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="23"><span class="entry_item_placeholder" id="_fraVariable_23x_4_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_23x_4_1_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="23"><span class="entry_item_placeholder" id="_fraVariable_23x_4_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_23x_4_2_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_23x_"/>
			<br/>
			<br/>
		</div>
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
								entry-id="24"><span class="entry_item_placeholder" id="_fraVariable_24x_1_0_">&#160;</span>
							<div id="cell-content">${_fraVariable_24x_1_0_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_24x_"/>
			<br/>
			<br/>
		</div>
	</section>
</section>