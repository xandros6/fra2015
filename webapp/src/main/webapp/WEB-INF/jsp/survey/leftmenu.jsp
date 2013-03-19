<%@ include file="../common/includes/taglibs.jsp" %>

<div class="span4">
	<a href="#"id ="hide-menu"><spring:message code="left.hidemenu"></spring:message></a>
	<div class="in" id="left-menu">
		<div id="navbar-accordion" class="accordion">
		<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 0)}">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="#groupid_6cn3etp4x6r"
						 data-toggle="collapse"><spring:message
							code="ref0"></spring:message></a>
				</div>
				<div id="groupid_6cn3etp4x6r" class="accordion-body ${question == 0 ? "collapse in" : "collapse"}">
					<div class="accordion-inner">
						<p>
							<a href="0" class="tab"><div>
									<spring:message code="ref1"></spring:message>
								</div></a>
						</p>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 2) || fn:contains(allowedQuestions, 1)}">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="#groupid_27medwbfbt9"
						 data-toggle="collapse"><spring:message
							code="ref10"></spring:message></a>
				</div>
				<div id="groupid_27medwbfbt9" class="accordion-body ${1<= question && question <=2  ? "collapse in" : "collapse"}"">
					
					<div class="accordion-inner">
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 1)}">
						<p>
							<a href="1" class="tab"><div>
									1.
									<spring:message code="ref11"></spring:message>
								</div></a>
						</p>
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 2)}">
						<p>
							<a href="2" class="tab"><div>
									2.
									<spring:message code="ref89"></spring:message>
								</div></a>
						</p>
						</c:if>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 3) || fn:contains(allowedQuestions, 4)}">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="#groupid_0bftx6o5hfr"
						 data-toggle="collapse"><spring:message
							code="ref129"></spring:message></a>
				</div>
				<div id="groupid_0bftx6o5hfr" class="accordion-body ${3<= question && question <=4  ? "collapse in" : "collapse"}"">
					<div class="accordion-inner">
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 3)}">
						<p>
							<a href="3" class="tab"><div>
									3.
									<spring:message code="ref130"></spring:message>
								</div></a>
						</p>
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 4)}">
						<p>
							<a href="4" class="tab"><div>
									4.
									<spring:message code="ref215"></spring:message>
								</div></a>
						</p>
						</c:if>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 5)}">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="#groupid_bzh13gzaor"
						 data-toggle="collapse"><spring:message
							code="ref258"></spring:message></a>
				</div>
				<div id="groupid_bzh13gzaor" class="accordion-body ${ question ==5  ? "collapse in" : "collapse"}"">
					<div class="accordion-inner">
						<p>
							<a href="5" class="tab"><div>
									5.
									<spring:message code="ref259"></spring:message>
								</div></a>
						</p>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 6)}">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="#groupid_1zxhjiz4cxr"
						 data-toggle="collapse"><spring:message
							code="ref309"></spring:message></a>
				</div>
				<div id="groupid_1zxhjiz4cxr" class="accordion-body ${ question ==6  ? "collapse in" : "collapse"}"">
					<div class="accordion-inner">
						<p>
							<a href="6" class="tab"><div>
									6.
									<spring:message code="ref310"></spring:message>
								</div></a>
						</p>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 7)|| fn:contains(allowedQuestions, 8)|| fn:contains(allowedQuestions, 9)}">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="#groupid_5gsauivn29"
						 data-toggle="collapse"><spring:message
							code="ref318"></spring:message></a>
				</div>
				<div id="groupid_5gsauivn29" class="accordion-body ${7<= question && question <=9  ? "collapse in" : "collapse"}"">
					<div class="accordion-inner">
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 7)}">
						<p>
							<a href="7" class="tab"><div>
									7.
									<spring:message code="ref319"></spring:message>
								</div></a>
						</p>
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 8)}">
						
						<p>
							<a href="8" class="tab"><div>
									8.
									<spring:message code="ref334"></spring:message>
								</div></a>
						</p>
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 9)}">
						<p>
							<a href="9" class="tab"><div>
									9.
									<spring:message code="ref371"></spring:message>
								</div></a>
						</p>
						</c:if>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer'  || fn:contains(allowedQuestions, 10)|| fn:contains(allowedQuestions, 11)|| fn:contains(allowedQuestions, 12)
														|| fn:contains(allowedQuestions, 13)|| fn:contains(allowedQuestions, 15)|| fn:contains(allowedQuestions, 15)
														|| fn:contains(allowedQuestions, 16)}">
			
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="#groupid_3gd86w29"
						 data-toggle="collapse"><spring:message
							code="ref376"></spring:message></a>
				</div>
				<div id="groupid_3gd86w29" class="accordion-body  ${10<= question && question <=16  ? "collapse in" : "collapse"}"">
					<div class="accordion-inner">
					<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 10)}">
						<p>
							<a href="10" class="tab"><div>
									10.
									<spring:message code="ref377"></spring:message>
								</div></a>
						</p>
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 11)}">
						<p>
							<a href="11" class="tab"><div>
									11.
									<spring:message code="ref392"></spring:message>
								</div></a>
						</p>
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 12)}">
						<p>
							<a href="12" class="tab"><div>
									12.
									<spring:message code="ref397"></spring:message>
								</div></a>
						</p>
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 13)}">
						<p>
							<a href="13" class="tab"><div>
									13.
									<spring:message code="ref407"></spring:message>
								</div></a>
						</p>
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 14)}">
						<p>
							<a href="14" class="tab"><div>
									14.
									<spring:message code="ref435"></spring:message>
								</div></a>
						</p>
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 15)}">
						<p>
							<a href="15" class="tab"><div>
									15.
									<spring:message code="ref457"></spring:message>
								</div></a>
						</p>
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 16)}">
						<p>
							<a href="16" class="tab"><div>
									16.
									<spring:message code="ref467"></spring:message>
								</div></a>
						</p>
						</c:if>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer'  || fn:contains(allowedQuestions, 17)|| fn:contains(allowedQuestions, 18)|| fn:contains(allowedQuestions, 19)
														|| fn:contains(allowedQuestions, 20)}">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="#groupid_r87gsowp14i"
						 data-toggle="collapse"><spring:message
							code="ref486"></spring:message></a>
				</div>
				<div id="groupid_r87gsowp14i" class="accordion-body  ${17<= question && question <=20  ? "collapse in" : "collapse"}"">
					<div class="accordion-inner">
					
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 17)}">
						<p>
							<a href="17" class="tab"><div>
									17.
									<spring:message code="ref487"></spring:message>
								</div></a>
						</p>
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 18)}">
						<p>
							<a href="18" class="tab"><div>
									18.
									<spring:message code="ref495"></spring:message>
								</div></a>
						</p>
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 19)}">
						<p>
							<a href="19" class="tab"><div>
									19.
									<spring:message code="ref536"></spring:message>
								</div></a>
						</p>
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 20)}">
						<p>
							<a href="20" class="tab"><div>
									20.
									<spring:message code="ref545"></spring:message>
								</div></a>
						</p>
						</c:if>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 21)}">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="#groupid_6hisy2b7qfr"
						 data-toggle="collapse"><spring:message
							code="ref553"></spring:message></a>
				</div>
				<div id="groupid_6hisy2b7qfr" class="accordion-body ${ question ==21  ? "collapse in" : "collapse"}"">
					<div class="accordion-inner">
						<p>
							<a href="21" class="tab"><div>
									21.
									<spring:message code="ref554"></spring:message>
								</div></a>
						</p>
					</div>
				</div>
			</div>
			</c:if>
		</div>
	</div>
</div>