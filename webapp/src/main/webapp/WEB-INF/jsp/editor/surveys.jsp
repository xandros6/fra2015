<%@ include file="../common/includes/taglibs.jsp"%>

<div>
	<div class="container">
		<c:if test="${paginationEnable}">
			<div class="pagination pagination-centered">
	          <ul>
	            <c:if test="${not empty pagination.firstPage}">
	            <li><a href="${pagination.firstPage}"><spring:message code="first"></spring:message></a></li>
	            </c:if>
	            <c:if test="${empty pagination.firstPage}">
	              <li class="disabled"><a href="#"><spring:message code="first"></spring:message></a></li>
	            </c:if>
	            
	            <c:if test="${not empty pagination.prev1}">
	            <li><a href="${pagination.prev1}"><spring:message code="prev"></spring:message></a></li>
	            </c:if>
	            <c:if test="${empty pagination.prev1}">
	              <li class="disabled"><a href="#"><spring:message code="prev"></spring:message></a></li>
	            </c:if>
	            
	            <c:if test="${not empty pagination.prev2}">
	            <li><a href="${pagination.prev2}">${pagination.prev2+1}</a></li>
	            </c:if>
	            <c:if test="${empty pagination.prev2}">
	              <li class="disabled"><a href="#"> - </a></li>
	            </c:if>
	            
	            <c:if test="${not empty pagination.prev1}">
	            <li><a href="${pagination.prev1}">${pagination.prev1+1}</a></li>
	            </c:if>
	            <c:if test="${empty pagination.prev1}">
	              <li class="disabled"><a href="#"> - </a></li>
	            </c:if>
	            
	            <li class="disabled"><a href="#" style="background-color: #0088CC;color:white;">${pagination.currentPage+1}</a></li>
	            
	            <c:if test="${not empty pagination.next1}">
	              <li><a href="${pagination.next1}">${pagination.next1+1}</a></li>
	            </c:if>
	            <c:if test="${empty pagination.next1}">
	              <li class="disabled"><a href="#"> - </a></li>
	            </c:if>
	            
	            <c:if test="${not empty pagination.next2}">
	              <li><a href="${pagination.next2}">${pagination.next2+1}</a></li>
	            </c:if>
	            <c:if test="${empty pagination.next2}">
	              <li class="disabled"><a href="#"> - </a></li>
	            </c:if>
	            
	            <c:if test="${not empty pagination.next1}">
	              <li><a href="${pagination.next1}"><spring:message code="next"></spring:message></a></li>
	            </c:if>
	            <c:if test="${empty pagination.next1}">
	              <li class="disabled"><a href="#"><spring:message code="next"></spring:message></a></li>
	            </c:if>
	            
	            <c:if test="${not empty pagination.lastPage}">
	              <li><a href="${pagination.lastPage}"><spring:message code="last"></spring:message></a></li>
	            </c:if>
	            <c:if test="${empty pagination.lastPage}">
	              <li class="disabled"><a href="#"><spring:message code="last"></spring:message></a></li>
	            </c:if>            
	          </ul>
	        </div>
		</c:if>
        
        <form:form id="filterSurveyForm" commandName="surveyFilter"  method="post" action="filter">
			<table id="surveyListTable"
				class="table table-bordered table-hover table-condensed">
				<thead>
					<tr>
						<th class="center">Survey</th>
						<!-- <th>Last update</th>  -->
						<th class="center">Status</th>
						<th class="center">Reviewer complete</th>
						<th class="center">Revision coverage</th>
						<th class="center">Reviewer submissions</th>
						<th class="center"></th>
						<th class="center">Submit</th>
					</tr>
					<tr>
	              		<th>
		              		<div class="input-append"  align="center">
				                <input id="filter_countries" type="text" class="span2 input-small ui-autocomplete-input" autocomplete="off"/>     
				                <form:input path="country" name="country" type="hidden" id="country"/>   
				                <span class="add-on">
				                  <i id="surveyFilterBtn" class="icon-filter"> </i>
				                </span>          
				                <span class="add-on">
				                  <i id="filter_country_clear_btn" class="icon-remove-sign"> </i>
				                </span>
			                </div>
	              		</th>
	              		<th colspan="7">
	              		</th>
	              	</tr>
				</thead>
<!-- 				<thead> -->
<!-- 		            <tr> -->
<!-- 		              <th colspan="8" style="text-align: right;"> -->
<!-- 		                <button class="btn" type="button" id="surveyFilterBtn"> -->
<!-- 		                	<i class="icon-filter"></i> -->
<%-- 		                	<spring:message code="filter"></spring:message> --%>
<!-- 		                </button> -->
<!-- 		              </th> -->
<!-- 		            </tr> -->
<!-- 		        </thead> -->
				<tbody>
					<c:forEach items='${surveys}' var='survey' varStatus='rowItem'>
						<c:set scope="page" var="countryIso3" value="${survey.country.iso3}" />
						
						<c:set scope="page" var="pendingFixEnabled" value="" />
						<c:set scope="page" var="completeEnabled" value="" />
						<c:set scope="page" var="notifyEnabled" value="" />
						
						<c:if test="${survey.status.status != 'underreview'}">
							<c:set scope="page" var="pendingFixEnabled" value="disabled" />
						</c:if>
						<c:if test="${survey.status.status != 'underreview'}">
							<c:set scope="page" var="completeEnabled" value="disabled" />
						</c:if>
						<c:if test="${survey.status.status != 'underreview'}">
							<c:set scope="page" var="notifyEnabled" value="disabled" />
						</c:if>					
						<c:if test="${survey.status.status == 'compiled'}">
							<c:set scope="page" var="notifyEnabled" value="enabled" />
						</c:if>
						
						<tr class="rowItem">
							<td class="centercountry">
								<spring:message code="country.${survey.country.iso3}" text=""></spring:message> (${survey.country.iso3})
							</td>
							
							<!-- <td>TODO</td> -->
	
							<td class="center"><spring:message
									code="survey.status.${survey.status.status}"></spring:message></td>
							<%-- 								<td>${user.countries}</td> --%>
							<td class="center flat">
								<c:choose>
									<c:when test="${empty survey.status.reviewerSubmit}">
										<div  style="text-align: center">No submission yet</div>
									</c:when>
									<c:otherwise>
										<div  style="text-align: center">${fn:replace(survey.status.reviewerSubmit, ";", " ")}</div>
									</c:otherwise>
								</c:choose>
							</td>
							<td class="center flat">
								<c:choose>
									<c:when test="${empty survey.status.coverage}">
										<div style="text-align: center"> 0 / 22 </div>
									</c:when>
									<c:otherwise>
										<div style="text-align: center">${survey.status.coverage}</div>
									</c:otherwise>
								</c:choose>
							</td>
							<td class="center flat">
								<c:choose>
									<c:when test="${not empty survey.reviewerSubmissions and survey.status.status == 'underreview'}">
										<div style="text-align: center">${survey.reviewerSubmissions}</div>
									</c:when>
								</c:choose>
							</td>
							<td class="center">
								<a href="../survey/review/${survey.country.iso3}/0"
								class="btn"><spring:message code="editor.surveylist.view"></spring:message></a>
							</td>
							<td class="centercountry">
								<a data-toggle="modal" data-country="${survey.country.iso3}" href="#pendingConfirm" class="btn ${pendingFixEnabled} pendingConfirm">
									<spring:message code="editor.surveylist.pending"></spring:message></a> 
								<a data-toggle="modal"  data-country="${survey.country.iso3}" href="#completedConfirm" class="btn ${completeEnabled} completedConfirm">
									<spring:message code="editor.surveylist.completed"></spring:message></a>
								<a data-toggle="modal"  data-country="${survey.country.iso3}" href="#sendNotification" class="btn ${notifyEnabled} sendNotification">
									<spring:message	code="editor.surveylist.notify"></spring:message></a>
							</td>
						</tr>
					</c:forEach>
	
				</tbody>
			</table>
		</form:form>
		
		<!-- ul class="pager pull-right">
			<c:if test="${prev}">
				<li class="${prev?'':'disabled'}"><a href="${prev?page-1:'#'}"><spring:message
							code="prev"></spring:message></a></li>
			</c:if>
			<c:if test="${next}">
				<li class="${next?'':'disabled'}"><a href="${next?page+1:'#'}"><spring:message
							code="next"></spring:message></a></li>
			</c:if>
		</ul -->
		
		<c:if test="${paginationEnable}">
			<div class="pagination pagination-centered">
	          <ul>
	            <c:if test="${not empty pagination.firstPage}">
	            <li><a href="${pagination.firstPage}"><spring:message code="first"></spring:message></a></li>
	            </c:if>
	            <c:if test="${empty pagination.firstPage}">
	              <li class="disabled"><a href="#"><spring:message code="first"></spring:message></a></li>
	            </c:if>
	            
	            <c:if test="${not empty pagination.prev1}">
	            <li><a href="${pagination.prev1}"><spring:message code="prev"></spring:message></a></li>
	            </c:if>
	            <c:if test="${empty pagination.prev1}">
	              <li class="disabled"><a href="#"><spring:message code="prev"></spring:message></a></li>
	            </c:if>
	            
	            <c:if test="${not empty pagination.prev2}">
	            <li><a href="${pagination.prev2}">${pagination.prev2+1}</a></li>
	            </c:if>
	            <c:if test="${empty pagination.prev2}">
	              <li class="disabled"><a href="#"> - </a></li>
	            </c:if>
	            
	            <c:if test="${not empty pagination.prev1}">
	            <li><a href="${pagination.prev1}">${pagination.prev1+1}</a></li>
	            </c:if>
	            <c:if test="${empty pagination.prev1}">
	              <li class="disabled"><a href="#"> - </a></li>
	            </c:if>
	            
	            <li class="disabled"><a href="#" style="background-color: #0088CC;color:white;">${pagination.currentPage+1}</a></li>
	            
	            <c:if test="${not empty pagination.next1}">
	              <li><a href="${pagination.next1}">${pagination.next1+1}</a></li>
	            </c:if>
	            <c:if test="${empty pagination.next1}">
	              <li class="disabled"><a href="#"> - </a></li>
	            </c:if>
	            
	            <c:if test="${not empty pagination.next2}">
	              <li><a href="${pagination.next2}">${pagination.next2+1}</a></li>
	            </c:if>
	            <c:if test="${empty pagination.next2}">
	              <li class="disabled"><a href="#"> - </a></li>
	            </c:if>
	            
	            <c:if test="${not empty pagination.next1}">
	              <li><a href="${pagination.next1}"><spring:message code="next"></spring:message></a></li>
	            </c:if>
	            <c:if test="${empty pagination.next1}">
	              <li class="disabled"><a href="#"><spring:message code="next"></spring:message></a></li>
	            </c:if>
	            
	            <c:if test="${not empty pagination.lastPage}">
	              <li><a href="${pagination.lastPage}"><spring:message code="last"></spring:message></a></li>
	            </c:if>
	            <c:if test="${empty pagination.lastPage}">
	              <li class="disabled"><a href="#"><spring:message code="last"></spring:message></a></li>
	            </c:if>          
	          </ul>
	        </div>
		</c:if>

	</div>

	<div id="pendingConfirm" class="modal hide fade span8">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">x</button>
			<h3>
				<spring:message code="editor.submit"></spring:message>
			</h3>
		</div>

		<div id="modal-body" class="modal-body">
			<spring:message code="editor.surveylist.pending.msg"></spring:message>
      <br />
      <label class="checkbox inline"> 
        <input type="hidden" name="modalDataCountry" id="modalDataCountry" />
        <input type="checkbox" name="sendContributorsEmails" type="checkbox" id="sendContributorsEmails" checked="checked"/>
        <spring:message code="editor.surveylist.pending.emailmsg"></spring:message>
      </label>
      <br />
      <br /> 
        <b><spring:message code="editor.surveylist.alert"></spring:message></b>
      <br />
    </div>  

		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal"><spring:message
					code="close"></spring:message></a> 
			<a id="pendingConfirmBtn" href="#" class="btn btn-primary confirm"><spring:message code="editor.surveylist.pending"></spring:message></a>
		</div>
	</div>

	<div id="completedConfirm" class="modal hide fade span8">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">x</button>
			<h3>
				<spring:message code="editor.submit"></spring:message>
			</h3>
		</div>

		<div id="modal-body" class="modal-body">
			<spring:message code="editor.surveylist.completed.msg"></spring:message>
			<br /> <b><spring:message code="editor.surveylist.alert"></spring:message></b>
		</div>

		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal"><spring:message
					code="close"></spring:message></a> <a id="updateBtn"
				href="#"
				class="btn btn-primary confirm"><spring:message code="editor.surveylist.completed"></spring:message></a>
		</div>
	</div>
	
    <div id="sendNotification" class="modal hide fade span8">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">x</button>
			<h3>
				<spring:message code="editor.notify"></spring:message>
			</h3>
		</div>

		<div id="modal-body" class="modal-body">
			<spring:message code="editor.surveylist.notify.msg"></spring:message>
			<br /> 
			<b><spring:message code="editor.surveylist.alert"></spring:message></b>
		</div>

		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">
				<spring:message code="close"></spring:message></a> 
			<a id="updateBtn" href="#" class="btn btn-primary confirm">
				<spring:message code="editor.surveylist.notify"></spring:message></a>
		</div>
	</div>
	
	<script type="text/javascript">
		$(function(){
			var sethref 
			$('.completedConfirm').click(function(){
				$('#completedConfirm .confirm').attr('href','../editorCompleted/'+$(this).attr('data-country'));				
			})
			$('.pendingConfirm').click(function(){
				$('#sendContributorsEmails').prop("checked", true);
				$('#modalDataCountry').val($(this).attr('data-country'));				
				$('#pendingConfirm .confirm').attr('href','../editorPendingFix/'+$(this).attr('data-country')+"/1");
			});
			
			$('.sendNotification').click(function(){
				$('#sendNotification .confirm').attr('href','../editorNotify/'+$(this).attr('data-country'));
			});
			
			$('#sendContributorsEmails').change(function(){
				 var sendContributorsEmails = $(this).prop('checked');
				 $('#pendingConfirm .confirm').attr('href','../editorPendingFix/'+$('#modalDataCountry').val()+'/'+(sendContributorsEmails|0));
			 });
		});
		
		// Disable the onClick event if the submit buttons are disabled (because the button is an anchor not a button)
		$('body').on('click', 'a.disabled', function(event) {
		    event.stopImmediatePropagation();
		});	
	</script>

</div>