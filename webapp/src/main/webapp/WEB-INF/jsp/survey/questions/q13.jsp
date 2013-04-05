<%@ include file="../../common/includes/taglibs.jsp"%>
<section>
	<div class="page-header">
		<h1>
			13.
			<spring:message code="ref407"></spring:message>
		</h1>
	</div>
	<p class="lead">
		<spring:message code="refq13faq"></spring:message>
	</p>
	<section>
		<h2>
			13.1
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
									code="ref408"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref409"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref410"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref411"></spring:message></td>
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
			13.2
			<spring:message code="ref33"></spring:message>
		</h2>
		<section>
			<h3>
				13.2.1
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
							
							<fra:DynamicTableTag numOfColoumn="4" entryItemName="120" numericColoumn="true"/>
							
						</tbody>
					</table>
				</div>
				<div class="control pull-right">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_120_"/>
				<br>
				<br>
			</div>
		</section>
		<section>
			<h3>
				13.2.2
				<spring:message code="ref412"></spring:message>
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
							
							<fra:DynamicTableTag numOfColoumn="2" entryItemName="121" numericColoumn="false"/>
							
						</tbody>
					</table>
				</div>
				<div class="control pull-right">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_121_"/>
				<br>
				<br>
			</div>
		</section>
	</section>
	<section>
		<h2>
			13.3
			<spring:message code="ref49"></spring:message>
		</h2>
		<div>
			<h4>
				<spring:message code="ref413"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td rowspan="2" rownumber="0" columnnumber="0"><spring:message
									code="ref13"></spring:message></td>
							<td rowspan="2" rownumber="0" columnnumber="1"><spring:message
									code="ref414"></spring:message></td>
							<td rowspan="2" rownumber="0" columnnumber="2"><spring:message
									code="ref415"></spring:message></td>
							<td colspan="6" rownumber="0" columnnumber="3"><spring:message
									code="ref416"></spring:message></td>
						</tr>
                        <tr class="defhead">
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref417"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref418"></spring:message></td>
							<td rownumber="1" columnnumber="2"><spring:message
									code="ref419"></spring:message></td>
							<td rownumber="1" columnnumber="3"><spring:message
									code="ref420"></spring:message></td>
							<td rownumber="1" columnnumber="4"><spring:message
									code="ref421"></spring:message></td>
							<td rownumber="1" columnnumber="5"><spring:message
									code="ref422"></spring:message></td>
						</tr>
						<tr rowname="13.1" unit="%,year,checkbox" class="summary-na">
							<td class="title" rownumber="2" columnnumber="0"><spring:message
									code="ref423"></spring:message></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="13a"><input type="hidden" style="width:80%" name="_fraVariable_13a_2_1_" value="${_fraVariable_13a_2_1_}">
							<div id="cell-content">${_fraVariable_13a_2_1_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="13a"><input type="hidden" style="width:80%" name="_fraVariable_13a_2_2_" value="${_fraVariable_13a_2_2_}">
							<div id="cell-content">${_fraVariable_13a_2_2_}</div></td>
							<fra:yesno mod=" editable " name="_fraVariable_13a_2_3_"  rownumber="2" columnnumber="3" style="background-color: rgb(242, 245, 169); " entryId="13a"></fra:yesno>
							<fra:yesno mod=" editable " name="_fraVariable_13a_2_4_"  rownumber="2" columnnumber="4" style="background-color: rgb(242, 245, 169); " entryId="13a"></fra:yesno>
							<fra:yesno mod=" editable " name="_fraVariable_13a_2_5_"  rownumber="2" columnnumber="5" style="background-color: rgb(242, 245, 169); " entryId="13a"></fra:yesno>
							<fra:yesno mod=" editable " name="_fraVariable_13a_2_6_"  rownumber="2" columnnumber="6" style="background-color: rgb(242, 245, 169); " entryId="13a"></fra:yesno>
							<fra:yesno mod=" editable " name="_fraVariable_13a_2_7_"  rownumber="2" columnnumber="7" style="background-color: rgb(242, 245, 169); " entryId="13a"></fra:yesno>
							<fra:yesno mod=" editable " name="_fraVariable_13a_2_8_"  rownumber="2" columnnumber="8" style="background-color: rgb(242, 245, 169); " entryId="13a"></fra:yesno>
							
							
						</tr>
						<tr rowname="13.2" unit="%,year,checkbox" class="summary-na">
							<td class="title" rownumber="3" columnnumber="0"><spring:message
									code="ref424"></spring:message></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="13a"><input type="hidden" style="width:80%" name="_fraVariable_13a_3_1_" value="${_fraVariable_13a_3_1_}">
							<div id="cell-content">${_fraVariable_13a_3_1_}</div></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="13a"><input type="hidden" style="width:80%" name="_fraVariable_13a_3_2_" value="${_fraVariable_13a_3_2_}">
							<div id="cell-content">${_fraVariable_13a_3_2_}</div></td>
							<fra:yesno mod=" editable " name="_fraVariable_13a_3_3_"  rownumber="2" columnnumber="3" style="background-color: rgb(242, 245, 169); " entryId="13a"></fra:yesno>
							<fra:yesno mod=" editable " name="_fraVariable_13a_3_4_"  rownumber="2" columnnumber="4" style="background-color: rgb(242, 245, 169); " entryId="13a"></fra:yesno>
							<fra:yesno mod=" editable " name="_fraVariable_13a_3_5_"  rownumber="2" columnnumber="5" style="background-color: rgb(242, 245, 169); " entryId="13a"></fra:yesno>
							<fra:yesno mod=" editable " name="_fraVariable_13a_3_6_"  rownumber="2" columnnumber="6" style="background-color: rgb(242, 245, 169); " entryId="13a"></fra:yesno>
							<fra:yesno mod=" editable " name="_fraVariable_13a_3_7_"  rownumber="2" columnnumber="7" style="background-color: rgb(242, 245, 169); " entryId="13a"></fra:yesno>
							<fra:yesno mod=" editable " name="_fraVariable_13a_3_8_"  rownumber="2" columnnumber="8" style="background-color: rgb(242, 245, 169); " entryId="13a"></fra:yesno>

						</tr>
						<tr rowname="13.3" unit="%,year,checkbox" class="summary-na">
							<td class="title" rownumber="4" columnnumber="0"><spring:message
									code="ref425"></spring:message></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="13a"><input type="hidden" style="width:80%" name="_fraVariable_13a_4_1_" value="${_fraVariable_13a_4_1_}">
							<div id="cell-content">${_fraVariable_13a_4_1_}</div></td>
							<td class="entry-item editable text" rownumber="4"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="13a"><input type="hidden" style="width:80%" name="_fraVariable_13a_4_2_" value="${_fraVariable_13a_4_2_}">
							<div id="cell-content">${_fraVariable_13a_4_2_}</div></td>
							<fra:yesno mod=" editable " name="_fraVariable_13a_4_3_"  rownumber="2" columnnumber="3" style="background-color: rgb(242, 245, 169); " entryId="13a"></fra:yesno>
							<fra:yesno mod=" editable " name="_fraVariable_13a_4_4_"  rownumber="2" columnnumber="4" style="background-color: rgb(242, 245, 169); " entryId="13a"></fra:yesno>

							
							<td class="noneditable" rownumber="4" columnnumber="5"></td>
							<td class="noneditable" rownumber="4" columnnumber="6"></td>
							<td class="noneditable" rownumber="4" columnnumber="7"></td>
							<td class="noneditable" rownumber="4" columnnumber="8"></td>
						</tr>
						<tr rowname="13.4" unit="%,year,checkbox" class="summary-na">
							<td class="title" rownumber="5" columnnumber="0"><spring:message
									code="ref426"></spring:message></td>
							<td class="entry-item editable text" rownumber="5"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="13a"><input type="hidden" style="width:80%" name="_fraVariable_13a_5_1_" value="${_fraVariable_13a_5_1_}">
							<div id="cell-content">${_fraVariable_13a_5_1_}</div></td>
							<td class="entry-item editable text" rownumber="5"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="13a"><input type="hidden" style="width:80%" name="_fraVariable_13a_5_2_" value="${_fraVariable_13a_5_2_}">
							<div id="cell-content">${_fraVariable_13a_5_2_}</div></td>
							<td class="noneditable" rownumber="5" columnnumber="3"></td>
							<td class="noneditable" rownumber="5" columnnumber="4"></td>
							<td class="noneditable" rownumber="5" columnnumber="5"></td>
							<td class="noneditable" rownumber="5" columnnumber="6"></td>
							<td class="noneditable" rownumber="5" columnnumber="7"></td>
							<td class="noneditable" rownumber="5" columnnumber="8"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_13a_"/>
			<br>
			<br>
		</div>
		<div>
			<h4>
				<spring:message code="ref427"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
<tr rowname="13.5" unit="%,year,checkbox">
<td class="title" rownumber="0" columnnumber="0"><spring:message code="ref428"></spring:message></td>
<td rownumber="0" columnnumber="1"><spring:message code="ref429"></spring:message></td>
</tr>
<tr rowname="13.5.1" unit="%,year,checkbox">
<td class="title" rownumber="1" columnnumber="0"><spring:message code="ref430"></spring:message></td>
<fra:yesno mod=" editable " name="_fraVariable_13b_1_1_"  rownumber="1" columnnumber="1" style="background-color: rgb(242, 245, 169); " entryId="13b"></fra:yesno>
</tr>
<tr rowname="13.5.2" unit="%,year,checkbox">
<td class="title" rownumber="3" columnnumber="0"><spring:message code="ref431"></spring:message></td>
<fra:yesno mod=" editable " name="_fraVariable_13b_3_1_"  rownumber="3" columnnumber="1" style="background-color: rgb(242, 245, 169); " entryId="13b"></fra:yesno>
</tr>
<tr rowname="13.5.3" unit="%,year,checkbox">
<td class="title" rownumber="5" columnnumber="0"><spring:message code="ref432"></spring:message></td>
<fra:yesno mod=" editable " name="_fraVariable_13b_5_1_"  rownumber="5" columnnumber="1" style="background-color: rgb(242, 245, 169); " entryId="13b"></fra:yesno>
</tr>
<tr rowname="13.5.4" unit="%,year,checkbox">
<td class="title" rownumber="7" columnnumber="0"><spring:message code="ref433"></spring:message></td>
<fra:yesno mod=" editable " name="_fraVariable_13b_7_1_"  rownumber="7" columnnumber="1" style="background-color: rgb(242, 245, 169); " entryId="13b"></fra:yesno>
</tr>
</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_13b_"/>
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
									code="ref434"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"
								class="entry-item editable text"
								style="background-color: rgb(242, 245, 169);" entry-id="122"><span class="entry_item_placeholder" id="_fraVariable_122_1_0_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_122_1_0_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_122_"/>
			<br>
			<br>
		</div>
	</section>
	<section>
		<h2>
			13.4
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
									code="ref126"></spring:message></td>
						</tr>
						<tr>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="123"><span class="entry_item_placeholder" id="_fraVariable_123_1_0_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_123_1_0_}</div></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="123"><span class="entry_item_placeholder" id="_fraVariable_123_1_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_123_1_1_}</div></td>
						</tr>
						<tr>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="123"><span class="entry_item_placeholder" id="_fraVariable_123_2_0_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_123_2_0_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="123"><span class="entry_item_placeholder" id="_fraVariable_123_2_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_123_2_1_}</div></td>
						</tr>
						<tr>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="123"><span class="entry_item_placeholder" id="_fraVariable_123_3_0_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_123_3_0_}</div></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="123"><span class="entry_item_placeholder" id="_fraVariable_123_3_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_123_3_1_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control pull-right"></div>
			<fra:feedback feedbackName="_feedback_123_"/>
			<br>
			<br>
		</div>
	</section>
</section>