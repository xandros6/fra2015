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
					<th></th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items='${surveys}' var='survey' varStatus='rowItem'>
					<c:set scope="page" var="submitAllowed" value="enabled" />
					
					<c:if test="${survey.status.status != 'underreview'}">
						<c:set scope="page" var="submitAllowed" value="disabled" />
					</c:if>
					
					<c:if test="${survey.status.status == 'underreview'}">
						<c:if test="${fn:contains(survey.status.reviewerSubmit, username)}">
							<!-- In this case the user have already submitted -->
							<c:set scope="page" var="submitAllowed" value="disabled" />
						</c:if>
					</c:if>
					
					<tr class="rowItem">
						<td>
							<spring:message code="country.${survey.country.iso3}" text=""></spring:message> (${survey.country.iso3})
						</td>
						
						<!-- <td>TODO</td>  -->
						<td><spring:message code="survey.status.${survey.status.status}"></spring:message></td>
						<td>
							<a href="../survey/review/${survey.country.iso3}/0" class="btn"><spring:message code="surveylist.view"></spring:message></a>
							<a href="../reviewersubmit/${survey.country.iso3}" class="btn ${submitAllowed}"><spring:message code="surveylist.submit"></spring:message></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- ul class="pager pull-right">
			<c:if test="${prev}">
			<li class="${prev?'':'disabled'}"><a href="${prev?page-1:'#'}"><spring:message code="prev"></spring:message></a></li>
			</c:if>
			<c:if test="${next}">
			<li class="${next?'':'disabled'}"><a href="${next?page+1:'#'}"><spring:message code="next"></spring:message></a></li>
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
	
    <script type="text/javascript">		
		// Disable the onClick event if the submit buttons are disabled (because the button is an anchor not a button)
		$('body').on('click', 'a.disabled', function(event) {
		    event.preventDefault();
		});	
	</script>
</div>