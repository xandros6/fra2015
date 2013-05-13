<%@ include file="../../common/includes/taglibs.jsp"%>
<section>
	<div class="page-header">
		<h1>
			19.
			<spring:message code="ref536"></spring:message>
		</h1>
	</div>
	<p class="lead">
		<spring:message code="refq19faq"></spring:message>
	</p>
	
	<fra:reviewers />
	
	<section>
		<h2>
			19.1
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
									code="ref537"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref538"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref539"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref540"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br/>
			<br/>
		</div>
	</section>
	<section>
		<h2>
			19.2
			<spring:message code="ref33"></spring:message>
		</h2>
		<section>
			<h3>
				19.2.1
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
										code="ref37"></spring:message></td>
								<td rownumber="0" columnnumber="3"><spring:message
										code="ref38"></spring:message></td>
								<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
									<td class="action-column" width="80px"></td>
								</c:if>
							</tr>
							
							<fra:DynamicTableTag numOfColoumn="3" entryItemName="155" numericColoumn="true"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_155_"/>
				<br/>
				<br/>
			</div>
		</section>
		<section>
			<h3>
				19.2.2
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
							
							<fra:DynamicTableTag numOfColoumn="2" entryItemName="156" numericColoumn="false"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_156_"/>
				<br/>
				<br/>
			</div>
		</section>
		<section>
			<h3>
				19.2.3
				<spring:message code="ref44"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_157_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_157_"/>
				<br/>
				<br/>
			</div>
		</section>
	</section>
	<section>
		<h2>
			19.3
			<spring:message code="ref49"></spring:message>
		</h2>
		<div>
			<h4>
				<spring:message code="ref541"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td colspan="2" rowspan="2" rownumber="0" columnnumber="0"><spring:message
									code="ref192"></spring:message></td>
							<td colspan="4" rownumber="0" columnnumber="1"><spring:message
									code="ref542"></spring:message></td>
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
						</tr>
						<tr rowname="19.1" unit="1000 FTE">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="2" columnnumber="0"><spring:message
									code="ref543"></spring:message></td>
							<td columnname="1990" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="19"><span class="entry_item_placeholder" id="_fraVariable_19_2_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_19_2_1_}</div></td>
							<td columnname="2000" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="19"><span class="entry_item_placeholder" id="_fraVariable_19_2_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_19_2_2_}</div></td>
							<td columnname="2005" class="prefilled entry-item editable text"
								rownumber="2" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="19"><span class="entry_item_placeholder" id="_fraVariable_19_2_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_19_2_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="2" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="19"><span class="entry_item_placeholder" id="_fraVariable_19_2_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_19_2_4_}</div></td>
						</tr>
						<tr rowname="19.1" unit="1000 FTE">
							<td><img class="cfrq-logo" src="${baseURL}/img/CFRQbutton.png" />
							</td>
							<td class="title" rownumber="3" columnnumber="0"><spring:message
									code="ref544"></spring:message></td>
							<td columnname="1990" class="entry-item editable text"
								rownumber="3" columnnumber="1"
								style="background-color: rgb(242, 245, 169);" entry-id="19"><span class="entry_item_placeholder" id="_fraVariable_19_3_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_19_3_1_}</div></td>
							<td columnname="2000" class="entry-item editable text"
								rownumber="3" columnnumber="2"
								style="background-color: rgb(242, 245, 169);" entry-id="19"><span class="entry_item_placeholder" id="_fraVariable_19_3_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_19_3_2_}</div></td>
							<td columnname="2005" class="entry-item editable text"
								rownumber="3" columnnumber="3"
								style="background-color: rgb(242, 245, 169);" entry-id="19"><span class="entry_item_placeholder" id="_fraVariable_19_3_3_">&#160;</span>
							<div id="cell-content">${_fraVariable_19_3_3_}</div></td>
							<td columnname="2010" class="entry-item editable text"
								rownumber="3" columnnumber="4"
								style="background-color: rgb(242, 245, 169);" entry-id="19"><span class="entry_item_placeholder" id="_fraVariable_19_3_4_">&#160;</span>
							<div id="cell-content">${_fraVariable_19_3_4_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_19_"/>
			<br/>
			<br/>
		</div>
	</section>
	<section>
		<h2>
			19.4
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
									code="ref543"></spring:message></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="158"><span class="entry_item_placeholder" id="_fraVariable_158_1_1_">&#160;</span>
							<div id="cell-content">${_fraVariable_158_1_1_}</div></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="158"><span class="entry_item_placeholder" id="_fraVariable_158_1_2_">&#160;</span>
							<div id="cell-content">${_fraVariable_158_1_2_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_158_"/>
			<br/>
			<br/>
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
								entry-id="159"><span class="entry_item_placeholder" id="_fraVariable_159_1_0_">&#160;</span>
							<div id="cell-content">${_fraVariable_159_1_0_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_159_"/>
			<br/>
			<br/>
		</div>
	</section>
</section>