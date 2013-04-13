<%@ include file="../../common/includes/taglibs.jsp"%>
<section>
	<div class="page-header">
		<h1>
			12.
			<spring:message code="ref397"></spring:message>
		</h1>
	</div>
	<p class="lead">
		<spring:message code="refq12faq"></spring:message>
	</p>
	<section>
		<h2>
			12.1
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
									code="ref398"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref399"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref400"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref401"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br>
			<br>
		</div>
	</section>
	<section>
		<h2>
			12.2
			<spring:message code="ref33"></spring:message>
		</h2>
		<section>
			<h3>
				12.2.1
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
							
							<fra:DynamicTableTag numOfColoumn="4" entryItemName="110" numericColoumn="true"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_110_"/>
				<br>
				<br>
			</div>
		</section>
		<section>
			<h3>
				12.2.2
				<spring:message code="ref42"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<table
						class="extensible editable table table-bordered table-hover table-condensed table-striped">
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
							
							<fra:DynamicTableTag numOfColoumn="2" entryItemName="111" numericColoumn="false"/>
							
						</tbody>
					</table>
				</div>
				<div class="control clearfix">
					<c:if test="${profile == 'CONTRIBUTOR' && fra:isContributorEditable(status)}">
						<a  href="#" class="btn btn-mini pull-right addBtn"><spring:message code="add.row" /></a>
					</c:if>
				</div>
				<fra:feedback feedbackName="_feedback_111_"/>
				<br>
				<br>
			</div>
		</section>
		<section>
			<h3>
				12.2.3
				<spring:message code="ref44"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_112_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_112_"/>
				<br>
				<br>
			</div>
		</section>
	</section>
	<section>
		<h2>
			12.3
			<spring:message code="ref45"></spring:message>
		</h2>
		<section>
			<h3>
				12.3.1
				<spring:message code="ref46"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_113_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_113_"/>
				<br>
				<br>
			</div>
		</section>
		<section>
			<h3>
				12.3.2
				<spring:message code="ref47"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_114_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_114_"/>
				<br>
				<br>
			</div>
		</section>
		<section>
			<h3>
				12.3.3
				<spring:message code="ref48"></spring:message>
			</h3>
			<div>
				<div></div>
				<div class="entry">
					<fra:richtextentry name="_fraVariable_115_"></fra:richtextentry>
				</div>
				<div class="control clearfix"></div>
				<fra:feedback feedbackName="_feedback_115_"/>
				<br>
				<br>
			</div>
		</section>
	</section>
	<section>
		<h2>
			12.4
			<spring:message code="ref49"></spring:message>
		</h2>
		<div>
			<h4>
				<spring:message code="ref402"></spring:message>
			</h4>
			<div></div>
			<div class="entry">
				<table
					class="editable table table-bordered table-hover table-condensed table-striped">
					<tbody>
						<tr>
							<td colspan="2" rownumber="0" columnnumber="0"><spring:message
									code="ref65"></spring:message></td>
							<td rownumber="0" columnnumber="1"><spring:message
									code="ref403"></spring:message></td>
						</tr>
						<tr rowname="12.1" unit="1000 ha">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="1" columnnumber="0"><spring:message
									code="ref398"></spring:message></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="12"><span class="entry_item_placeholder" id="_fraVariable_12_1_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_12_1_1_}</div></td>
						</tr>
						<tr rowname="12.1.1" unit="1000 ha">
							<td><img class="cfrq-logo" src="${pageContext.request.contextPath}/img/CFRQbutton.png">
							</td>
							<td class="title" rownumber="2" columnnumber="0"><spring:message
									code="ref404"></spring:message></td>
							<td class="prefilled entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="12"><span class="entry_item_placeholder" id="_fraVariable_12_2_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_12_2_1_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_12_"/>
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
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref398"></spring:message></td>
							<td class="tier entry-item" rownumber="1" columnnumber="1"
								entry-id="116"><div id="cell-content">
									<fra:tiers name="_fraVariable_116_1_1_"><option
											selected="selected">---</option>
										<option value="Tier 1">Tier 1</option>
										<option value="Tier 2">Tier 2</option>
										<option value="Tier 3">Tier 3</option></fra:tiers>
								</div></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref405"></spring:message></td>
							<td class="tier entry-item" rownumber="2" columnnumber="1"
								entry-id="116"><div id="cell-content">
									<fra:tiers name="_fraVariable_116_2_1_"><option
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
			<fra:feedback feedbackName="_feedback_116_"/>
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
						</tr>
						<tr>
							<td rownumber="1" columnnumber="0"><spring:message
									code="ref398"></spring:message></td>
							<td rownumber="1" columnnumber="1"><spring:message
									code="ref406"></spring:message></td>
						</tr>
						<tr>
							<td rownumber="2" columnnumber="0"><spring:message
									code="ref405"></spring:message></td>
							<td rownumber="2" columnnumber="1"><spring:message
									code="ref406"></spring:message></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<br>
			<br>
		</div>
	</section>
	<section>
		<h2>
			12.5
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
							<td class="title" rownumber="1" columnnumber="0"><spring:message
									code="ref398"></spring:message></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="118"><span class="entry_item_placeholder" id="_fraVariable_118_1_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_118_1_1_}</div></td>
							<td class="entry-item editable text" rownumber="1"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="118"><span class="entry_item_placeholder" id="_fraVariable_118_1_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_118_1_2_}</div></td>
						</tr>
						<tr>
							<td class="title" rownumber="2" columnnumber="0"><spring:message
									code="ref405"></spring:message></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="1" style="background-color: rgb(242, 245, 169);"
								entry-id="118"><span class="entry_item_placeholder" id="_fraVariable_118_2_1_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_118_2_1_}</div></td>
							<td class="entry-item editable text" rownumber="2"
								columnnumber="2" style="background-color: rgb(242, 245, 169);"
								entry-id="118"><span class="entry_item_placeholder" id="_fraVariable_118_2_2_">&nbsp;</span>
							<div id="cell-content">${_fraVariable_118_2_2_}</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="control clearfix"></div>
			<fra:feedback feedbackName="_feedback_118_"/>
			<br>
			<br>
		</div>
	</section>
</section>