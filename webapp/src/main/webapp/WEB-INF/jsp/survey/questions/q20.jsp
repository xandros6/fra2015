<%@ include file="../../common/includes/taglibs.jsp"%>

<c:set var="q" value="_20_" />
<c:set var="hide" value="false" />
<c:if test="${(! fn:contains(notEmptyQuestion,q)) && param.hideEmpty == 'true'}">
  <c:set var="hide" value="true" />
</c:if>

<c:if test="${hide == 'false'}">

<section>
	<div class="page-header">
		<h1>
			20.
			<spring:message code="ref545"></spring:message>
		</h1>
	</div>
	<p class="lead">
		<spring:message code="refq20faq"></spring:message>
	</p>
	
	<fra:reviewers />
	
	<section>
		<h2>
			20.1
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
									code="ref546"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref547"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br/>
			<br/>
		</div>
	</section>
	<c:if test="${fn:contains(notEmptyEntry,'_20_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			20.2
			<spring:message code="ref49"></spring:message>
		</h2>
		<div><a id="inpagelink_var_20"></a>
			<h4>
				<spring:message code="ref548"></spring:message>
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
									code="ref549"></spring:message></td>
							<td rownumber="0" columnnumber="2"><spring:message
									code="ref550"></spring:message></td>
							<td rownumber="0" columnnumber="3"><spring:message
									code="ref551"></spring:message></td>
						</tr>
						<tr rowname="20.1" unit="1000 local currency">
							<td class="title" rownumber="1" columnnumber="0"><spring:message
									code="ref552"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="20"><span class="entry_item_placeholder" id="_fraVariable_20_1_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_20_1_1_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="1"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="20"><span class="entry_item_placeholder" id="_fraVariable_20_1_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_20_1_2_}</div></td>
							<td class="prefilled entry-item editable text" rownumber="1"
								columnnumber="3" style="background-color: rgb(242, 245, 169);"
								entry-id="20"><span class="entry_item_placeholder" id="_fraVariable_20_1_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_20_1_3_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_20_"/>
			<br/>
			<br/>
		</div>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_161_') || param.hideEmpty != 'true'}">
	<section>
		<h2>
			20.3
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
								entry-id="161"><span class="entry_item_placeholder" id="_fraVariable_161_1_0_">&#160;</span>
							<div id="cell-content">${_fraVariable_161_1_0_}</div></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="161"><span class="entry_item_placeholder" id="_fraVariable_161_1_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_161_1_1_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_161_"/>
			<br/>
			<br/>
		</div>
	</section>
	</c:if>
	<c:if test="${fn:contains(notEmptyEntry,'_912_') || param.hideEmpty != 'true'}">
		<section>
			<h3>
				<spring:message code="ref565"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_912_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_912_"/>
				<br/>
				<br/>
			</div>
		</section>
	</c:if>
</section>

</c:if>