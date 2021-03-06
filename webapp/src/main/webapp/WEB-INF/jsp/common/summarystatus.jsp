<%@ include file="../common/includes/taglibs.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../common/includes/javascript.jsp"%>
<jsp:useBean id="dateValue" class="java.util.Date" />

<div>
	<div class="container">
		<h1>
			<spring:message code="summaryStatus.title" text=""/>
		</h1>
		
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
        
		<table id="summaryStatusListTable"
			class="table table-bordered table-condensed">
			<thead>
				<tr>
				    <th class="country center"><spring:message code="summaryStatus.name" text=""></spring:message></th>
				    <th class="center"><spring:message code="summaryStatus.iso" text=""></spring:message></th>
					<th class="timestamp center"><spring:message code="summaryStatus.contsubmit" text=""></spring:message></th>
					<th class="timestamp center"><spring:message code="summaryStatus.revsubmit" text=""></spring:message></th>
					<th class="timestamp center"><spring:message code="summaryStatus.pendsubmit" text=""></spring:message></th>
					<th class="timestamp center"><spring:message code="summaryStatus.lastaccept" text=""></spring:message></th>
					<th class="timestamp center"><spring:message code="summaryStatus.acceptance" text=""></spring:message></th>
					<th class="center"><spring:message code="summaryStatus.status" text=""></spring:message></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items='${surveys}' var='survey' varStatus='rowItem'>		
				
					<c:set scope="page" var="timestampName" value="${fra:getLatestTimestamp(survey.status)}" />
								
					<tr class="rowItem">
						<td class="centercountry">
							<spring:message code="country.${survey.country.iso3}" text=""></spring:message>
						</td>

						<td class="center">${survey.country.iso3}</td>
						
						<td class="${timestampName != 'lContSubmit'  ? 'center' : 'centerHighlight'}">
							<c:choose>
							      <c:when test="${survey.status.lastContributorSubmission != null}">
									  <jsp:setProperty name="dateValue" property="time"
											value="${survey.status.lastContributorSubmission}" />
									  <fmt:formatDate value="${dateValue}"
											pattern="dd/MM/yyyy HH:mm" />
							      </c:when>
							
							      <c:otherwise>
							      		${survey.status.lastContributorSubmission}
							      </c:otherwise>
							</c:choose>
						</td>
						
						<td class="${timestampName != 'lRevSubmit' ? 'center' : 'centerHighlight'}">
							<c:choose>
							      <c:when test="${survey.status.lastSurveyReview != null}">
									  <jsp:setProperty name="dateValue" property="time"
											value="${survey.status.lastSurveyReview}" />
									  <fmt:formatDate value="${dateValue}"
											pattern="dd/MM/yyyy HH:mm" />
							      </c:when>
							
							      <c:otherwise>
							      		${survey.status.lastSurveyReview}
							      </c:otherwise>
							</c:choose>
						</td>
						
						<td class="${timestampName != 'lPendSubmit' ? 'center' : 'centerHighlight'}">
							<c:choose>
							      <c:when test="${survey.status.lastPendingFixSubmit != null}">
									  <jsp:setProperty name="dateValue" property="time"
											value="${survey.status.lastPendingFixSubmit}" />
									  <fmt:formatDate value="${dateValue}"
											pattern="dd/MM/yyyy HH:mm" />
							      </c:when>
							
							      <c:otherwise>
							      		${survey.status.lastPendingFixSubmit}
							      </c:otherwise>
							</c:choose>
						</td>
						
						<td class="${timestampName != 'lAcceptReq' ? 'center' : 'centerHighlight'}">
							<c:choose>
							      <c:when test="${survey.status.lastAcceptanceRequest != null}">
									  <jsp:setProperty name="dateValue" property="time"
											value="${survey.status.lastAcceptanceRequest}" />
									  <fmt:formatDate value="${dateValue}"
											pattern="dd/MM/yyyy HH:mm" />
							      </c:when>
							
							      <c:otherwise>
							      		${survey.status.lastAcceptanceRequest}
							      </c:otherwise>
							</c:choose>
						</td>
						
					    <td class="${timestampName != 'lAccept' ? 'center' : 'centerHighlight'}">
							<c:choose>
							      <c:when test="${survey.status.lastStatusAccepted != null}">
									  <jsp:setProperty name="dateValue" property="time"
											value="${survey.status.lastStatusAccepted}" />
									  <fmt:formatDate value="${dateValue}"
											pattern="dd/MM/yyyy HH:mm" />
							      </c:when>
							
							      <c:otherwise>
							      		${survey.status.lastStatusAccepted}
							      </c:otherwise>
							</c:choose>
						</td>
						
						<td class="center">
							<spring:message code="survey.status.${survey.status.status}" text=""></spring:message>
						</td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
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

