<%@ include file="../../common/includes/taglibs.jsp"%>
<section>
	<div class="page-header">
		<h1>
			3.
			<spring:message code="ref130"></spring:message>
		</h1>
	</div>
	<p class="lead">
		<spring:message code="refq3faq"></spring:message>
	</p>
	<section>
		<h2>
			3.1
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
									code="ref131"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref132"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref133"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref134"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref135"></spring:message></td>
							<td rownumber="3" columnnumber="1"><spring:message
									code="ref136"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref137"></spring:message></td>
							<td rownumber="4" columnnumber="1"><spring:message
									code="ref138"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="5" columnnumber="0"><spring:message
									code="ref139"></spring:message></td>
							<td rownumber="5" columnnumber="1"><spring:message
									code="ref140"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="6" columnnumber="0"><spring:message
									code="ref141"></spring:message></td>
							<td rownumber="6" columnnumber="1"><spring:message
									code="ref142"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="7" columnnumber="0"><spring:message
									code="ref143"></spring:message></td>
							<td rownumber="7" columnnumber="1"><spring:message
									code="ref144"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="8" columnnumber="0"><spring:message
									code="ref145"></spring:message></td>
							<td rownumber="8" columnnumber="1"><spring:message
									code="ref146"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="9" columnnumber="0"><spring:message
									code="ref147"></spring:message></td>
							<td rownumber="9" columnnumber="1"><spring:message
									code="ref148"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="10" columnnumber="0"><spring:message
									code="ref149"></spring:message></td>
							<td rownumber="10" columnnumber="1"><spring:message
									code="ref150"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<br>
			<br>
		</div>
	</section>
	<section>
		<h2>
			3.2
			<spring:message code="ref33"></spring:message>
		</h2>
		<section>
			<h3>
				3.2.1
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
								<c:if test="${profile == 'CONTRIBUTOR'}">
									<td class="action-column" width="80px"></td>
								</c:if>
							</tr>
							
							<fra:DynamicTableTag numOfColoumn="4" entryItemName="26" numericColoumn="true"/>
							
						</tbody>
					</table>
				</div>
				<div class="control pull-right">
					<c:if test="${profile == 'CONTRIBUTOR'}">
						<a  href="#" class="btn btn-mini addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_26_"/>
				<br>
				<br>
			</div>
		</section>
		<section>
			<h3>
				3.2.2
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
								<c:if test="${profile == 'CONTRIBUTOR'}">
									<td class="action-column" width="80px"></td>
								</c:if>
							</tr>
							
							<fra:DynamicTableTag numOfColoumn="2" entryItemName="27" numericColoumn="false"/>
							
						</tbody>
					</table>
				</div>
				<div class="control pull-right">
					<c:if test="${profile == 'CONTRIBUTOR'}">
						<a  href="#" class="btn btn-mini addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_27_"/>
				<br>
				<br>
			</div>
		</section>
		<section>
			<h3>
				3.2.3
				<spring:message code="ref44"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_28_"></fra:richtextentry>
				</div>
				<div class="control pull-right"></div>
				<fra:feedback feedbackName="_feedback_28_"/>
				<br>
				<br>
			</div>
		</section>
	</section>
	<section>
		<h2>
			3.3
			<spring:message code="ref45"></spring:message>
		</h2>
		<section>
			<h3>
				3.3.1
				<spring:message code="ref46"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_29_"></fra:richtextentry>
				</div>
				<div class="control pull-right"></div>
				<fra:feedback feedbackName="_feedback_29_"/>
				<br>
				<br>
			</div>
		</section>
		<section>
			<h3>
				3.3.2
				<spring:message code="ref107"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_30_"></fra:richtextentry>
				</div>
				<div class="control pull-right"></div>
				<fra:feedback feedbackName="_feedback_30_"/>
				<br>
				<br>
			</div>
		</section>
		<section>
			<h3>
				3.3.3
				<spring:message code="ref48"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_31_"></fra:richtextentry>
				</div>
				<div class="control pull-right"></div>
				<fra:feedback feedbackName="_feedback_31_"/>
				<br>
				<br>
			</div>
		</section>
	</section>
	<section>
		<h2>
			3.4
			<spring:message code="ref49"></spring:message>
		</h2>
		<div>
			<h4>
				<spring:message code="ref151"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<!--?xml version="1.0"?-->
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rowspan="3" colspan="2" rownumber="0" columnnumber="0"><spring:message
									code="ref152"></spring:message></td>
							<td colspan="11" rownumber="0" columnnumber="2"><spring:message
									code="ref153"></spring:message></td>
						</tr>
						<tr class="defhead">
							<td colspan="6" rownumber="1" columnnumber="0"><spring:message
									code="ref15"></spring:message></td>
							<td colspan="5" rownumber="1" columnnumber="1"><spring:message
									code="ref17"></spring:message></td>
						</tr>
						<tr class="defhead">
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref53"></spring:message></td>
							<td colspan="2" rownumber="2" columnnumber="1"><spring:message
									code="ref54"></spring:message></td>
							<td rownumber="2" columnnumber="2"><spring:message
									code="ref55"></spring:message></td>
							<td rownumber="2" columnnumber="3"><spring:message
									code="ref56"></spring:message></td>
							<td rownumber="2" columnnumber="4"><spring:message
									code="ref57"></spring:message></td>
							<td rownumber="2" columnnumber="5"><spring:message
									code="ref53"></spring:message></td>
							<td rownumber="2" columnnumber="6"><spring:message
									code="ref54"></spring:message></td>
							<td rownumber="2" columnnumber="7"><spring:message
									code="ref55"></spring:message></td>
							<td rownumber="2" columnnumber="8"><spring:message
									code="ref56"></spring:message></td>
							<td rownumber="2" columnnumber="9"><spring:message
									code="ref57"></spring:message></td>
						</tr>
						<tr rowname="3.1" unit="million m3">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="3" columnnumber="0"><spring:message
									code="ref154"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_3_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_3_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								colspan="2" rownumber="3" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_3_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_3_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_3_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_3_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_3_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_3_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="3" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_3_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_3_5_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_3_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_3_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_3_7_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_3_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_3_8_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_3_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_3_9_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_3_9_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="3" columnnumber="10"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_3_10_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_3_10_}</div></td>
						</tr>
						<tr rowname="3.1.1" unit="million m3">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="4" columnnumber="0"><spring:message
									code="ref155"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_4_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_4_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								colspan="2" rownumber="4" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_4_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_4_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_4_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_4_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_4_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_4_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="4" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_4_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_4_5_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_4_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_4_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_4_7_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_4_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_4_8_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_4_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_4_9_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_4_9_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="4" columnnumber="10"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_4_10_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_4_10_}</div></td>
						</tr>
						<tr rowname="3.1.2" unit="million m3">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="5" columnnumber="0"><spring:message
									code="ref156"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_5_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_5_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								colspan="2" rownumber="5" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_5_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_5_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_5_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_5_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_5_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_5_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="5" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_5_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_5_5_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_5_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_5_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_5_7_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_5_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_5_8_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_5_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_5_9_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_5_9_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="5" columnnumber="10"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_5_10_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_5_10_}</div></td>
						</tr>
						<tr rowname="3.2" unit="million m3">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="6" columnnumber="0"><spring:message
									code="ref157"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_6_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_6_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								colspan="2" rownumber="6" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_6_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_6_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_6_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_6_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_6_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_6_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="6" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_6_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_6_5_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_6_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_6_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_6_7_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_6_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_6_8_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_6_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_6_9_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_6_9_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="6" columnnumber="10"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_6_10_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_6_10_}</div></td>
						</tr>
						<tr rowname="3.2.1" unit="million m3">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="7" columnnumber="0"><spring:message
									code="ref155"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_7_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_7_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								colspan="2" rownumber="7" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_7_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_7_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_7_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_7_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_7_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_7_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="7" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_7_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_7_5_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_7_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_7_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_7_7_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_7_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_7_8_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_7_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_7_9_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_7_9_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="7" columnnumber="10"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_7_10_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_7_10_}</div></td>
						</tr>
						<tr rowname="3.2.2" unit="million m3">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="8" columnnumber="0"><spring:message
									code="ref156"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_8_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_8_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								colspan="2" rownumber="8" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_8_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_8_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_8_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_8_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_8_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_8_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="8" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_8_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_8_5_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_8_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_8_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_8_7_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_8_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_8_8_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_8_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_8_9_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_8_9_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="8" columnnumber="10"
								style="background-color: rgb(242, 245, 169);" entry-id="3a"><span class="entry_item_placeholder" id="_fraVariable_3a_8_10_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3a_8_10_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_3a_"/>
			<br>
			<br>
		</div>
		<div>
			<h4>
				<spring:message code="ref158"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<!--?xml version="1.0"?-->
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr class="defhead">
							<td colspan="3" rownumber="0" columnnumber="0"><spring:message
									code="ref159"></spring:message></td>
							<td colspan="4" rownumber="0" columnnumber="1"><spring:message
									code="ref160"></spring:message></td>
						</tr>
						<tr class="defhead">
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref161"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref162"></spring:message></td>
							<td rownumber="1" columnnumber="2"><spring:message
									code="ref163"></spring:message></td>
							<td rownumber="1" columnnumber="3"><spring:message
									code="ref53"></spring:message></td>
							<td rownumber="1" columnnumber="4"><spring:message
									code="ref54"></spring:message></td>
							<td rownumber="1" columnnumber="5"><spring:message
									code="ref55"></spring:message></td>
							<td rownumber="1" columnnumber="6"><spring:message
									code="ref56"></spring:message></td>
						</tr>
						<tr>
							<td class="title" rownumber="2" columnnumber="0"><spring:message
									code="ref164"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_2_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_2_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_2_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_2_2_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_2_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_2_3_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_2_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_2_4_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="5" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_2_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_2_5_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="6" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_2_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_2_6_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="3" columnnumber="0"><spring:message
									code="ref165"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_3_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_3_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_3_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_3_2_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_3_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_3_3_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_3_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_3_4_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="5" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_3_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_3_5_}</div></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="6" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_3_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_3_6_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="4" columnnumber="0"><spring:message
									code="ref166"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_4_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_4_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="4"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_4_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_4_2_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="4"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_4_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_4_3_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="4"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_4_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_4_4_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="4"
								columnnumber="5" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_4_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_4_5_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="6" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_4_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_4_6_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="5" columnnumber="0"><spring:message
									code="ref167"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="5"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_5_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_5_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="5"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_5_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_5_2_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="5"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_5_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_5_3_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="5"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_5_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_5_4_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="5"
								columnnumber="5" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_5_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_5_5_}</div></td>
							<td class="entry-item editable text" rownumber="5"
								columnnumber="6" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_5_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_5_6_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="6" columnnumber="0"><spring:message
									code="ref168"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="6"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_6_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_6_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="6"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_6_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_6_2_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="6"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_6_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_6_3_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="6"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_6_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_6_4_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="6"
								columnnumber="5" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_6_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_6_5_}</div></td>
							<td class="entry-item editable text" rownumber="6"
								columnnumber="6" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_6_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_6_6_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="7" columnnumber="0"><spring:message
									code="ref169"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="7"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_7_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_7_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="7"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_7_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_7_2_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="7"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_7_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_7_3_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="7"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_7_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_7_4_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="7"
								columnnumber="5" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_7_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_7_5_}</div></td>
							<td class="entry-item editable text" rownumber="7"
								columnnumber="6" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_7_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_7_6_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="8" columnnumber="0"><spring:message
									code="ref170"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="8"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_8_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_8_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="8"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_8_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_8_2_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="8"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_8_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_8_3_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="8"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_8_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_8_4_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="8"
								columnnumber="5" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_8_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_8_5_}</div></td>
							<td class="entry-item editable text" rownumber="8"
								columnnumber="6" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_8_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_8_6_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="9" columnnumber="0"><spring:message
									code="ref171"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="9"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_9_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_9_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="9"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_9_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_9_2_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="9"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_9_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_9_3_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="9"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_9_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_9_4_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="9"
								columnnumber="5" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_9_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_9_5_}</div></td>
							<td class="entry-item editable text" rownumber="9"
								columnnumber="6" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_9_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_9_6_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="10" columnnumber="0"><spring:message
									code="ref172"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="10"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_10_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_10_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="10"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_10_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_10_2_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="10"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_10_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_10_3_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="10"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_10_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_10_4_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="10"
								columnnumber="5" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_10_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_10_5_}</div></td>
							<td class="entry-item editable text" rownumber="10"
								columnnumber="6" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_10_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_10_6_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="11" columnnumber="0"><spring:message
									code="ref173"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="11"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_11_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_11_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="11"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_11_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_11_2_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="11"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_11_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_11_3_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="11"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_11_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_11_4_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="11"
								columnnumber="5" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_11_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_11_5_}</div></td>
							<td class="entry-item editable text" rownumber="11"
								columnnumber="6" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_11_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_11_6_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="12" columnnumber="0"><spring:message
									code="ref174"></spring:message></td>
							<td class="noneditable" rownumber="12"
								columnnumber="1" 
								entry-id="3b"></td>
							<td class="noneditable" rownumber="12"
								columnnumber="2"> </td>
							<td class="prefilled entry-item editable text" rownumber="12"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_12_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_12_3_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="12"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_12_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_12_4_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="12"
								columnnumber="5" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_12_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_12_5_}</div></td>
							<td class="entry-item editable text" rownumber="12"
								columnnumber="6" style="background-color: rgb(242, 245, 169);"
								entry-id="3b"><span class="entry_item_placeholder" id="_fraVariable_3b_12_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3b_12_6_}</div></td>
						</tr>
						<tr>
							<td rownumber="13" columnnumber="0"><spring:message
									code="ref63"></spring:message></td>
							<td class="noneditable" rownumber="13" columnnumber="1"></td>
							<td class="noneditable" rownumber="13" columnnumber="2"></td>
							<td class="total" rownumber="13" columnnumber="3"></td>
							<td class="total" rownumber="13" columnnumber="4"></td>
							<td class="total" rownumber="13" columnnumber="5"></td>
							<td class="total" rownumber="13" columnnumber="6"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_3b_"/>
			<br>
			<br>
		</div>
		<div>
			<div></div>
			<div class="entry">
				<p>
					<spring:message code="ref175"></spring:message>
				</p>
			</div>
			<div class="control pull-right"></div>
			<br>
			<br>
		</div>
		<div>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td><spring:message code="ref176"></spring:message></td>
							<td><spring:message code="ref177"></spring:message></td>
							<td><spring:message code="ref178"></spring:message></td>
						</tr>
						<tr>
							<td><spring:message code="ref179"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="33"><span class="entry_item_placeholder" id="_fraVariable_33_1_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_33_1_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="1"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="33"><span class="entry_item_placeholder" id="_fraVariable_33_1_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_33_1_2_}</div></td>
						</tr>
						<tr>
							<td><spring:message code="ref180"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="33"><span class="entry_item_placeholder" id="_fraVariable_33_2_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_33_2_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="33"><span class="entry_item_placeholder" id="_fraVariable_33_2_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_33_2_2_}</div></td>
						</tr>
						<tr>
							<td><spring:message code="ref181"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="33"><span class="entry_item_placeholder" id="_fraVariable_33_3_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_33_3_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="33"><span class="entry_item_placeholder" id="_fraVariable_33_3_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_33_3_2_}</div></td>
						</tr>
						<tr>
							<td><spring:message code="ref182"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="33"><span class="entry_item_placeholder" id="_fraVariable_33_4_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_33_4_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="4"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="33"><span class="entry_item_placeholder" id="_fraVariable_33_4_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_33_4_2_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_33_"/>
			<br>
			<br>
		</div>
		<div>
			<div></div>
			<div class="entry">
				<p>
					<spring:message code="ref183"></spring:message>
				</p>
			</div>
			<div class="control pull-right"></div>
			<br>
			<br>
		</div>
		<div>
			<h4>
				<spring:message code="ref184"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<!--?xml version="1.0"?-->
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td colspan="2" rowspan="3" rownumber="0" columnnumber="0"><spring:message code="ref152"></spring:message></td>
							<td colspan="6" rownumber="0" columnnumber="2"><spring:message code="ref185"></spring:message></td>
						</tr>
						<tr class="defhead">
							<td colspan="6" rownumber="1" columnnumber="0"><spring:message code="ref15"></spring:message></td>
						</tr>
						<tr class="defhead">
							<td colspan="2" rownumber="2" columnnumber="0"><spring:message
									code="ref53"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref54"></spring:message></td>
							<td rownumber="2" columnnumber="2"><spring:message
									code="ref55"></spring:message></td>
							<td rownumber="2" columnnumber="3"><spring:message
									code="ref56"></spring:message></td>
							<td rownumber="2" columnnumber="4"><spring:message
									code="ref57"></spring:message></td>
						</tr>
						<tr rowname="3.4" unit="m3/ha/yr">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="3" columnnumber="0"><spring:message
									code="ref186"></spring:message></td>
							<td columnname="1990" class="entry-item editable text"
								colspan="2" rownumber="3" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="3c"><span class="entry_item_placeholder" id="_fraVariable_3c_3_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3c_3_1_}</div></td>
							<td columnname="2000" class="entry-item editable text"
								rownumber="3" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="3c"><span class="entry_item_placeholder" id="_fraVariable_3c_3_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3c_3_2_}</div></td>
							<td columnname="2005" class="entry-item editable text"
								rownumber="3" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="3c"><span class="entry_item_placeholder" id="_fraVariable_3c_3_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3c_3_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="3" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="3c"><span class="entry_item_placeholder" id="_fraVariable_3c_3_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3c_3_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="3" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="3c"><span class="entry_item_placeholder" id="_fraVariable_3c_3_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3c_3_5_}</div></td>
						</tr>
						<tr rowname="3.4.1" unit="m3/ha/yr">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="4" columnnumber="0"><spring:message
									code="ref155"></spring:message></td>
							<td columnname="1990" class="entry-item editable text"
								colspan="2" rownumber="4" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="3c"><span class="entry_item_placeholder" id="_fraVariable_3c_4_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3c_4_1_}</div></td>
							<td columnname="2000" class="entry-item editable text"
								rownumber="4" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="3c"><span class="entry_item_placeholder" id="_fraVariable_3c_4_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3c_4_2_}</div></td>
							<td columnname="2005" class="entry-item editable text"
								rownumber="4" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="3c"><span class="entry_item_placeholder" id="_fraVariable_3c_4_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3c_4_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="4" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="3c"><span class="entry_item_placeholder" id="_fraVariable_3c_4_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3c_4_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="4" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="3c"><span class="entry_item_placeholder" id="_fraVariable_3c_4_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3c_4_5_}</div></td>
						</tr>
						<tr rowname="3.4.2" unit="m3/ha/yr">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="5" columnnumber="0"><spring:message
									code="ref156"></spring:message></td>
							<td columnname="1990" class="entry-item editable text"
								colspan="2" rownumber="5" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="3c"><span class="entry_item_placeholder" id="_fraVariable_3c_5_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3c_5_1_}</div></td>
							<td columnname="2000" class="entry-item editable text"
								rownumber="5" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="3c"><span class="entry_item_placeholder" id="_fraVariable_3c_5_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3c_5_2_}</div></td>
							<td columnname="2005" class="entry-item editable text"
								rownumber="5" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="3c"><span class="entry_item_placeholder" id="_fraVariable_3c_5_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3c_5_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="5" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="3c"><span class="entry_item_placeholder" id="_fraVariable_3c_5_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3c_5_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="5" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="3c"><span class="entry_item_placeholder" id="_fraVariable_3c_5_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3c_5_5_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_3c_"/>
			<br>
			<br>
		</div>
		<div>
			<h4>
				<spring:message code="ref187"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<!--?xml version="1.0"?-->
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td colspan="2" rowspan="3" rownumber="0" columnnumber="0"><spring:message
									code="ref152"></spring:message></td>
							
							<td colspan="10" rownumber="0" columnnumber="2"><spring:message
									code="ref188"></spring:message></td>
						</tr>
						<tr class="defhead">
							<td colspan="5" rownumber="1" columnnumber="0"><spring:message
									code="ref15"></spring:message></td>
							<td colspan="5" rownumber="1" columnnumber="1"><spring:message
									code="ref17"></spring:message></td>
						</tr>
						<tr class="defhead">
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref53"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref54"></spring:message></td>
							<td rownumber="2" columnnumber="2"><spring:message
									code="ref55"></spring:message></td>
							<td rownumber="2" columnnumber="3"><spring:message
									code="ref56"></spring:message></td>
							<td rownumber="2" columnnumber="4"><spring:message
									code="ref57"></spring:message></td>
							<td rownumber="2" columnnumber="5"><spring:message
									code="ref53"></spring:message></td>
							<td rownumber="2" columnnumber="6"><spring:message
									code="ref54"></spring:message></td>
							<td rownumber="2" columnnumber="7"><spring:message
									code="ref55"></spring:message></td>
							<td rownumber="2" columnnumber="8"><spring:message
									code="ref56"></spring:message></td>
							<td rownumber="2" columnnumber="9"><spring:message
									code="ref57"></spring:message></td>
						</tr>
						<tr rowname="3.5" unit="million tonnes">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="3" columnnumber="0"><spring:message
									code="ref189"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_3_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_3_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								 rownumber="3" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_3_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_3_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_3_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_3_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_3_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_3_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="3" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_3_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_3_5_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_3_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_3_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_3_7_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_3_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_3_8_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_3_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_3_9_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_3_9_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="3" columnnumber="10"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_3_10_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_3_10_}</div></td>
						</tr>
						<tr rowname="3.6" unit="million tonnes">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="4" columnnumber="0"><spring:message
									code="ref190"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_4_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_4_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_4_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_4_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_4_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_4_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_4_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_4_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="4" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_4_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_4_5_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_4_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_4_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_4_7_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_4_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_4_8_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_4_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_4_9_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_4_9_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="4" columnnumber="10"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_4_10_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_4_10_}</div></td>
						</tr>
						<tr rowname="3.7" unit="million tonnes">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="5" columnnumber="0"><spring:message
									code="ref139"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_5_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_5_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_5_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_5_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_5_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_5_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_5_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_5_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="5" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_5_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_5_5_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_5_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_5_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_5_7_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_5_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_5_8_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_5_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_5_9_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_5_9_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="5" columnnumber="10"
								style="background-color: rgb(242, 245, 169);" entry-id="3d"><span class="entry_item_placeholder" id="_fraVariable_3d_5_10_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3d_5_10_}</div></td>
						</tr>
						<tr>
							<td rownumber="6" colspan=2><spring:message
									code="ref63"></spring:message></td>
							
							
							<td class="total" rownumber="6" columnnumber="1"></td>
							<td class="total" rownumber="6" columnnumber="2"></td>
							<td class="total" rownumber="6" columnnumber="3"></td>
							<td class="total" rownumber="6" columnnumber="4"></td>
							<td class="total" rownumber="6" columnnumber="5"></td>
							<td class="total" rownumber="6" columnnumber="6"></td>
							<td class="total" rownumber="6" columnnumber="7"></td>
							<td class="total" rownumber="6" columnnumber="8"></td>
							<td class="total" rownumber="6" columnnumber="9"></td>
							<td class="total" rownumber="6" columnnumber="10"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_3d_"/>
			<br>
			<br>
		</div>
		<div>
			<h4>
				<spring:message code="ref191"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<!--?xml version="1.0"?-->
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr class="defhead">
							<td colspan="2" rowspan="3" rownumber="0" columnnumber="0"><spring:message
									code="ref192"></spring:message></td>
							<td colspan="10" rownumber="0" columnnumber="1"><spring:message
									code="ref193"></spring:message></td>
						</tr>
						<tr class="defhead">
							<td colspan="5" rownumber="1" columnnumber="0"><spring:message
									code="ref15"></spring:message></td>
							<td colspan="5" rownumber="1" columnnumber="1"><spring:message
									code="ref17"></spring:message></td>
						</tr>
						<tr class="defhead">
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref53"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref54"></spring:message></td>
							<td rownumber="2" columnnumber="2"><spring:message
									code="ref55"></spring:message></td>
							<td rownumber="2" columnnumber="3"><spring:message
									code="ref56"></spring:message></td>
							<td rownumber="2" columnnumber="4"><spring:message
									code="ref57"></spring:message></td>
							<td rownumber="2" columnnumber="5"><spring:message
									code="ref53"></spring:message></td>
							<td rownumber="2" columnnumber="6"><spring:message
									code="ref54"></spring:message></td>
							<td rownumber="2" columnnumber="7"><spring:message
									code="ref55"></spring:message></td>
							<td rownumber="2" columnnumber="8"><spring:message
									code="ref56"></spring:message></td>
							<td rownumber="2" columnnumber="9"><spring:message
									code="ref57"></spring:message></td>
						</tr>
						<tr rowname="3.8" unit="million tonnes">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="3" columnnumber="0"><spring:message
									code="ref194"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_3_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_3_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_3_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_3_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_3_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_3_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_3_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_3_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="3" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_3_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_3_5_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_3_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_3_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_3_7_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_3_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_3_8_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_3_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_3_9_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_3_9_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="3" columnnumber="10"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_3_10_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_3_10_}</div></td>
						</tr>
						<tr rowname="3.9" unit="million tonnes">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="4" columnnumber="0"><spring:message
									code="ref195"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_4_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_4_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_4_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_4_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_4_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_4_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_4_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_4_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="4" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_4_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_4_5_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_4_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_4_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_4_7_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_4_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_4_8_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_4_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="4" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_4_9_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_4_9_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="4" columnnumber="10"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_4_10_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_4_10_}</div></td>
						</tr>
						<tr>
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="5" columnnumber="0"><spring:message
									code="ref196"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_5_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_5_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_5_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_5_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_5_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_5_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_5_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_5_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="5" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_5_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_5_5_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_5_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_5_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_5_7_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_5_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_5_8_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_5_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="5" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_5_9_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_5_9_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="5" columnnumber="10"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_5_10_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_5_10_}</div></td>
						</tr>
						<tr rowname="3.10" unit="million tonnes">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="6" columnnumber="0"><spring:message
									code="ref145"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_6_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_6_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_6_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_6_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_6_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_6_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_6_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_6_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="6" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_6_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_6_5_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_6_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_6_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_6_7_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_6_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_6_8_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_6_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="6" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_6_9_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_6_9_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="6" columnnumber="10"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_6_10_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_6_10_}</div></td>
						</tr>
						<tr rowname="3.11" unit="million tonnes">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="7" columnnumber="0"><spring:message
									code="ref147"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_7_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_7_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_7_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_7_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_7_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_7_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_7_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_7_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="7" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_7_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_7_5_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_7_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_7_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_7_7_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_7_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_7_8_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_7_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="7" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_7_9_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_7_9_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="7" columnnumber="10"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_7_10_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_7_10_}</div></td>
						</tr>
						<tr>
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="8" columnnumber="0"><spring:message
									code="ref197"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_8_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_8_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_8_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_8_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_8_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_8_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_8_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_8_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="8" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_8_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_8_5_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_8_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_8_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_8_7_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_8_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_8_8_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_8_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="8" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_8_9_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_8_9_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="8" columnnumber="10"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_8_10_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_8_10_}</div></td>
						</tr>
						<tr rowname="3.12" unit="million tonnes">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="9" columnnumber="0"><spring:message
									code="ref149"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="9" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_9_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_9_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="9" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_9_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_9_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="9" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_9_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_9_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="9" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_9_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_9_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="9" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_9_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_9_5_}</div></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="9" columnnumber="6"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_9_6_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_9_6_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="9" columnnumber="7"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_9_7_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_9_7_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="9" columnnumber="8"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_9_8_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_9_8_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="9" columnnumber="9"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_9_9_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_9_9_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="9" columnnumber="10"
								style="background-color: rgb(242, 245, 169);" entry-id="3e"><span class="entry_item_placeholder" id="_fraVariable_3e_9_10_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_3e_9_10_}</div></td>
						</tr>
						<tr>
							<td rownumber="10" colspan=2 columnnumber="0"><spring:message
									code="ref63"></spring:message></td>
							
							<td class="total" rownumber="10" columnnumber="1"></td>
							<td class="total" rownumber="10" columnnumber="2"></td>
							<td class="total" rownumber="10" columnnumber="3"></td>
							<td class="total" rownumber="10" columnnumber="4"></td>
							<td class="total" rownumber="10" columnnumber="5"></td>
							<td class="total" rownumber="10" columnnumber="6"></td>
							<td class="total" rownumber="10" columnnumber="7"></td>
							<td class="total" rownumber="10" columnnumber="8"></td>
							<td class="total" rownumber="10" columnnumber="9"></td>
							<td class="total" rownumber="10" columnnumber="10"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_3e_"/>
			<br>
			<br>
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
									code="ref198"></spring:message></td>
							<td rownumber="0" columnnumber="1"><spring:message
									code="ref74"></spring:message></td>
							<td rownumber="0" columnnumber="2"><spring:message
									code="ref199"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref200"></spring:message></td>
							<td class="tier entry-item" rownumber="1" columnnumber="1"
								entry-id="35"><div id="cell-content">
									<fra:tiers name="_fraVariable_35_1_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="1" columnnumber="2"
								entry-id="35"><div id="cell-content">
									<fra:tiers name="_fraVariable_35_1_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref201"></spring:message></td>
							<td class="tier entry-item" rownumber="2" columnnumber="1"
								entry-id="35"><div id="cell-content">
									<fra:tiers name="_fraVariable_35_2_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="2" columnnumber="2"
								entry-id="35"><div id="cell-content">
									<fra:tiers name="_fraVariable_35_2_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref189"></spring:message></td>
							<td class="tier entry-item" rownumber="3" columnnumber="1"
								entry-id="35"><div id="cell-content">
									<fra:tiers name="_fraVariable_35_3_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="3" columnnumber="2"
								entry-id="35"><div id="cell-content">
									<fra:tiers name="_fraVariable_35_3_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref190"></spring:message></td>
							<td class="tier entry-item" rownumber="4" columnnumber="1"
								entry-id="35"><div id="cell-content">
									<fra:tiers name="_fraVariable_35_4_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="4" columnnumber="2"
								entry-id="35"><div id="cell-content">
									<fra:tiers name="_fraVariable_35_4_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="5" columnnumber="0"><spring:message
									code="ref139"></spring:message></td>
							<td class="tier entry-item" rownumber="5" columnnumber="1"
								entry-id="35"><div id="cell-content">
									<fra:tiers name="_fraVariable_35_5_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="5" columnnumber="2"
								entry-id="35"><div id="cell-content">
									<fra:tiers name="_fraVariable_35_5_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="6" columnnumber="0"><spring:message
									code="ref141"></spring:message></td>
							<td class="tier entry-item" rownumber="6" columnnumber="1"
								entry-id="35"><div id="cell-content">
									<fra:tiers name="_fraVariable_35_6_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="6" columnnumber="2"
								entry-id="35"><div id="cell-content">
									<fra:tiers name="_fraVariable_35_6_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="7" columnnumber="0"><spring:message
									code="ref195"></spring:message></td>
							<td class="tier entry-item" rownumber="7" columnnumber="1"
								entry-id="35"><div id="cell-content">
									<fra:tiers name="_fraVariable_35_7_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="7" columnnumber="2"
								entry-id="35"><div id="cell-content">
									<fra:tiers name="_fraVariable_35_7_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="8" columnnumber="0"><spring:message
									code="ref202"></spring:message></td>
							<td class="tier entry-item" rownumber="8" columnnumber="1"
								entry-id="35"><div id="cell-content">
									<fra:tiers name="_fraVariable_35_8_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="8" columnnumber="2"
								entry-id="35"><div id="cell-content">
									<fra:tiers name="_fraVariable_35_8_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="9" columnnumber="0"><spring:message
									code="ref149"></spring:message></td>
							<td class="tier entry-item" rownumber="9" columnnumber="1"
								entry-id="35"><div id="cell-content">
									<fra:tiers name="_fraVariable_35_9_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="9" columnnumber="2"
								entry-id="35"><div id="cell-content">
									<fra:tiers name="_fraVariable_35_9_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_35_"/>
			<br>
			<br>
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
									code="ref200"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref203"></spring:message></td>
							<td rownumber="1" columnnumber="2"><spring:message
									code="ref204"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref201"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref205"></spring:message></td>
							<td rownumber="2" columnnumber="2"><spring:message
									code="ref206"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref207"></spring:message></td>
							<td rownumber="3" columnnumber="1"><spring:message
									code="ref208"></spring:message></td>
							<td rownumber="3" columnnumber="2"><spring:message
									code="ref79"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref209"></spring:message></td>
							<td rownumber="4" columnnumber="1"><spring:message
									code="ref210"></spring:message></td>
							<td rownumber="4" columnnumber="2"><spring:message
									code="ref79"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<br>
			<br>
		</div>
	</section>
	<section>
		<h2>
			3.5
			<spring:message code="ref211"></spring:message>
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
									code="ref212"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref200"></spring:message></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_1_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_1_1_}</div></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_1_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_1_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref213"></spring:message></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_2_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_2_1_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_2_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_2_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref214"></spring:message></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_3_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_3_1_}</div></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_3_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_3_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref201"></spring:message></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_4_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_4_1_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_4_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_4_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="5" columnnumber="0"><spring:message
									code="ref135"></spring:message></td>
							<td class="entry-item editable text" rownumber="5"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_5_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_5_1_}</div></td>
							<td class="entry-item editable text" rownumber="5"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_5_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_5_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="6" columnnumber="0"><spring:message
									code="ref137"></spring:message></td>
							<td class="entry-item editable text" rownumber="6"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_6_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_6_1_}</div></td>
							<td class="entry-item editable text" rownumber="6"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_6_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_6_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="7" columnnumber="0"><spring:message
									code="ref139"></spring:message></td>
							<td class="entry-item editable text" rownumber="7"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_7_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_7_1_}</div></td>
							<td class="entry-item editable text" rownumber="7"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_7_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_7_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="8" columnnumber="0"><spring:message
									code="ref141"></spring:message></td>
							<td class="entry-item editable text" rownumber="8"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_8_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_8_1_}</div></td>
							<td class="entry-item editable text" rownumber="8"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_8_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_8_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="9" columnnumber="0"><spring:message
									code="ref143"></spring:message></td>
							<td class="entry-item editable text" rownumber="9"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_9_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_9_1_}</div></td>
							<td class="entry-item editable text" rownumber="9"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_9_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_9_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="10" columnnumber="0"><spring:message
									code="ref145"></spring:message></td>
							<td class="entry-item editable text" rownumber="10"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_10_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_10_1_}</div></td>
							<td class="entry-item editable text" rownumber="10"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_10_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_10_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="11" columnnumber="0"><spring:message
									code="ref147"></spring:message></td>
							<td class="entry-item editable text" rownumber="11"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_11_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_11_1_}</div></td>
							<td class="entry-item editable text" rownumber="11"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_11_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_11_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="12" columnnumber="0"><spring:message
									code="ref149"></spring:message></td>
							<td class="entry-item editable text" rownumber="12"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_12_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_12_1_}</div></td>
							<td class="entry-item editable text" rownumber="12"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="37"><span class="entry_item_placeholder" id="_fraVariable_37_12_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_37_12_2_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_37_"/>
			<br>
			<br>
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
								entry-id="38"><span class="entry_item_placeholder" id="_fraVariable_38_1_0_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_38_1_0_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_38_"/>
			<br>
			<br>
		</div>
	</section>
</section>