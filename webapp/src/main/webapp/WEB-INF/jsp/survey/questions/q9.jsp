<%@ include file="../../common/includes/taglibs.jsp"%>

<c:set var="q" value="_9_" />
<c:set var="hide" value="false" />
<c:if test="${(! fn:contains(notEmptyQuestion,q)) && param.hideEmpty == 'true'}">
  <c:set var="hide" value="true" />
</c:if>

<c:if test="${hide == 'false'}">

<section>
	<div class="page-header">
		<h1>
			9.
			<spring:message code="ref371"></spring:message>
		</h1>
	</div>
	<p class="lead">
		<spring:message code="refq9faq"></spring:message>
	</p>
	
	<fra:reviewers />
	
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
								code="ref372"></spring:message></td>
						<td rownumber="1" columnnumber="1"><spring:message
								code="ref373"></spring:message></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="control clearfix"></div>
		<br/>
		<br/>
	</div>
	<c:if test="${fn:contains(notEmptyEntry,'_9_') || param.hideEmpty != 'true'}">
	<div>
		<h4>
			<spring:message code="ref374"></spring:message>
		</h4>
		<div></div>
		<div class="entry">
			<table
				class="editable table table-bordered table-hover table-condensed table-striped">
				<tbody>
					<tr>
						<td rownumber="0" columnnumber="0"><spring:message
								code="ref152"></spring:message></td>
						<td rownumber="0" columnnumber="1"><spring:message
								code="ref375"></spring:message></td>
					</tr>
					<tr rowname="9.1" unit="% canopy cover"
						class="summary-aggregated-2000-2010">
						<td class="title" rownumber="1" columnnumber="0"><spring:message
								code="ref372"></spring:message></td>
						<td columnname="2000-2010"
							class="prefilled entry-item editable text" rownumber="1"
							columnnumber="1" style="background-color: rgb(242, 245, 169);"
							entry-id="9"><span class="entry_item_placeholder" id="_fraVariable_9_1_1_">&#160;</span>
						<div id="cell-content">${_fraVariable_9_1_1_}</div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="control clearfix"></div>
		<fra:feedback feedbackName="_feedback_9_"/>
		<br/>
		<br/>
	</div>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_900_') || param.hideEmpty != 'true'}">
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
									code="ref75"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref372"></spring:message></td>
							<td class="tier entry-item" rownumber="1" columnnumber="2"
								entry-id="900"><div id="cell-content">
									<fra:tiers name="_fraVariable_900_1_2_"><option
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
			<fra:feedback feedbackName="_feedback_900_"/>
			<br/>
			<br/>
	</div>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_901_') || param.hideEmpty != 'true'}">
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
									code="ref75"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref372"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref375bis"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<br/>
			<br/>
			<div>
			<h4>
				<spring:message code="ref126"></spring:message>
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
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref372"></spring:message></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="901"><span class="entry_item_placeholder" id="_fraVariable_901_1_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_901_1_1_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_901_"/>
			<br/>
			<br/>
		</div>
		</div>
	</c:if>
</section>

</c:if>