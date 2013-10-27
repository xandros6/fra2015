<%@ include file="../../common/includes/taglibs.jsp"%>

<c:set var="q" value="_15_" />
<c:set var="hide" value="false" />
<c:if test="${(! fn:contains(notEmptyQuestion,q)) && param.hideEmpty == 'true'}">
  <c:set var="hide" value="true" />
</c:if>

<c:if test="${hide == 'false'}">

<section>
	<div class="page-header">
		<h1>
			15.
			<spring:message code="ref457"></spring:message>
		</h1>
	</div>
	<p class="lead">
		<spring:message code="refq15faq"></spring:message>
	</p>
	
	<fra:reviewers />
	
	<c:if test="${fn:contains(notEmptyEntry,'_15_') || fn:contains(notEmptyEntry,'_131_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			15.1
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
									code="ref458"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref459"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br/>
			<br/>
		</div>
		<c:if test="${fn:contains(notEmptyEntry,'_15_') || param.hideEmpty != 'true'}">
		<div><a id="inpagelink_var_15"></a>
			<h4>
				<spring:message code="ref460"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
<tr rowname="14.2" unit="Boolean">
<td class="title" colspan="3" rownumber="0" columnnumber="0"><spring:message code="ref461"></spring:message></td>
</tr>
<tr rowname="14.2.1" unit="Boolean">
<td class="title" colspan="2" rownumber="1" columnnumber="0"><spring:message code="ref462"></spring:message></td>
<fra:yesno mod=" editable " name="_fraVariable_15_1_1_"  rownumber="1" columnnumber="1" style="background-color: rgb(242, 245, 169); " entryId="14b"></fra:yesno>
</tr>
<tr rowname="14.2.2" unit="Boolean">
<td class="title" colspan="2" rownumber="3" columnnumber="0"><spring:message code="ref463"></spring:message></td>
<fra:yesno mod=" editable " name="_fraVariable_15_3_1_"  rownumber="3" columnnumber="1" style="background-color: rgb(242, 245, 169); " entryId="14b"></fra:yesno>
</tr>
<tr rowname="14.2.3" unit="Boolean">
<td class="title" colspan="2" rownumber="5" columnnumber="0"><spring:message code="ref464"></spring:message></td>
<fra:yesno mod=" editable " name="_fraVariable_15_5_1_"  rownumber="5" columnnumber="1" style="background-color: rgb(242, 245, 169); " entryId="14b"></fra:yesno>
</tr>
</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_15_"/>
			<br/>
			<br/>
		</div>
		</c:if>
		<c:if test="${fn:contains(notEmptyEntry,'_131_') || param.hideEmpty != 'true'}">
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
									code="ref465"></spring:message></td>
							<td class="tier entry-item" rownumber="1" columnnumber="1"
								entry-id="131"><div id="cell-content">
									<fra:tiers name="_fraVariable_131_1_1_"><option
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
			<fra:feedback feedbackName="_feedback_131_"/>
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
									code="ref465"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref466"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br/>
			<br/>
		</div>
		</c:if>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_133_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			15.2
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
								entry-id="133"><span class="entry_item_placeholder" id="_fraVariable_133_1_0_">&#160;</span>
							<div id="cell-content">${_fraVariable_133_1_0_}</div></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="133"><span class="entry_item_placeholder" id="_fraVariable_133_1_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_133_1_1_}</div></td>
						</tr>
						<tr>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="133"><span class="entry_item_placeholder" id="_fraVariable_133_2_0_">&#160;</span>
							<div id="cell-content">${_fraVariable_133_2_0_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="133"><span class="entry_item_placeholder" id="_fraVariable_133_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_133_2_1_}</div></td>
						</tr>
						<tr>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="0" style="background-color: rgb(242, 245, 169);"
								entry-id="133"><span class="entry_item_placeholder" id="_fraVariable_133_3_0_">&#160;</span>
							<div id="cell-content">${_fraVariable_133_3_0_}</div></td>
							<td class="entry-item editable text" rownumber="3"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="133"><span class="entry_item_placeholder" id="_fraVariable_133_3_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_133_3_1_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_133_"/>
			<br/>
			<br/>
		</div>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_909_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				<spring:message code="ref565"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_909_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_909_"/>
				<br/>
				<br/>
			</div>
		</section>
	</c:if>
</section>

</c:if>