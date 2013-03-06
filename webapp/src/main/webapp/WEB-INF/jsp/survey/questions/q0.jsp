<%@ include file="../../common/includes/taglibs.jsp"%>
<section>
	<div class="page-header">
		<h1>
			<spring:message code="ref1"></spring:message>
		</h1>
	</div>
	<div>
		<h4>
			<spring:message code="ref2"></spring:message>
		</h4>
		<p>
			<spring:message code="ref3"></spring:message>
		</p>
		<div></div>
		<div class="entry">
		<table
			class="editable extensible table table-bordered table-hover table-condensed table-striped">
			<tbody>
				<tr>
					<td rownumber="0" columnnumber="0"><spring:message code="ref4"></spring:message></td>
					<td rownumber="0" columnnumber="1"><spring:message code="ref5"></spring:message></td>
					<td rownumber="0" columnnumber="2"><spring:message code="ref6"></spring:message></td>
					<td rownumber="0" columnnumber="3"><spring:message code="ref7"></spring:message></td>
					<td class="action-column" width="80px"></td>
				</tr>
				<c:forEach var="row" begin="1" end="${tableRowsCounter0}" >
					<c:set var="entryItemName" value="0" />
					<c:set var="value1" value="_fraVariable_${entryItemName}_${row}_0_" />
					<c:set var="value2" value="_fraVariable_${entryItemName}_${row}_1_" />
					<c:set var="value3" value="_fraVariable_${entryItemName}_${row}_2_" />
					<c:set var="value4" value="_fraVariable_${entryItemName}_${row}_3_" />
					<tr>
						<td rownumber="1" columnnumber="0"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span
							class="entry_item_placeholder" id="${value1}">&nbsp;</span>
							<div id="cell-content">${requestScope[value1]}</div></td>
						<td rownumber="1" columnnumber="1"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span
							class="entry_item_placeholder" id="${value2}">&nbsp;</span>
							<div id="cell-content">${requestScope[value2]}</div></td>
						<td rownumber="1" columnnumber="2"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span
							class="entry_item_placeholder" id="${value3}">&nbsp;</span>
							<div id="cell-content">${requestScope[value3]}</div></td>
						<td rownumber="1" columnnumber="3"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span
							class="entry_item_placeholder" id="${value4}">&nbsp;</span>
							<div id="cell-content">${requestScope[value4]}</div></td>
						<td class="action-column" width="80px"><a href="#"
							class="btn delete-btn"><spring:message code="delete" /></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>



		<%-- <div class="entry">
			<table
				class="editable extensible table table-bordered table-hover table-condensed table-striped">
				<tbody>
					<tr>
						<td rownumber="0" columnnumber="0"><spring:message
								code="ref4"></spring:message></td>
						<td rownumber="0" columnnumber="1"><spring:message
								code="ref5"></spring:message></td>
						<td rownumber="0" columnnumber="2"><spring:message
								code="ref6"></spring:message></td>
						<td rownumber="0" columnnumber="3"><spring:message
								code="ref7"></spring:message></td>
						<td class="action-column" width="80px"></td>
					</tr>
					<tr>
						<td rownumber="1" columnnumber="0"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span class="entry_item_placeholder" id="_fraVariable_0_1_0_">&nbsp;</span>
						<div id="cell-content">${_fraVariable_0_1_0_}</div></td>
						<td rownumber="1" columnnumber="1"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span class="entry_item_placeholder" id="_fraVariable_0_1_1_">&nbsp;</span>
						<div id="cell-content">${_fraVariable_0_1_1_}</div></td>
						<td rownumber="1" columnnumber="2"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span class="entry_item_placeholder" id="_fraVariable_0_1_2_">&nbsp;</span>
						<div id="cell-content">${_fraVariable_0_1_2_}</div></td>
						<td rownumber="1" columnnumber="3"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span class="entry_item_placeholder" id="_fraVariable_0_1_3_">&nbsp;</span>
						<div id="cell-content">${_fraVariable_0_1_3_}</div></td>
						<td class="action-column" width="80px"><a href="#"
							class="btn delete-btn"><spring:message code="delete" /></a></td>
					</tr>
					<tr>
						<td rownumber="2" columnnumber="0"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span class="entry_item_placeholder" id="_fraVariable_0_2_0_">&nbsp;</span>
						<div id="cell-content">${_fraVariable_0_2_0_}</div></td>
						<td rownumber="2" columnnumber="1"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span class="entry_item_placeholder" id="_fraVariable_0_2_1_">&nbsp;</span>
						<div id="cell-content">${_fraVariable_0_2_1_}</div></td>
						<td rownumber="2" columnnumber="2"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span class="entry_item_placeholder" id="_fraVariable_0_2_2_">&nbsp;</span>
						<div id="cell-content">${_fraVariable_0_2_2_}</div></td>
						<td rownumber="2" columnnumber="3"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span class="entry_item_placeholder" id="_fraVariable_0_2_3_">&nbsp;</span>
						<div id="cell-content">${_fraVariable_0_2_3_}</div></td>
						<td class="action-column" width="80px"><a href="#"
							class="btn delete-btn"><spring:message code="delete" /></a></td>
					</tr>
					<tr>
						<td rownumber="3" columnnumber="0"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span class="entry_item_placeholder" id="_fraVariable_0_3_0_">&nbsp;</span>
						<div id="cell-content">${_fraVariable_0_3_0_}</div></td>
						<td rownumber="3" columnnumber="1"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span class="entry_item_placeholder" id="_fraVariable_0_3_1_">&nbsp;</span>
						<div id="cell-content">${_fraVariable_0_3_1_}</div></td>
						<td rownumber="3" columnnumber="2"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span class="entry_item_placeholder" id="_fraVariable_0_3_2_">&nbsp;</span>
						<div id="cell-content">${_fraVariable_0_3_2_}</div></td>
						<td rownumber="3" columnnumber="3"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span class="entry_item_placeholder" id="_fraVariable_0_3_3_">&nbsp;</span>
						<div id="cell-content">${_fraVariable_0_3_3_}</div></td>
						<td class="action-column" width="80px"><a href="#"
							class="btn delete-btn"><spring:message code="delete" /></a></td>
					</tr>
					<tr>
						<td rownumber="4" columnnumber="0"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span class="entry_item_placeholder" id="_fraVariable_0_4_0_">&nbsp;</span>
						<div id="cell-content">${_fraVariable_0_4_0_}</div></td>
						<td rownumber="4" columnnumber="1"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span class="entry_item_placeholder" id="_fraVariable_0_4_1_">&nbsp;</span>
						<div id="cell-content">${_fraVariable_0_4_1_}</div></td>
						<td rownumber="4" columnnumber="2"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span class="entry_item_placeholder" id="_fraVariable_0_4_2_">&nbsp;</span>
						<div id="cell-content">${_fraVariable_0_4_2_}</div></td>
						<td rownumber="4" columnnumber="3"
							class="entry-item editable text"
							style="background-color: rgb(242, 245, 169);" entry-id="0"><span class="entry_item_placeholder" id="_fraVariable_0_4_3_">&nbsp;</span>
						<div id="cell-content">${_fraVariable_0_4_3_}</div></td>
						<td class="action-column" width="80px"><a href="#"
							class="btn delete-btn"><spring:message code="delete" /></a></td>
					</tr>
				</tbody>
			</table>
		</div> --%>
		
		
		<div class="control pull-right">
			<a  href="#" class="btn btn-mini addBtn"><spring:message code="add.row" /></a>
		</div>
		<br>
		<br>
	</div>
	<div>
		<h4>
			<spring:message code="ref8"></spring:message>
		</h4>
		<p>
			<spring:message code="ref9"></spring:message>
		</p>
		<div></div>
		<div class="entry">
			<fra:richtextentry  name="_fraVariable_1_"></fra:richtextentry>
		</div>
		<div class="control pull-right"></div>
		<br>
		<br>
	</div>
</section>