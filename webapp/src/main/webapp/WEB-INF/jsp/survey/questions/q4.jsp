<%@ include file="../../common/includes/taglibs.jsp"%>
<section>
	<div class="page-header">
		<h1>
			4.
			<spring:message code="ref215"></spring:message>
		</h1>
	</div>
	<section>
		<h2>
			4.1
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
									code="ref90"></spring:message></td>
							<td rownumber="0" columnnumber="1"><spring:message
									code="ref14"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref216"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref217"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref13"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref14"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref218"></spring:message></td>
							<td rownumber="3" columnnumber="1"><spring:message
									code="ref219"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref220"></spring:message></td>
							<td rownumber="4" columnnumber="1"><spring:message
									code="ref221"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="5" columnnumber="0"><spring:message
									code="ref222"></spring:message></td>
							<td rownumber="5" columnnumber="1"><spring:message
									code="ref223"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="6" columnnumber="0"><spring:message
									code="ref224"></spring:message></td>
							<td rownumber="6" columnnumber="1"><spring:message
									code="ref225"></spring:message></td>
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
			4.2
			<spring:message code="ref33"></spring:message>
		</h2>
		<section>
			<h3>
				4.2.1
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
							
							<fra:DynamicTableTag numOfColoumn="4" entryItemName="40" numericColoumn="true"/>
							
						</tbody>
					</table>
				</div>
				<div class="control pull-right">
					<c:if test="${profile == 'CONTRIBUTOR'}">
						<a  href="#" class="btn btn-mini addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_40_"/>
				<br>
				<br>
			</div>
		</section>
		<section>
			<h3>
				4.2.2
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
							
							<fra:DynamicTableTag numOfColoumn="2" entryItemName="41" numericColoumn="false"/>
							
						</tbody>
					</table>
				</div>
				<div class="control pull-right">
					<c:if test="${profile == 'CONTRIBUTOR'}">
						<a  href="#" class="btn btn-mini addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_41_"/>
				<br>
				<br>
			</div>
		</section>
		<section>
			<h3>
				4.2.3
				<spring:message code="ref44"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_42_"></fra:richtextentry>
				</div>
				<div class="control pull-right"></div>
				<fra:feedback feedbackName="_feedback_42_"/>
				<br>
				<br>
			</div>
		</section>
	</section>
	<section>
		<h2>
			4.3
			<spring:message code="ref45"></spring:message>
		</h2>
		<section>
			<h3>
				4.3.1
				<spring:message code="ref46"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_43_"></fra:richtextentry>
				</div>
				<div class="control pull-right"></div>
				<fra:feedback feedbackName="_feedback_43_"/>
				<br>
				<br>
			</div>
		</section>
		<section>
			<h3>
				4.3.2
				<spring:message code="ref47"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_44_"></fra:richtextentry>
				</div>
				<div class="control pull-right"></div>
				<fra:feedback feedbackName="_feedback_44_"/>
				<br>
				<br>
			</div>
		</section>
		<section>
			<h3>
				4.3.3
				<spring:message code="ref48"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_45_"></fra:richtextentry>
				</div>
				<div class="control pull-right"></div>
				<fra:feedback feedbackName="_feedback_45_"/>
				<br>
				<br>
			</div>
		</section>
	</section>
	<section>
		<h2>
			4.4
			<spring:message code="ref49"></spring:message>
		</h2>
		<div>
			<h4>
				<spring:message code="ref226"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<!--?xml version="1.0"?-->
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td colspan="2" rowspan="2" rownumber="0" columnnumber="0"><spring:message
									code="ref65"></spring:message></td>
							<td colspan="5" rownumber="0" columnnumber="1"><spring:message
									code="ref109"></spring:message></td>
						</tr>
						<tr>
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
						<tr rowname="4.1" unit="1000 ha">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="2" columnnumber="0"><spring:message
									code="ref218"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="4a"><span class="entry_item_placeholder" id="_fraVariable_4a_2_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4a_2_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="4a"><span class="entry_item_placeholder" id="_fraVariable_4a_2_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4a_2_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="4a"><span class="entry_item_placeholder" id="_fraVariable_4a_2_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4a_2_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="4a"><span class="entry_item_placeholder" id="_fraVariable_4a_2_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4a_2_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="2" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="4a"><span class="entry_item_placeholder" id="_fraVariable_4a_2_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4a_2_5_}</div></td>
						</tr>
						<tr rowname="4.2" unit="1000 ha">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="3" columnnumber="0"><spring:message
									code="ref220"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="4a"><span class="entry_item_placeholder" id="_fraVariable_4a_3_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4a_3_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="4a"><span class="entry_item_placeholder" id="_fraVariable_4a_3_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4a_3_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="4a"><span class="entry_item_placeholder" id="_fraVariable_4a_3_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4a_3_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="3" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="4a"><span class="entry_item_placeholder" id="_fraVariable_4a_3_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4a_3_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="3" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="4a"><span class="entry_item_placeholder" id="_fraVariable_4a_3_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4a_3_5_}</div></td>
						</tr>
						<tr rowname="4.2" unit="1000 ha">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="4" columnnumber="0"><spring:message
									code="ref222"></spring:message></td>
							<td columnname="1990" class="entry-item editable text"
								rownumber="4" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="4a"><span class="entry_item_placeholder" id="_fraVariable_4a_4_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4a_4_1_}</div></td>
							<td columnname="2000" class="entry-item editable text"
								rownumber="4" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="4a"><span class="entry_item_placeholder" id="_fraVariable_4a_4_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4a_4_2_}</div></td>
							<td columnname="2005" class="entry-item editable text"
								rownumber="4" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="4a"><span class="entry_item_placeholder" id="_fraVariable_4a_4_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4a_4_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="4" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="4a"><span class="entry_item_placeholder" id="_fraVariable_4a_4_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4a_4_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="4" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="4a"><span class="entry_item_placeholder" id="_fraVariable_4a_4_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4a_4_5_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_4a_"/>
			<br>
			<br>
		</div>
		<div>
			<h4>
				<spring:message code="ref227"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<!--?xml version="1.0"?-->
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rownumber="0" columnnumber="0"><spring:message
									code="ref228"></spring:message></td>
							<td rownumber="0" columnnumber="1"><spring:message
									code="ref229"></spring:message></td>
							<td rownumber="0" columnnumber="2"><spring:message
									code="ref230"></spring:message></td>
							<td rownumber="0" columnnumber="3"><spring:message
									code="ref231"></spring:message></td>
							<td rownumber="0" columnnumber="4"><spring:message
									code="ref232"></spring:message></td>
						</tr>
						<tr>
							<td class="title" rownumber="2" columnnumber="0"><spring:message
									code="ref164"></spring:message></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_2_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_2_1_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_2_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_2_2_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_2_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_2_3_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_2_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_2_4_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="3" columnnumber="0"><spring:message
									code="ref165"></spring:message></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_3_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_3_1_}</div></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_3_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_3_2_}</div></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_3_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_3_3_}</div></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_3_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_3_4_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="4" columnnumber="0"><spring:message
									code="ref166"></spring:message></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_4_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_4_1_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_4_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_4_2_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_4_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_4_3_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_4_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_4_4_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="5" columnnumber="0"><spring:message
									code="ref167"></spring:message></td>
							<td class="entry-item editable text" rownumber="5"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_5_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_5_1_}</div></td>
							<td class="entry-item editable text" rownumber="5"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_5_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_5_2_}</div></td>
							<td class="entry-item editable text" rownumber="5"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_5_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_5_3_}</div></td>
							<td class="entry-item editable text" rownumber="5"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_5_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_5_4_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="6" columnnumber="0"><spring:message
									code="ref168"></spring:message></td>
							<td class="entry-item editable text" rownumber="6"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_6_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_6_1_}</div></td>
							<td class="entry-item editable text" rownumber="6"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_6_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_6_2_}</div></td>
							<td class="entry-item editable text" rownumber="6"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_6_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_6_3_}</div></td>
							<td class="entry-item editable text" rownumber="6"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_6_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_6_4_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="7" columnnumber="0"><spring:message
									code="ref169"></spring:message></td>
							<td class="entry-item editable text" rownumber="7"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_7_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_7_1_}</div></td>
							<td class="entry-item editable text" rownumber="7"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_7_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_7_2_}</div></td>
							<td class="entry-item editable text" rownumber="7"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_7_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_7_3_}</div></td>
							<td class="entry-item editable text" rownumber="7"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_7_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_7_4_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="8" columnnumber="0"><spring:message
									code="ref170"></spring:message></td>
							<td class="entry-item editable text" rownumber="8"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_8_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_8_1_}</div></td>
							<td class="entry-item editable text" rownumber="8"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_8_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_8_2_}</div></td>
							<td class="entry-item editable text" rownumber="8"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_8_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_8_3_}</div></td>
							<td class="entry-item editable text" rownumber="8"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_8_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_8_4_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="9" columnnumber="0"><spring:message
									code="ref171"></spring:message></td>
							<td class="entry-item editable text" rownumber="9"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_9_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_9_1_}</div></td>
							<td class="entry-item editable text" rownumber="9"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_9_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_9_2_}</div></td>
							<td class="entry-item editable text" rownumber="9"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_9_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_9_3_}</div></td>
							<td class="entry-item editable text" rownumber="9"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_9_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_9_4_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="10" columnnumber="0"><spring:message
									code="ref172"></spring:message></td>
							<td class="entry-item editable text" rownumber="10"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_10_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_10_1_}</div></td>
							<td class="entry-item editable text" rownumber="10"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_10_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_10_2_}</div></td>
							<td class="entry-item editable text" rownumber="10"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_10_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_10_3_}</div></td>
							<td class="entry-item editable text" rownumber="10"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_10_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_10_4_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="11" columnnumber="0"><spring:message
									code="ref173"></spring:message></td>
							<td class="entry-item editable text" rownumber="11"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_11_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_11_1_}</div></td>
							<td class="entry-item editable text" rownumber="11"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_11_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_11_2_}</div></td>
							<td class="entry-item editable text" rownumber="11"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_11_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_11_3_}</div></td>
							<td class="entry-item editable text" rownumber="11"
								columnnumber="4" style="background-color: rgb(242, 245, 169);"
								entry-id="4b"><span class="entry_item_placeholder" id="_fraVariable_4b_11_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_4b_11_4_}</div></td>
						</tr>
						<tr>
							<td colspan="2" rownumber="12" columnnumber="0"><spring:message
									code="ref63"></spring:message></td>
							<td class="noneditable" rownumber="12" columnnumber="1"></td>
							<td rownumber="12" columnnumber="2"></td>
							<td class="noneditable" rownumber="12" columnnumber="3"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_4b_"/>
			<br>
			<br>
		</div>
		<div>
			<h4>
				<spring:message code="ref227"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td colspan="2"><spring:message code="ref56"></spring:message></td>
						</tr>
						<tr>
							<td><spring:message code="ref233"></spring:message></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="46"><span class="entry_item_placeholder" id="_fraVariable_46_1_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_46_1_1_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_46_"/>
			<br>
			<br>
		</div>
		<div>
			<div></div>
			<div class="entry">
				<table
					class="table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rownumber="0" columnnumber="0"><spring:message
									code="ref13"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref234"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref235"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref236"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref237"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="5" columnnumber="0"><spring:message
									code="ref238"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="6" columnnumber="0"><spring:message
									code="ref239"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="7" columnnumber="0"><spring:message
									code="ref240"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="8" columnnumber="0"><spring:message
									code="ref241"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="9" columnnumber="0"><spring:message
									code="ref242"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="11" columnnumber="0"><spring:message
									code="ref243"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="12" columnnumber="0"><spring:message
									code="ref244"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="13" columnnumber="0"><spring:message
									code="ref245"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="14" columnnumber="0"><spring:message
									code="ref246"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="15" columnnumber="0"><spring:message
									code="ref247"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="16" columnnumber="0"><spring:message
									code="ref248"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="17" columnnumber="0"><spring:message
									code="ref249"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="18" columnnumber="0"><spring:message
									code="ref250"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="19" columnnumber="0"><spring:message
									code="ref251"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
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
									code="ref13"></spring:message></td>
							<td rownumber="0" columnnumber="1"><spring:message
									code="ref74"></spring:message></td>
							<td rownumber="0" columnnumber="2"><spring:message
									code="ref75"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref218"></spring:message></td>
							<td class="tier entry-item" rownumber="1" columnnumber="1"
								entry-id="48"><div id="cell-content">
									<fra:tiers name="_fraVariable_48_1_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="1" columnnumber="2"
								entry-id="48"><div id="cell-content">
									<fra:tiers name="_fraVariable_48_1_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref220"></spring:message></td>
							<td class="tier entry-item" rownumber="2" columnnumber="1"
								entry-id="48"><div id="cell-content">
									<fra:tiers name="_fraVariable_48_2_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="2" columnnumber="2"
								entry-id="48"><div id="cell-content">
									<fra:tiers name="_fraVariable_48_2_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref222"></spring:message></td>
							<td class="tier entry-item" rownumber="3" columnnumber="1"
								entry-id="48"><div id="cell-content">
									<fra:tiers name="_fraVariable_48_3_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="3" columnnumber="2"
								entry-id="48"><div id="cell-content">
									<fra:tiers name="_fraVariable_48_3_2_"><option
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
			<fra:feedback feedbackName="_feedback_48_"/>
			<br>
			<br>
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
									code="ref252"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref253"></spring:message></td>
							<td rownumber="1" columnnumber="2"><spring:message
									code="ref79"></spring:message></td>
						</tr>
						<tr>
							<td><spring:message code="ref254"></spring:message></td>
							<td><spring:message code="ref255"></spring:message></td>
							<td class="noneditable"></td>
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
			4.5
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
									code="ref212"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref218"></spring:message></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="50"><span class="entry_item_placeholder" id="_fraVariable_50_1_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_50_1_1_}</div></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="50"><span class="entry_item_placeholder" id="_fraVariable_50_1_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_50_1_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref256"></spring:message></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="50"><span class="entry_item_placeholder" id="_fraVariable_50_2_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_50_2_1_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="50"><span class="entry_item_placeholder" id="_fraVariable_50_2_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_50_2_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref222"></spring:message></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="50"><span class="entry_item_placeholder" id="_fraVariable_50_3_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_50_3_1_}</div></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="50"><span class="entry_item_placeholder" id="_fraVariable_50_3_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_50_3_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref257"></spring:message></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="50"><span class="entry_item_placeholder" id="_fraVariable_50_4_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_50_4_1_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="50"><span class="entry_item_placeholder" id="_fraVariable_50_4_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_50_4_2_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_50_"/>
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
								entry-id="51"><span class="entry_item_placeholder" id="_fraVariable_51_1_0_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_51_1_0_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_51_"/>
			<br>
			<br>
		</div>
	</section>
</section>