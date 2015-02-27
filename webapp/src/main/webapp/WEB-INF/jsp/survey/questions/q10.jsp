<%@ include file="../../common/includes/taglibs.jsp"%>

<c:set var="q" value="_10_" />
<c:set var="hide" value="false" />
<c:if test="${(! fn:contains(notEmptyQuestion,q)) && param.hideEmpty == 'true'}">
  <c:set var="hide" value="true" />
</c:if>

<c:if test="${hide == 'false'}">

<section>
	<div class="page-header">
		<h1>
			10.
			<spring:message code="ref377"></spring:message>
		</h1>
	</div>
	<p class="lead">
		<spring:message code="refq10faq"></spring:message>
	</p>
	
	<fra:reviewers />
	
	<section>
		<h2>
			10.1
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
									code="ref378"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref379"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref380"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref381"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br/>
			<br/>
		</div>
	</section>
	<c:if test="${fn:contains(notEmptyEntry,'_102_') || fn:contains(notEmptyEntry,'_103_') || fn:contains(notEmptyEntry,'_104_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			10.2
			<spring:message code="ref33"></spring:message>
		</h2>
		<c:if test="${fn:contains(notEmptyEntry,'_102_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				10.2.1
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
							
							<fra:DynamicTableTag numOfColoumn="4" entryItemName="102" numericColoumn="true"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_102_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_103_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				10.2.2
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
							
							<fra:DynamicTableTag numOfColoumn="2" entryItemName="103" numericColoumn="false"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_103_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_104_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				10.2.3
				<spring:message code="ref44"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_104_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_104_"/>
				<br/>
				<br/>
			</div>
		</section>
		</c:if>
	</section>
  </c:if>
  <c:if test="${fn:contains(notEmptyEntry,'_10_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			10.3
			<spring:message code="ref49"></spring:message>
		</h2>
		<div><a id="inpagelink_var_10"></a>
			<h4>
				<spring:message code="ref382"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
<tr>
    <td rowspan="3" rownumber="0" columnnumber="1"><spring:message code="ref152"></spring:message></td>
    <td colspan="4" rownumber="0" columnnumber="2"></td>
</tr>
<tr class="defhead">
    <td rowspan="2" rownumber="1" columnnumber="1"><spring:message code="ref383"></spring:message></td>
    <td colspan="3" rownumber="1" columnnumber="2"><spring:message code="ref384"></spring:message></td>
</tr>
<tr class="defhead">
    <td colspan="1" rownumber="2" columnnumber="1"><spring:message code="ref385"></spring:message></td>
    <td colspan="1" rownumber="2" columnnumber="2"><spring:message code="ref386"></spring:message></td>
    <td colspan="1" rownumber="2" columnnumber="3"><spring:message code="ref387"></spring:message></td>
</tr>
<tr rowname="10.1" unit="Boolean">
    <td class="title" rownumber="3" columnnumber="0"><spring:message code="ref388"></spring:message></td>
    <fra:yesno mod=" " name="_fraVariable_10_3_1_"  rownumber="3" columnnumber="1" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
    <fra:yesno mod=" " name="_fraVariable_10_3_3_"  rownumber="3" columnnumber="3" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
    <fra:yesno mod=" " name="_fraVariable_10_3_5_"  rownumber="3" columnnumber="5" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
    <fra:yesno mod=" " name="_fraVariable_10_3_7_"  rownumber="3" columnnumber="7" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
</tr>
<tr rowname="10.1.1" unit="Boolean">
<td class="title" rownumber="5" columnnumber="0"><spring:message code="ref389"></spring:message></td>
<fra:yesno mod=" editable " name="_fraVariable_10_5_1_"  rownumber="5" columnnumber="1" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
<fra:yesno mod=" editable " name="_fraVariable_10_5_3_"  rownumber="5" columnnumber="3" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
<fra:yesno mod=" editable " name="_fraVariable_10_5_5_"  rownumber="5" columnnumber="5" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
<fra:yesno mod=" editable " name="_fraVariable_10_5_7_"  rownumber="5" columnnumber="7" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
</tr>
<tr rowname="10.1.2" unit="Boolean">
<td class="title" rownumber="7" columnnumber="0"><spring:message code="ref390"></spring:message></td>
<fra:yesno mod=" editable " name="_fraVariable_10_7_1_"  rownumber="7" columnnumber="1" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
<fra:yesno mod=" editable " name="_fraVariable_10_7_3_"  rownumber="7" columnnumber="3" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
<fra:yesno mod=" editable " name="_fraVariable_10_7_5_"  rownumber="7" columnnumber="5" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
<fra:yesno mod=" editable " name="_fraVariable_10_7_7_"  rownumber="7" columnnumber="7" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
</tr>
<tr rowname="10.2" unit="Boolean">
<td class="title" rownumber="9" columnnumber="0"><spring:message code="ref380"></spring:message></td>
<fra:yesno mod=" editable " name="_fraVariable_10_9_1_"  rownumber="9" columnnumber="1" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
<fra:yesno mod=" editable " name="_fraVariable_10_9_3_"  rownumber="9" columnnumber="3" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
<fra:yesno mod=" editable " name="_fraVariable_10_9_5_"  rownumber="9" columnnumber="5" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
<fra:yesno mod=" editable " name="_fraVariable_10_9_7_"  rownumber="9" columnnumber="7" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
</tr>
<tr rowname="10.2.1" unit="Boolean">
<td class="title" rownumber="10" columnnumber="0"><spring:message code="ref389"></spring:message></td>
<fra:yesno mod=" editable " name="_fraVariable_10_10_1_"  rownumber="10" columnnumber="1" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
<fra:yesno mod=" editable " name="_fraVariable_10_10_3_"  rownumber="10" columnnumber="3" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
<fra:yesno mod=" editable " name="_fraVariable_10_10_5_"  rownumber="10" columnnumber="5" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
<fra:yesno mod=" editable " name="_fraVariable_10_10_7_"  rownumber="10" columnnumber="7" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
</tr>
<tr rowname="10.1.2" unit="Boolean">
<td class="title" rownumber="11" columnnumber="0"><spring:message code="ref390"></spring:message></td>
<fra:yesno mod=" editable " name="_fraVariable_10_11_1_"  rownumber="11" columnnumber="1" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
<fra:yesno mod=" editable " name="_fraVariable_10_11_3_"  rownumber="11" columnnumber="3" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
<fra:yesno mod=" editable " name="_fraVariable_10_11_5_"  rownumber="11" columnnumber="5" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
<fra:yesno mod=" editable " name="_fraVariable_10_11_7_"  rownumber="11" columnnumber="7" style="background-color: rgb(242, 245, 169); " entryId="10"></fra:yesno>
</tr> 
</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_10_"/>
			<br/>
			<br/>
		</div>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_105_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			10.4
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
									code="ref391"></spring:message></td>
							<td rownumber="0" columnnumber="1"><spring:message
									code="ref81"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref378"></spring:message></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="105"><span class="entry_item_placeholder" id="_fraVariable_105_1_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_105_1_1_}</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref380"></spring:message></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="105"><span class="entry_item_placeholder" id="_fraVariable_105_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_105_2_1_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_105_"/>
			<br/>
			<br/>
		</div>
	</section>
	</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_904_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				<spring:message code="ref565"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_904_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_904_"/>
				<br/>
				<br/>
			</div>
		</section>
	</c:if>
</section>

</c:if>