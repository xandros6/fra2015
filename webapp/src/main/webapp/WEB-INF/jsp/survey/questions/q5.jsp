<%@ include file="../../common/includes/taglibs.jsp"%>
<section>
	<div class="page-header">
		<h1>
			5.
			<spring:message code="ref259"></spring:message>
		</h1>
	</div>
	<p class="lead">
		<spring:message code="refq5faq"></spring:message>
	</p>
	<section>
		<h2>
			5.1
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
									code="ref260"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref261"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref262"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref263"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref264"></spring:message></td>
							<td rownumber="3" columnnumber="1"><spring:message
									code="ref265"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref266"></spring:message></td>
							<td rownumber="4" columnnumber="1"><spring:message
									code="ref267"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="5" columnnumber="0"><spring:message
									code="ref268"></spring:message></td>
							<td rownumber="5" columnnumber="1"><spring:message
									code="ref269"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="6" columnnumber="0"><spring:message
									code="ref270"></spring:message></td>
							<td rownumber="6" columnnumber="1"><spring:message
									code="ref271"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="7" columnnumber="0"><spring:message
									code="ref272"></spring:message></td>
							<td rownumber="7" columnnumber="1"><spring:message
									code="ref273"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref274"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref275"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref276"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref277"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref278"></spring:message></td>
							<td rownumber="3" columnnumber="1"><spring:message
									code="ref279"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref280"></spring:message></td>
							<td rownumber="4" columnnumber="1"><spring:message
									code="ref281"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="5" columnnumber="0"><spring:message
									code="ref272"></spring:message></td>
							<td rownumber="5" columnnumber="1"><spring:message
									code="ref282"></spring:message></td>
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
			5.2
			<spring:message code="ref33"></spring:message>
		</h2>
		<section>
			<h3>
				5.2.1
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
							
							<fra:DynamicTableTag numOfColoumn="4" entryItemName="53" numericColoumn="true"/>
							
						</tbody>
					</table>
				</div>
				<div class="control pull-right">
					<c:if test="${profile == 'CONTRIBUTOR'}">
						<a  href="#" class="btn btn-mini addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_53_"/>
				<br>
				<br>
			</div>
		</section>
		<section>
			<h3>
				5.2.2
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
							
							<fra:DynamicTableTag numOfColoumn="2" entryItemName="54" numericColoumn="false"/>	
							
						</tbody>
					</table>
				</div>
				<div class="control pull-right">
					<c:if test="${profile == 'CONTRIBUTOR'}">
						<a  href="#" class="btn btn-mini addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_54_"/>
				<br>
				<br>
			</div>
		</section>
		<section>
			<h3>
				5.2.3
				<spring:message code="ref44"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_55_"></fra:richtextentry>
				</div>
				<div class="control pull-right"></div>
				<fra:feedback feedbackName="_feedback_55_"/>
				<br>
				<br>
			</div>
		</section>
	</section>
	<section>
		<h2>
			5.3
			<spring:message code="ref45"></spring:message>
		</h2>
		<section>
			<h3>
				5.3.1
				<spring:message code="ref46"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_56_"></fra:richtextentry>
				</div>
				<div class="control pull-right"></div>
				<fra:feedback feedbackName="_feedback_56_"/>
				<br>
				<br>
			</div>
		</section>
		<section>
			<h3>
				5.3.2
				<spring:message code="ref47"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_57_"></fra:richtextentry>
				</div>
				<div class="control pull-right"></div>
				<fra:feedback feedbackName="_feedback_57_"/>
				<br>
				<br>
			</div>
		</section>
		<section>
			<h3>
				5.3.3
				<spring:message code="ref48"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_58_"></fra:richtextentry>
				</div>
				<div class="control pull-right"></div>
				<fra:feedback feedbackName="_feedback_58_"/>
				<br>
				<br>
			</div>
		</section>
	</section>
	<section>
		<h2>
			5.4
			<spring:message code="ref49"></spring:message>
		</h2>
		<div>
			<h4>
				<spring:message code="ref283"></spring:message>
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
							<td rownumber="1" columnnumber="4"><spring:message
									code="ref57"></spring:message></td>
						</tr>
						<tr rowname="5.1" unit="1000 ha">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="2" columnnumber="0"><spring:message
									code="ref285_t5a"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_2_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_2_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_2_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_2_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_2_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_2_3_}</div></td>
							<td columnname="2010" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_2_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_2_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="2" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_2_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_2_5_}</div></td>
						</tr>
						<tr rowname="5.1.1" unit="1000 ha">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="3" columnnumber="0"><spring:message
									code="ref286"></spring:message></td>
							<td columnname="1990" class="entry-item editable text"
								rownumber="3" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_3_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_3_1_}</div></td>
							<td columnname="2000" class="entry-item editable text"
								rownumber="3" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_3_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_3_2_}</div></td>
							<td columnname="2005" class="entry-item editable text"
								rownumber="3" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_3_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_3_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="3" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_3_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_3_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="3" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_3_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_3_5_}</div></td>
						</tr>
						<tr rowname="5.1.2" unit="1000 ha">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="4" columnnumber="0"><spring:message
									code="ref287"></spring:message></td>
							<td columnname="1990" class="entry-item editable text"
								rownumber="4" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_4_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_4_1_}</div></td>
							<td columnname="2000" class="entry-item editable text"
								rownumber="4" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_4_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_4_2_}</div></td>
							<td columnname="2005" class="entry-item editable text"
								rownumber="4" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_4_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_4_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="4" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_4_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_4_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="4" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_4_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_4_5_}</div></td>
						</tr>
						<tr rowname="5.1.3" unit="1000 ha">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="5" columnnumber="0"><spring:message
									code="ref288"></spring:message></td>
							<td columnname="1990" class="entry-item editable text"
								rownumber="5" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_5_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_5_1_}</div></td>
							<td columnname="2000" class="entry-item editable text"
								rownumber="5" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_5_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_5_2_}</div></td>
							<td columnname="2005" class="entry-item editable text"
								rownumber="5" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_5_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_5_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="5" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_5_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_5_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="5" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_5_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_5_5_}</div></td>
						</tr>
						<tr rowname="5.1.4" unit="1000 ha">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="6" columnnumber="0"><spring:message
									code="ref289"></spring:message></td>
							<td columnname="1990" class="entry-item editable text"
								rownumber="6" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_6_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_6_1_}</div></td>
							<td columnname="2000" class="entry-item editable text"
								rownumber="6" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_6_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_6_2_}</div></td>
							<td columnname="2005" class="entry-item editable text"
								rownumber="6" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_6_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_6_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="6" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_6_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_6_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="6" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_6_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_6_5_}</div></td>
						</tr>
						<tr rowname="5.1.5" unit="1000 ha">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="7" columnnumber="0"><spring:message
									code="ref290"></spring:message></td>
							<td columnname="1990" class="entry-item editable text"
								rownumber="7" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_7_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_7_1_}</div></td>
							<td columnname="2000" class="entry-item editable text"
								rownumber="7" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_7_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_7_2_}</div></td>
							<td columnname="2005" class="entry-item editable text"
								rownumber="7" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_7_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_7_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="7" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_7_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_7_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="7" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_7_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_7_5_}</div></td>
						</tr>
						<tr rowname="5.1.6" unit="1000 ha">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="8" columnnumber="0"><spring:message
									code="ref291"></spring:message></td>
							<td columnname="1990" class="entry-item editable text"
								rownumber="8" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_8_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_8_1_}</div></td>
							<td columnname="2000" class="entry-item editable text"
								rownumber="8" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_8_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_8_2_}</div></td>
							<td columnname="2005" class="entry-item editable text"
								rownumber="8" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_8_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_8_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="8" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_8_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_8_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="8" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="5a"><span class="entry_item_placeholder" id="_fraVariable_5a_8_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5a_8_5_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_5a_"/>
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
									code="ref292"></spring:message></td>
						</tr>
						<tr>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="59"><span class="entry_item_placeholder" id="_fraVariable_59_1_0_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_59_1_0_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_59_"/>
			<br>
			<br>
		</div>
		<div>
			<h4>
				<spring:message code="ref293"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rowspan="2" rownumber="0" columnnumber="0"><spring:message
									code="ref65"></spring:message></td>
							<td colspan="5" rownumber="0" columnnumber="1"><spring:message
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
							<td rownumber="1" columnnumber="4"><spring:message
									code="ref57"></spring:message></td>
						</tr>
						<tr rowname="5.2" unit="1000 ha">
							<td class="title" rownumber="2" columnnumber="0"><spring:message
									code="ref274"></spring:message></td>
							<td columnname="1990" class="entry-item editable text"
								rownumber="2" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_2_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_2_1_}</div></td>
							<td columnname="2000" class="entry-item editable text"
								rownumber="2" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_2_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_2_2_}</div></td>
							<td columnname="2005" class="entry-item editable text"
								rownumber="2" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_2_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_2_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="2" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_2_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_2_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="2" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_2_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_2_5_}</div></td>
						</tr>
						<tr rowname="5.2.1" unit="1000 ha">
							<td class="title" rownumber="3" columnnumber="0"><spring:message
									code="ref276x"></spring:message></td>
							<td columnname="1990" class="entry-item editable text"
								rownumber="3" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_3_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_3_1_}</div></td>
							<td columnname="2000" class="entry-item editable text"
								rownumber="3" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_3_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_3_2_}</div></td>
							<td columnname="2005" class="entry-item editable text"
								rownumber="3" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_3_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_3_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="3" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_3_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_3_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="3" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_3_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_3_5_}</div></td>
						</tr>
						<tr rowname="5.2.2" unit="1000 ha">
							<td class="title" rownumber="4" columnnumber="0"><spring:message
									code="ref278x"></spring:message></td>
							<td columnname="1990" class="entry-item editable text"
								rownumber="4" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_4_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_4_1_}</div></td>
							<td columnname="2000" class="entry-item editable text"
								rownumber="4" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_4_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_4_2_}</div></td>
							<td columnname="2005" class="entry-item editable text"
								rownumber="4" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_4_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_4_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="4" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_4_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_4_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="4" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_4_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_4_5_}</div></td>
						</tr>
						<tr rowname="5.2.3" unit="1000 ha">
							<td class="title" rownumber="5" columnnumber="0"><spring:message
									code="ref280x"></spring:message></td>
							<td columnname="1990" class="entry-item editable text"
								rownumber="5" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_5_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_5_1_}</div></td>
							<td columnname="2000" class="entry-item editable text"
								rownumber="5" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_5_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_5_2_}</div></td>
							<td columnname="2005" class="entry-item editable text"
								rownumber="5" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_5_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_5_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="5" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_5_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_5_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="5" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_5_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_5_5_}</div></td>
						</tr>
						<tr rowname="5.2.4" unit="1000 ha">
							<td class="title" rownumber="6" columnnumber="0"><spring:message
									code="ref294"></spring:message></td>
							<td columnname="1990" class="entry-item editable text"
								rownumber="6" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_6_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_6_1_}</div></td>
							<td columnname="2000" class="entry-item editable text"
								rownumber="6" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_6_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_6_2_}</div></td>
							<td columnname="2005" class="entry-item editable text"
								rownumber="6" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_6_3_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_6_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="6" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_6_4_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_6_4_}</div></td>
							<td columnname="2015" class="entry-item editable text"
								rownumber="6" columnnumber="5"
								style="background-color: rgb(242, 245, 169);" entry-id="5b"><span class="entry_item_placeholder" id="_fraVariable_5b_6_5_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_5b_6_5_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_5b_"/>
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
									code="ref75"></spring:message></td>
							<td rownumber="0" columnnumber="2"><spring:message
									code="ref74"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref285"></spring:message></td>
							<td class="tier entry-item" rownumber="1" columnnumber="1"
								entry-id="60"><div id="cell-content">
									<fra:tiers name="_fraVariable_60_1_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="1" columnnumber="2"
								entry-id="60"><div id="cell-content">
									<fra:tiers name="_fraVariable_60_1_2_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref295"></spring:message></td>
							<td class="tier entry-item" rownumber="2" columnnumber="1"
								entry-id="60"><div id="cell-content">
									<fra:tiers name="_fraVariable_60_2_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
							<td class="tier entry-item" rownumber="2" columnnumber="2"
								entry-id="60"><div id="cell-content">
									<fra:tiers name="_fraVariable_60_2_2_"><option
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
			<fra:feedback feedbackName="_feedback_60_"/>
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
									code="ref285"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref296"></spring:message></td>
							<td rownumber="1" columnnumber="2"><spring:message
									code="ref79"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref297"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref298"></spring:message></td>
							<td rownumber="1" columnnumber="2"><spring:message
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
			5.5
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
									code="ref285"></spring:message></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_1_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_1_1_}</div></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_1_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_1_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref299"></spring:message></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_2_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_2_1_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_2_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_2_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref300"></spring:message></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_3_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_3_1_}</div></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_3_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_3_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref301"></spring:message></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_4_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_4_1_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_4_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_4_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="5" columnnumber="0"><spring:message
									code="ref302"></spring:message></td>
							<td class="entry-item editable text" rownumber="5"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_5_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_5_1_}</div></td>
							<td class="entry-item editable text" rownumber="5"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_5_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_5_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="6" columnnumber="0"><spring:message
									code="ref303"></spring:message></td>
							<td class="entry-item editable text" rownumber="6"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_6_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_6_1_}</div></td>
							<td class="entry-item editable text" rownumber="6"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_6_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_6_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="7" columnnumber="0"><spring:message
									code="ref304"></spring:message></td>
							<td class="entry-item editable text" rownumber="7"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_7_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_7_1_}</div></td>
							<td class="entry-item editable text" rownumber="7"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_7_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_7_2_}</div></td>
						</tr>

						<tr>
							<td rownumber="8" columnnumber="0"><spring:message
									code="ref274"></spring:message></td>
							<td class="entry-item editable text" rownumber="8"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_8_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_8_1_}</div></td>
							<td class="entry-item editable text" rownumber="8"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_8_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_8_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="9" columnnumber="0"><spring:message
									code="ref305"></spring:message></td>
							<td class="entry-item editable text" rownumber="9"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_9_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_9_1_}</div></td>
							<td class="entry-item editable text" rownumber="9"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_9_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_9_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="10" columnnumber="0"><spring:message
									code="ref306"></spring:message></td>
							<td class="entry-item editable text" rownumber="10"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_10_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_10_1_}</div></td>
							<td class="entry-item editable text" rownumber="10"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_10_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_10_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="11" columnnumber="0"><spring:message
									code="ref307"></spring:message></td>
							<td class="entry-item editable text" rownumber="11"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_11_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_11_1_}</div></td>
							<td class="entry-item editable text" rownumber="11"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_11_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_11_2_}</div></td>
						</tr>
						<tr>
							<td rownumber="12" columnnumber="0"><spring:message
									code="ref308"></spring:message></td>
							<td class="entry-item editable text" rownumber="11"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_12_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_12_1_}</div></td>
							<td class="entry-item editable text" rownumber="12"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="62"><span class="entry_item_placeholder" id="_fraVariable_62_12_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_62_12_2_}</div></td>
						</tr>


					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_62_"/>
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
								entry-id="63"><span class="entry_item_placeholder" id="_fraVariable_63_1_0_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_63_1_0_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_63_"/>
			<br>
			<br>
		</div>
	</section>
</section>