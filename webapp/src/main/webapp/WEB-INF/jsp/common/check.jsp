<%@ include file="../common/includes/taglibs.jsp"%>
		
				<c:if
					test="${not empty validationResult && !validationResult.success}">

					<div id="messagePanel" class="alert alert-error">
						<spring:message code="error.violateconstraints"></spring:message>
						<ul>
							<c:forEach var="mess" items="${validationResult.errorMessages}">
								<c:if test="${ !mess.success }">
									<li><spring:message code="${mess.message}"></spring:message>:
										<c:forEach var="el" items="${mess.sortedElements}">
					 				${el},
					 		
					 				</c:forEach></li>
								</c:if>

							</c:forEach>
						</ul>

					</div>
				</c:if>
				<c:if test="${not empty validationResult.successMessages}">
					<div id="messagePanel" class="alert alert-success">
						<spring:message code="alert.passedcontraints"></spring:message>
						<ul>
							<c:forEach var="mess" items="${validationResult.messages}">

								<c:if test="${mess.success}">
									<li><spring:message code="${mess.message}"></spring:message></li>
								</c:if>
							</c:forEach>
						</ul>

					</div>
				</c:if>
				