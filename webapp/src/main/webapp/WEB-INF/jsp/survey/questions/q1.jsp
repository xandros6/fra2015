<%@ include file="../../common/includes/taglibs.jsp"%>

<c:set var="q" value="_1_" />
<c:set var="hide" value="false" />
<c:if test="${(! fn:contains(notEmptyQuestion,q)) && param.hideEmpty == 'true'}">
  <c:set var="hide" value="true" />
</c:if>

<c:if test="${hide == 'false'}">

<section>
	<div class="page-header">
		<h1>
			1.
			<spring:message code="ref11"></spring:message>
		</h1>
	</div>
	<p class="lead">
		<spring:message code="refq1faq"></spring:message>
	</p>
	
	<fra:reviewers />
	
	<section>
		<h2>
			1.1
			<spring:message code="ref12"></spring:message>
		</h2>
		<div>
			<div></div>
			<div class="entry">
				<table
					class="table table-bordered table-hover table-condensed table-striped">
					<tbody>
                        <tr>
							<td rownumber="0" columnnumber="0"><spring:message code="ref13"></spring:message></td>
							<td rownumber="0" columnnumber="1"><spring:message code="ref14"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message code="ref15"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message code="ref16"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message code="ref17"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message code="ref18"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message code="ref19"></spring:message></td>
							<td rownumber="3" columnnumber="1"><spring:message code="ref20"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message code="ref21"></spring:message></td>
							<td rownumber="4" columnnumber="1"><spring:message code="ref22"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="5" columnnumber="0"><spring:message code="ref23"></spring:message></td>
							<td rownumber="5" columnnumber="1"><spring:message code="ref24"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="6" columnnumber="0"><spring:message code="ref25"></spring:message></td>
							<td rownumber="6" columnnumber="1"><spring:message code="ref26"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="7" columnnumber="0"><spring:message code="refq1affcat"></spring:message></td>
							<td rownumber="7" columnnumber="1"><spring:message code="refq1affdef"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="9" columnnumber="0"><spring:message code="ref29"></spring:message></td>
							<td rownumber="9" columnnumber="1"><spring:message code="ref30"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="10" columnnumber="0"><spring:message code="ref31"></spring:message></td>
							<td rownumber="10" columnnumber="1"><spring:message code="ref32"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="11" columnnumber="0"><spring:message code="refq1dhicat"></spring:message></td>
							<td rownumber="11" columnnumber="1"><spring:message code="refq1dhidef"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="12" columnnumber="0"><spring:message code="ref27"></spring:message></td>
							<td rownumber="12" columnnumber="1"><spring:message code="ref28"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="13" columnnumber="0"><spring:message code="refq1rarcat"></spring:message></td>
							<td rownumber="13" columnnumber="1"><spring:message code="refq1rardef"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br/>
			<br/>
		</div>
	</section>
	
	<c:if test="${(fn:contains(notEmptyEntry,'_3x_')) || fn:contains(notEmptyEntry,'_4x_') || fn:contains(notEmptyEntry,'_5x_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			1.2
			<spring:message code="ref33"></spring:message>
		</h2>
		<c:if test="${(fn:contains(notEmptyEntry,'_3x_')) || param.hideEmpty != 'true'}">
		<section>
			<h3>
				1.2.1
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

							<fra:DynamicTableTag numOfColoumn="4" entryItemName="3x" numericColoumn="true"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_3x_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
		<c:if test="${(fn:contains(notEmptyEntry,'_4x_')) || param.hideEmpty != 'true'}">
		<section>
			<h3>
				1.2.2
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
							
							<fra:DynamicTableTag numOfColoumn="2" entryItemName="4x" numericColoumn="false"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_4x_"/>
				
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
		<c:if test="${(fn:contains(notEmptyEntry,'_5x_')) || param.hideEmpty != 'true'}">
		<section>
			<h3>
				1.2.3
				<spring:message code="ref44"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_5x_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_5x_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
	</section>
	</c:if>
	<c:if test="${(fn:contains(notEmptyEntry,'_6x_')) || fn:contains(notEmptyEntry,'_7x_') || fn:contains(notEmptyEntry,'_8x_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			1.3
			<spring:message code="ref45"></spring:message>
		</h2>
		<c:if test="${(fn:contains(notEmptyEntry,'_6x_')) || param.hideEmpty != 'true'}">
		<section>
			<h3>
				1.3.1
				<spring:message code="ref46"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_6x_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_6x_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
		<c:if test="${(fn:contains(notEmptyEntry,'_7x_')) || param.hideEmpty != 'true'}">
		<section>
			<h3>
				1.3.2
				<spring:message code="ref47"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_7x_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_7x_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
		<c:if test="${(fn:contains(notEmptyEntry,'_8x_')) || param.hideEmpty != 'true'}">
		<section>
			<h3>
				1.3.3
				<spring:message code="ref48"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_8x_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_8x_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
	</section>
	</c:if>
	<c:if test="${(fn:contains(notEmptyEntry,'_1a_')) || fn:contains(notEmptyEntry,'_1b_') || fn:contains(notEmptyEntry,'_9x_') || fn:contains(notEmptyEntry,'_11x_') || fn:contains(notEmptyEntry,'_12x_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			1.4
			<spring:message code="ref49"></spring:message>
		</h2>
		<c:if test="${(fn:contains(notEmptyEntry,'_1a_')) || param.hideEmpty != 'true'}">
		<div><a id="inpagelink_var_1a"></a>
			<h4>
				<spring:message code="ref50"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<!--?xml version="1.0"?-->
				<table cols="20 * * * * * * *" class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rowspan="2" colspan="3" rownumber="0" columnnumber="0"><spring:message
									code="ref51"></spring:message></td>
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
						<tr rowname="1.1" unit="1000 ha">
							<td><img width="20px" src="${baseURL}/img/CFRQbutton.png" /></td>
							<td class="title" colspan="2" rownumber="2" columnnumber="0"><spring:message
									code="ref58"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_2_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_2_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_2_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_2_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_2_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_2_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_2_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="2" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_2_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_2_5_}</div></td>
						</tr>
						<tr rowname="1.2" unit="1000 ha">
							<td><img width="20px" src="${baseURL}/img/CFRQbutton.png" /></td>
							<td class="title" colspan="2" rownumber="3" columnnumber="0"><spring:message
									code="ref59"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_3_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_3_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_3_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_3_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_3_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_3_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_3_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_3_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="3" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_3_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_3_5_}</div></td>
						</tr>
						<tr rowname="1.3" unit="1000 ha">
							<td><img width="20px" src="${baseURL}/img/CFRQbutton.png" /></td>
							<td class="title" colspan="2" rownumber="4" columnnumber="0"><spring:message
									code="ref60"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_4_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_4_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_4_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_4_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_4_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_4_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_4_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_4_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="4" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_4_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_4_5_}</div></td>
						</tr>
						<tr rowname="1.3.1" unit="1000 ha">
							<td><img width="20px" src="${baseURL}/img/CFRQbutton.png" /></td>
							<td class="title" colspan="2" rownumber="5" columnnumber="0"><spring:message
									code="ref61"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_5_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_5_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_5_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_5_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_5_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_5_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_5_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_5_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="5" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_5_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_5_5_}</div></td>
						</tr>
						<tr rowname="1.4" unit="1000 ha">
							<td><img width="20px" src="${baseURL}/img/CFRQbutton.png" /></td>
							<td class="title" colspan="2" rownumber="6" columnnumber="0"><spring:message
									code="ref23"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_6_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_6_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_6_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_6_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_6_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_6_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_6_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_6_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="6" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_6_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_6_5_}</div></td>
						</tr>
						<!--  <tr rowname="1.5" unit="1000 ha">
							<td><img width="20px" src="${baseURL}/img/CFRQbutton.png" /></td>
							<td class="title" colspan="2" rownumber="7" columnnumber="0"><spring:message
									code="ref62"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_7_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_7_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_7_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_7_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_7_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_7_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_7_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_7_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="7" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="1a"><span class="entry_item_placeholder" id="_fraVariable_1a_7_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_1a_7_5_}</div></td>
						</tr> -->
						<tr>
							<td></td>
							<td colspan="2" rownumber="8" columnnumber="0"><spring:message
									code="ref63"></spring:message></td>
							<td class="total" rownumber="8" columnnumber="1"></td>
							<td class="total" rownumber="8" columnnumber="2"></td>
							<td class="total" rownumber="8" columnnumber="3"></td>
							<td class="total" rownumber="8" columnnumber="4"></td>
							<td class="total" rownumber="8" columnnumber="5"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_1a_"/>
			<br/>
			<br/>
		</div>
		</c:if>
		<c:if test="${(fn:contains(notEmptyEntry,'_1b_')) || param.hideEmpty != 'true'}">
		<div><a id="inpagelink_var_1b"></a>
			<h4>
				<spring:message code="ref64"></spring:message>
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
							<td colspan="4" rownumber="0" columnnumber="1"><spring:message
									code="ref66"></spring:message></td>
							<td colspan="4" rownumber="0" columnnumber="2"><spring:message
									code="ref67"></spring:message></td>
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
									code="ref53"></spring:message></td>
							<td rownumber="1" columnnumber="5"><spring:message
									code="ref54"></spring:message></td>
							<td rownumber="1" columnnumber="6"><spring:message
									code="ref55"></spring:message></td>
							<td rownumber="1" columnnumber="7"><spring:message
									code="ref56"></spring:message></td>
						</tr>
						<tr rowname="1.6" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" colspan="2" rownumber="6" columnnumber="0"><spring:message
									code="ref68"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_2_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_2_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_2_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_2_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_2_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_2_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_2_4_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_2_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_2_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_2_7_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_2_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_2_8_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_2_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_2_9_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_2_9_}</div></td>
						</tr>
						<tr rowname="1.6.1" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" colspan="2" rownumber="3" columnnumber="0"><spring:message
									code="ref69"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_3_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_3_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_3_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_3_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_3_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_3_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_3_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_3_4_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_3_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_3_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_3_7_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_3_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_3_8_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_3_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_3_9_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_3_9_}</div></td>
						</tr>
						<tr rowname="1.6.2" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" colspan="2" rownumber="4" columnnumber="0"><spring:message
									code="ref70"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_4_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_4_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_4_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_4_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_4_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_4_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_4_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_4_4_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_4_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_4_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_4_7_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_4_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_4_8_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_4_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_4_9_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_4_9_}</div></td>
						</tr>
						<tr rowname="1.7" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" colspan="2" rownumber="5" columnnumber="0"><spring:message
									code="ref31"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_5_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_5_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_5_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_5_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_5_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_5_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_5_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_5_4_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_5_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_5_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_5_7_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_5_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_5_8_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_5_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_5_9_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_5_9_}</div></td>
						</tr>
						<tr rowname="1.7.1" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" colspan="2" rownumber="6" columnnumber="0"><spring:message
									code="ref71"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_6_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_6_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_6_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_6_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_6_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_6_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_6_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_6_4_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_6_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_6_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_6_7_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_6_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_6_8_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_6_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_6_9_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_6_9_}</div></td>
						</tr>
						<tr rowname="1.8" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" colspan="2" rownumber="7" columnnumber="0"><spring:message
									code="ref27"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_7_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_7_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_7_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_7_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_7_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_7_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_7_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_7_4_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_7_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_7_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_7_7_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_7_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_7_8_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_7_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_7_9_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_7_9_}</div></td>
						</tr>
						<tr rowname="1.8.1" unit="1000 ha">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" colspan="2" rownumber="8" columnnumber="0"><spring:message
									code="ref72"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_8_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_8_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_8_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_8_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_8_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_8_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_8_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_8_4_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_8_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_8_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_8_7_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_8_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_8_8_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_8_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="1b"><span class="entry_item_placeholder" id="_fraVariable_1b_8_9_">&#160;</span>
							<div id="cell-content">${_fraVariable_1b_8_9_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_1b_"/>
			<br/>
			<br/>
		</div>
		</c:if>
		<c:if test="${(fn:contains(notEmptyEntry,'_9x_')) || param.hideEmpty != 'true'}">
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
									code="ref15"></spring:message></td>
							<td class="tier entry-item" rownumber="1" columnnumber="1"
								entry-id="9"><div id="cell-content">
									<fra:tiers name="_fraVariable_9x_1_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="1" columnnumber="2"
								entry-id="9"><div id="cell-content">
									<fra:tiers name="_fraVariable_9x_1_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref17"></spring:message></td>
							<td class="tier entry-item" rownumber="2" columnnumber="1"
								entry-id="9"><div id="cell-content">
									<fra:tiers name="_fraVariable_9x_2_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="2" columnnumber="2"
								entry-id="9"><div id="cell-content">
									<fra:tiers name="_fraVariable_9x_2_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref25"></spring:message></td>
							<td class="tier entry-item" rownumber="3" columnnumber="1"
								entry-id="9"><div id="cell-content">
									<fra:tiers name="_fraVariable_9x_3_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="3" columnnumber="2"
								entry-id="9"><div id="cell-content">
									<fra:tiers name="_fraVariable_9x_3_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="6" columnnumber="0"><spring:message
									code="ref31"></spring:message></td>
							<td class="tier entry-item" rownumber="6" columnnumber="1"
								entry-id="9"><div id="cell-content">
									<fra:tiers name="_fraVariable_9x_6_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="6" columnnumber="2"
								entry-id="9"><div id="cell-content">
									<fra:tiers name="_fraVariable_9x_6_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref27"></spring:message></td>
							<td class="tier entry-item" rownumber="4" columnnumber="1"
								entry-id="9"><div id="cell-content">
									<fra:tiers name="_fraVariable_9x_4_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="4" columnnumber="2"
								entry-id="9"><div id="cell-content">
									<fra:tiers name="_fraVariable_9x_4_2_"><option
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
			<fra:feedback feedbackName="_feedback_9x_"/>
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
									code="ref77"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref78"></spring:message></td>
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
		<c:if test="${(fn:contains(notEmptyEntry,'_11x_')) || param.hideEmpty != 'true'}">
		<div>
			<h4>
				<spring:message code="ref80"></spring:message>
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
									code="ref81"></spring:message></td>
							<td rownumber="0" columnnumber="2"><spring:message
									code="ref82"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref15"></spring:message></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="11"><span class="entry_item_placeholder" id="_fraVariable_11x_1_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_11x_1_1_}</div></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="11"><span class="entry_item_placeholder" id="_fraVariable_11x_1_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_11x_1_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref17"></spring:message></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="11"><span class="entry_item_placeholder" id="_fraVariable_11x_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_11x_2_1_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="11"><span class="entry_item_placeholder" id="_fraVariable_11x_2_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_11x_2_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref19"></spring:message></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="11"><span class="entry_item_placeholder" id="_fraVariable_11x_3_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_11x_3_1_}</div></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="11"><span class="entry_item_placeholder" id="_fraVariable_11x_3_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_11x_3_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref83"></spring:message></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="11"><span class="entry_item_placeholder" id="_fraVariable_11x_4_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_11x_4_1_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="11"><span class="entry_item_placeholder" id="_fraVariable_11x_4_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_11x_4_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="5" columnnumber="0"><spring:message
									code="ref23"></spring:message></td>
							<td class="entry-item editable text" rownumber="5"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="11"><span class="entry_item_placeholder" id="_fraVariable_11x_5_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_11x_5_1_}</div></td>
							<td class="entry-item editable text" rownumber="5"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="11"><span class="entry_item_placeholder" id="_fraVariable_11x_5_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_11x_5_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="6" columnnumber="0"><spring:message
									code="ref25"></spring:message></td>
							<td class="entry-item editable text" rownumber="6"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="11"><span class="entry_item_placeholder" id="_fraVariable_11x_6_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_11x_6_1_}</div></td>
							<td class="entry-item editable text" rownumber="6"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="11"><span class="entry_item_placeholder" id="_fraVariable_11x_6_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_11x_6_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="7" columnnumber="0"><spring:message
									code="ref31"></spring:message></td>
							<td class="entry-item editable text" rownumber="9"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="11"><span class="entry_item_placeholder" id="_fraVariable_11x_7_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_11x_7_1_}</div></td>
							<td class="entry-item editable text" rownumber="9"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="11"><span class="entry_item_placeholder" id="_fraVariable_11x_7_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_11x_7_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="8" columnnumber="0"><spring:message
									code="ref27"></spring:message></td>
							<td class="entry-item editable text" rownumber="7"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="11"><span class="entry_item_placeholder" id="_fraVariable_11x_8_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_11x_8_1_}</div></td>
							<td class="entry-item editable text" rownumber="7"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="11"><span class="entry_item_placeholder" id="_fraVariable_11x_8_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_11x_8_2_}</div></td>
						</tr>
						
						
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_11x_"/>
			<br/>
			<br/>
		</div>
		</c:if>
		<c:if test="${(fn:contains(notEmptyEntry,'_12x_')) || param.hideEmpty != 'true'}">
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
								entry-id="12"><span class="entry_item_placeholder" id="_fraVariable_12x_1_0_">&#160;</span>
							<div id="cell-content">${_fraVariable_12x_1_0_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_12x_"/>
			<br/>
			<br/>
		</div>
		</c:if>
	</section>
  </c:if>
</section>

</c:if>