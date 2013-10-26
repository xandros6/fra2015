<%@ include file="../../common/includes/taglibs.jsp"%>

<c:set var="q" value="_16_" />
<c:set var="hide" value="false" />
<c:if test="${(! fn:contains(notEmptyQuestion,q)) && param.hideEmpty == 'true'}">
  <c:set var="hide" value="true" />
</c:if>

<c:if test="${hide == 'false'}">

<section>
	<div class="page-header">
		<h1>
			16.
			<spring:message code="ref467"></spring:message>
		</h1>
	</div>
	<p class="lead">
		<spring:message code="refq16faq"></spring:message>
	</p>
	
	<fra:reviewers />
	
	<section>
		<h2>
			16.1
			<spring:message code="ref468"></spring:message>
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
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref471"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref472"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="3" columnnumber="0"><spring:message
									code="ref473"></spring:message></td>
							<td rownumber="3" columnnumber="1"><spring:message
									code="ref474"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref469"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref470"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="4" columnnumber="0"><spring:message
									code="ref475"></spring:message></td>
							<td rownumber="4" columnnumber="1"><spring:message
									code="ref476"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br/>
			<br/>
		</div>
	</section>
	<c:if test="${fn:contains(notEmptyEntry,'_16a_') || fn:contains(notEmptyEntry,'_16b_') || fn:contains(notEmptyEntry,'_136_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			16.2
			<spring:message code="ref49"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_16a_') || param.hideEmpty != 'true'}">
		<div><a id="inpagelink_var_16a"></a>
			<h4>
				<spring:message code="ref477"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td colspan="2" rowspan="2" rownumber="0" columnnumber="0"><spring:message
									code="ref479"></spring:message><!-- spring:message
									code="ref478"/ --></td>
							<td colspan="7" rownumber="0" columnnumber="1"><spring:message
									code="ref477c"></spring:message></td>
						</tr>	
						<tr class="defhead">
                            <td>2000</td><td>2001</td><td>2002</td><td>2003</td><td>2004</td><td>2005</td><td>2006</td>
						</tr>
						
						<tr rowname="16.1.1" unit="1000 ha">
							<td style="width:20px;"><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="2" columnnumber="0"><spring:message
									code="ref480"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_2_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_2_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_2_2_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_2_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_2_3_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_2_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_2_4_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_2_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_2_5_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_2_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_2_6_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_2_7_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_2_7_}</div></td>
							
						</tr>
						<tr rowname="16.1.2" unit="1000 ha">
							<td style="width:20px;"><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="3" columnnumber="0"><spring:message
									code="ref481"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_3_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_3_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_3_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_3_2_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_3_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_3_3_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_3_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_3_4_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_3_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_3_5_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_3_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_3_6_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_3_7_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_3_7_}</div></td>
						</tr>
						<tr rowname="16.1.3" unit="1000 ha">
							<td style="width:20px;"><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="4" columnnumber="0"><spring:message
									code="ref478"></spring:message></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_4_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_4_1_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_4_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_4_2_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_4_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_4_3_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_4_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_4_4_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_4_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_4_5_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_4_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_4_6_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_4_7_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_4_7_}</div></td>
						</tr>
							
                        <tr class="defhead">
                            <td colspan="2"></td><td>2007</td><td>2008</td><td>2009</td><td>2010</td><td>2011</td><td>2012</td><td class="noneditable"></td>
						</tr>
						
						<tr rowname="16.1.1" unit="1000 ha">
							<td style="width:20px;"><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="2" columnnumber="0"><spring:message
									code="ref480"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_6_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_6_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_6_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_6_2_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_6_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_6_3_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_6_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_6_4_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_6_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_6_5_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_6_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_6_6_}</div></td>
							<td class="noneditable"></td>
							
						</tr>
						<tr rowname="16.1.2" unit="1000 ha">
							<td style="width:20px;"><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="3" columnnumber="0"><spring:message
									code="ref481"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_7_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_7_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_7_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_7_2_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_7_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_7_3_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_7_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_7_4_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_7_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_7_5_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_7_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_7_6_}</div></td>
							<td class="noneditable"></td>
						</tr>
						<tr rowname="16.2" unit="1000 ha">
							<td style="width:20px;"><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="4" columnnumber="0"><spring:message
									code="ref478"></spring:message></td>
							<td class="entry-item editable text number" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_8_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_8_1_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_8_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_8_2_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_8_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_8_3_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_8_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_8_4_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_8_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_8_5_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16a"><span class="entry_item_placeholder" id="_fraVariable_16a_8_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_16a_8_6_}</div></td>
							<td class="noneditable"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_16a_"/><%//TODO feedback 16a %>
			<br/>
			<br/>
		</div>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_16b_') || param.hideEmpty != 'true'}">
		<div><a id="inpagelink_var_16b"></a>
			<h4>
				<spring:message code="rev477b"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td colspan="2" rowspan="2" rownumber="0" columnnumber="0"><spring:message
									code="ref482"></spring:message><!-- spring:message
									code="ref478"/ --></td>
							<td colspan="7" rownumber="0" columnnumber="1"><spring:message
									code="ref477c"></spring:message></td>
						</tr>	
						<tr class="defhead">
                            <td>2000</td><td>2001</td><td>2002</td><td>2003</td><td>2004</td><td>2005</td><td>2006</td>
						</tr>
						
						<tr rowname="16.2.1" unit="1000 ha">
							<td style="width:20px;"><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="prefilled entry-item editable text refiller" rownumber="2"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_2_0_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_2_0_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_2_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_2_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_2_2_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_2_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_2_3_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_2_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_2_4_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_2_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_2_5_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_2_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_2_6_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_2_7_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_2_7_}</div></td>
							
						</tr>
						<tr rowname="16.2.2" unit="1000 ha">
							<td style="width:20px;"><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="prefilled entry-item editable text refiller" rownumber="3"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_3_0_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_3_0_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_3_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_3_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_3_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_3_2_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_3_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_3_3_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_3_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_3_4_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_3_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_3_5_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_3_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_3_6_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_3_7_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_3_7_}</div></td>
						</tr>
						<tr rowname="16.2.3" unit="1000 ha">
							<td style="width:20px;"><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="entry-item editable text refiller" rownumber="4"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_4_0_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_4_0_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_4_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_4_1_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_4_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_4_2_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_4_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_4_3_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_4_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_4_4_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_4_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_4_5_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_4_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_4_6_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_4_7_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_4_7_}</div></td>
						</tr>
							
						<tr class="defhead">
                            <td colspan="2"></td><td>2007</td><td>2008</td><td>2009</td><td>2010</td><td>2011</td><td>2012</td><td class="noneditable"></td>
						</tr>
						
						<tr rowname="16.2.1" unit="1000 ha">
							<td style="width:20px;"><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td  rownumber="2" columnnumber="0" entry-id="16b" class="refill _fraVariable_16b_2_0_">${_fraVariable_16b_2_0_}</td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_6_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_6_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_6_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_6_2_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_6_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_6_3_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_6_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_6_4_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_6_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_6_5_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_6_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_6_6_}</div></td>
							<td class="noneditable"></td>
							
						</tr>
						<tr rowname="16.2.2" unit="1000 ha">
							<td style="width:20px;"><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td  rownumber="3" columnnumber="0" entry-id="16b"  class="refill _fraVariable_16b_3_0_">${_fraVariable_16b_3_0_}</td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_7_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_7_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_7_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_7_2_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_7_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_7_3_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_7_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_7_4_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_7_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_7_5_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_7_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_7_6_}</div></td>
							<td class="noneditable"></td>
						</tr>
						<tr rowname="16.2.3" unit="1000 ha">
							<td style="width:20px;"><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td  rownumber="4"	columnnumber="0" entry-id="16b"  class="refill _fraVariable_16b_4_0_">${_fraVariable_16b_4_0_}</td>
							<td class="entry-item editable text number" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_8_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_8_1_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_8_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_8_2_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_8_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_8_3_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_8_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_8_4_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_8_5_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_8_5_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="16b"><span class="entry_item_placeholder" id="_fraVariable_16b_8_6_">&#160;</span>
							<div id="cell-content">${_fraVariable_16b_8_6_}</div></td>
							<td class="noneditable"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_16b_"/><%//TODO feedback 16b %>
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
									code="ref479"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref484"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref482"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref485"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br/>
			<br/>
		</div>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_136_') || param.hideEmpty != 'true'}">
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
									code="ref479"></spring:message></td>
							<td class="tier entry-item" rownumber="1" columnnumber="1"
								entry-id="136"><div id="cell-content">
									<fra:tiers name="_fraVariable_136_1_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref482"></spring:message></td>
							<td class="tier entry-item" rownumber="2" columnnumber="1"
								entry-id="136"><div id="cell-content">
									<fra:tiers name="_fraVariable_136_2_1_"><option
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
			<fra:feedback feedbackName="_feedback_136_"/>
			<br/>
			<br/>
		</div>
		</c:if>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_137_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			16.3
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
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref485a"></spring:message></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="137"><span class="entry_item_placeholder" id="_fraVariable_137_1_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_137_1_1_}</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref485b"></spring:message></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="137"><span class="entry_item_placeholder" id="_fraVariable_137_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_137_2_1_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_137_"/>
			<br/>
			<br/>
		</div>
	</section>
	</c:if>
</section>

</c:if>