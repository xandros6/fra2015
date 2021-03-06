<%@ include file="../common/includes/taglibs.jsp"%>
<div>
	<div class="container">
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
        
		<table id="surveyListTable"
			class="table table-bordered table-hover table-condensed">
			<thead>
				<tr>
					<th>Survey</th>
					<!-- <th>Last update</th>  -->
					<th>Status</th>
					<th>Reviewer complete</th>
					<th>Revision coverage</th>
					<th></th>
					<th>Submit</th>
				</tr>
			</thead>
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
					
					<tr class="rowItem">
						<td>
							<spring:message code="country.${survey.country.iso3}" text=""></spring:message> (${survey.country.iso3})
						</td>
						
						<!-- <td>TODO</td> -->

						<td><spring:message
								code="survey.status.${survey.status.status}"></spring:message></td>
						<%-- 								<td>${user.countries}</td> --%>
						<td>
							<c:choose>
								<c:when test="${empty survey.status.reviewerSubmit}">
									<div  style="text-align: center">No submission yet</div>
								</c:when>
								<c:otherwise>
									<div  style="text-align: center">${fn:replace(survey.status.reviewerSubmit, ";", " ")}</div>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${empty survey.status.coverage}">
									<div style="text-align: center"> 0 / 22 </div>
								</c:when>
								<c:otherwise>
									<div style="text-align: center">${survey.status.coverage}</div>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<a href="../survey/review/${survey.country.iso3}/0"
							class="btn"><spring:message code="editor.surveylist.view"></spring:message></a>
						</td>
						<td>
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
			<br /> <b><spring:message code="editor.surveylist.alert"></spring:message></b>
		</div>

		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal"><spring:message
					code="close"></spring:message></a> <a id="updateBtn"
				href="../editorPendingFix/${countryIso3}"
				class="btn btn-primary confirm"><spring:message
					code="editor.surveylist.pending"></spring:message></a>
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
				$('#pendingConfirm .confirm').attr('href','../editorPendingFix/'+$(this).attr('data-country'));
			});
			
			$('.sendNotification').click(function(){
				$('#sendNotification .confirm').attr('href','../editorNotify/'+$(this).attr('data-country'));
			});
		});
		
		// Disable the onClick event if the submit buttons are disabled (because the button is an anchor not a button)
		$('body').on('click', 'a.disabled', function(event) {
		    event.stopImmediatePropagation();
		});	
	</script>

</div>