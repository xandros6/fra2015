<%@ include file="../common/includes/taglibs.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../common/includes/javascript.jsp"%>
<jsp:useBean id="dateValue" class="java.util.Date" />

<div>
	<div class="container">
		<h1>
			<spring:message code="summaryStatus.title" text=""/>
		</h1>
		
		<table id="summaryStatusListTable"
			class="table table-bordered table-hover table-condensed">
			<thead>
				<tr>
				    <th>Country Name</th>
					<th>Latest Contributor Submit</th>
					<th>Latest Reviewer Submit</th>
					<th>Latest Pending Fix Submit</th>
					<th>Latest Acceptance Request</th>
					<th>Current Status</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items='${surveys}' var='survey' varStatus='rowItem'>
					<c:set scope="page" var="countryIso3" value="${survey.country.iso3}" />
					
					<c:set scope="page" var="countryIso3" value="${survey.status.status}" />
					
					<tr class="rowItem">
						<td>${survey.country.name} ( ${survey.country.iso3} )</td>

						<td>
							<c:choose>
							      <c:when test="${survey.status.lastContributorSubmission != null}">
									  <jsp:setProperty name="dateValue" property="time"
											value="${survey.status.lastContributorSubmission}" />
									  <fmt:formatDate value="${dateValue}"
											pattern="MM/dd/yyyy HH:mm" />
							      </c:when>
							
							      <c:otherwise>
							      		${survey.status.lastContributorSubmission}
							      </c:otherwise>
							</c:choose>
						</td>
						
						<td>
							<c:choose>
							      <c:when test="${survey.status.lastSurveyReview != null}">
									  <jsp:setProperty name="dateValue" property="time"
											value="${survey.status.lastSurveyReview}" />
									  <fmt:formatDate value="${dateValue}"
											pattern="MM/dd/yyyy HH:mm" />
							      </c:when>
							
							      <c:otherwise>
							      		${survey.status.lastSurveyReview}
							      </c:otherwise>
							</c:choose>
						</td>
						
						<td>
							<c:choose>
							      <c:when test="${survey.status.lastPendingFixSubmit != null}">
									  <jsp:setProperty name="dateValue" property="time"
											value="${survey.status.lastPendingFixSubmit}" />
									  <fmt:formatDate value="${dateValue}"
											pattern="MM/dd/yyyy HH:mm" />
							      </c:when>
							
							      <c:otherwise>
							      		${survey.status.lastPendingFixSubmit}
							      </c:otherwise>
							</c:choose>
						</td>
						
						<td>
							<c:choose>
							      <c:when test="${survey.status.lastAcceptanceRequest != null}">
									  <jsp:setProperty name="dateValue" property="time"
											value="${survey.status.lastAcceptanceRequest}" />
									  <fmt:formatDate value="${dateValue}"
											pattern="MM/dd/yyyy HH:mm" />
							      </c:when>
							
							      <c:otherwise>
							      		${survey.status.lastAcceptanceRequest}
							      </c:otherwise>
							</c:choose>
						</td>
						
						<td>
							<spring:message code="survey.status.${survey.status.status}" text=""></spring:message>
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
		</ul-->
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
</div>

