<%@ include file="../common/includes/taglibs.jsp" %>
<c:set var="badgeType" scope="session" value="${badgeType !=null? badgeType : 'badge-warning'}"/>
<div class="span4">
	<a href="#" id="hide-menu"><spring:message code="left.hidemenu"></spring:message></a>
	<div class="in" id="left-menu">
		<div id="navbar-accordion" class="accordion">
		<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q00')}">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="#groupid_6cn3etp4x6r"
						 data-toggle="collapse">
						 <spring:message code="ref0"></spring:message>
						 <c:if test="${feedbackCount[0]>0}">
							<span class="badge ${badgeType}">${feedbackCount[0]}</span>
						 </c:if>
					 </a>
				</div>
				<div id="groupid_6cn3etp4x6r" class="accordion-body ${question == 0 ? "collapse in" : "collapse"}">
					<div class="accordion-inner">
					
							<a href="0" class="tab"><div>
									<spring:message code="ref1"></spring:message>
									<c:if test="${feedbackCount[0]>0}">
										<span class="badge ${badgeType}">${feedbackCount[0]}</span>
									</c:if>	
								</div></a>
						
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q02') || fn:contains(allowedQuestions, 'q01')}">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="#groupid_27medwbfbt9"
						 data-toggle="collapse">
						 <spring:message code="ref10"></spring:message>
						 <c:if test="${feedbackCount[1] + feedbackCount[2]>0}">
							<span class="badge ${badgeType}">${feedbackCount[1] + feedbackCount[2]}</span>
						 </c:if>	
					</a>
				</div>
				<div id="groupid_27medwbfbt9" class="accordion-body ${1<= question && question <=2  ? "collapse in" : "collapse"}">
					
					<div class="accordion-inner">
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q01')}">
						
							<a href="1" class="tab"><div>
									1.
									<spring:message code="ref11"></spring:message>
									<c:if test="${feedbackCount[1]>0}">
										<span class="badge ${badgeType}">${feedbackCount[1]}</span>
									</c:if>	
									
								</div></a>
						
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q02')}">
						
							<a href="2" class="tab"><div>
									2.
									<spring:message code="ref89"></spring:message>
									<c:if test="${feedbackCount[2]>0}">
										<span class="badge ${badgeType}">${feedbackCount[2]}</span>
									</c:if>	
								</div></a>
						
						</c:if>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q03') || fn:contains(allowedQuestions, 'q04')}">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="#groupid_0bftx6o5hfr"
						 data-toggle="collapse">
						 <spring:message code="ref129"></spring:message>
						 <c:if test="${feedbackCount[3] + feedbackCount[4]>0}">
							<span class="badge ${badgeType}">${feedbackCount[3] + feedbackCount[4]}</span>
						 </c:if>
					</a>
				</div>
				<div id="groupid_0bftx6o5hfr" class="accordion-body ${3<= question && question <=4  ? "collapse in" : "collapse"}">
					<div class="accordion-inner">
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions,'q03')}">
						
							<a href="3" class="tab"><div>
									3.
									<spring:message code="ref130"></spring:message>
									<c:if test="${feedbackCount[3]>0}">
										<span class="badge ${badgeType}">${feedbackCount[3]}</span>
									</c:if>	
								</div></a>
						
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q04')}">
						
							<a href="4" class="tab"><div>
									4.
									<spring:message code="ref215"></spring:message>
									<c:if test="${feedbackCount[4]>0}">
										<span class="badge ${badgeType}">${feedbackCount[4]}</span>
									</c:if>	
								</div></a>
						
						</c:if>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q05')}">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="#groupid_bzh13gzaor"
						 data-toggle="collapse">
						 <spring:message code="ref258"></spring:message></a>
						 <c:if test="${feedbackCount[5]>0}">
							<span class="badge ${badgeType}">${feedbackCount[5]}</span>
						 </c:if>
				</div>
				<div id="groupid_bzh13gzaor" class="accordion-body ${ question ==5  ? "collapse in" : "collapse"}">
					<div class="accordion-inner">
						
							<a href="5" class="tab"><div>
									5.
									<spring:message code="ref259"></spring:message>
									<c:if test="${feedbackCount[5]>0}">
										<span class="badge ${badgeType}">${feedbackCount[5]}</span>
									</c:if>	
								</div></a>
						
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q06')}">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="#groupid_1zxhjiz4cxr"
						 data-toggle="collapse">
						 <spring:message code="ref309"></spring:message>
						 <c:if test="${feedbackCount[6]>0}">
							<span class="badge ${badgeType}">${feedbackCount[6]}</span>
						 </c:if>
					 </a>
				</div>
				<div id="groupid_1zxhjiz4cxr" class="accordion-body ${ question ==6  ? "collapse in" : "collapse"}">
					<div class="accordion-inner">
						
							<a href="6" class="tab"><div>
									6.
									<spring:message code="ref310"></spring:message>
									<c:if test="${feedbackCount[6]>0}">
										<span class="badge ${badgeType}">${feedbackCount[6]}</span>
									</c:if>	
								</div></a>
						
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q07')|| fn:contains(allowedQuestions, 'q08')|| fn:contains(allowedQuestions, 'q09')}">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="#groupid_5gsauivn29"
						 data-toggle="collapse">
						 <spring:message code="ref318"></spring:message>
						 <c:if test="${feedbackCount[7] + feedbackCount[8] + feedbackCount[9]>0}">
							<span class="badge ${badgeType}">${feedbackCount[7] + feedbackCount[8] + feedbackCount[9]}</span>
						 </c:if>
					 </a>
				</div>
				<div id="groupid_5gsauivn29" class="accordion-body ${7<= question && question <=9  ? "collapse in" : "collapse"}">
					<div class="accordion-inner">
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q07')}">
						
							<a href="7" class="tab"><div>
									7.
									<spring:message code="ref319"></spring:message>
									<c:if test="${feedbackCount[7]>0}">
										<span class="badge ${badgeType}">${feedbackCount[7]}</span>
									</c:if>	
								</div></a>
						
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q08')}">
						
						
							<a href="8" class="tab"><div>
									8.
									<spring:message code="ref334"></spring:message>
									<c:if test="${feedbackCount[8]>0}">
										<span class="badge ${badgeType}">${feedbackCount[8]}</span>
									</c:if>	
								</div></a>
						
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q09')}">
						
							<a href="9" class="tab"><div>
									9.
									<spring:message code="ref371"></spring:message>
									<c:if test="${feedbackCount[9]>0}">
										<span class="badge ${badgeType}">${feedbackCount[9]}</span>
									</c:if>	
								</div></a>
						
						</c:if>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer'  || fn:contains(allowedQuestions, 'q10')|| fn:contains(allowedQuestions, 'q11')|| fn:contains(allowedQuestions, 'q12')
														|| fn:contains(allowedQuestions, 'q13') }">
			
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="#groupid_3gd86w29"
						 data-toggle="collapse">
						 <spring:message code="ref376"></spring:message>
						 <c:if test="${feedbackCount[10] + feedbackCount[11] + feedbackCount[12] + feedbackCount[13]>0}">
							<span class="badge ${badgeType}">${feedbackCount[10] + feedbackCount[11] + feedbackCount[12] + feedbackCount[13]}</span>
						 </c:if>
					 </a>
				</div>
				<div id="groupid_3gd86w29" class="accordion-body  ${10<= question && question <=16  ? "collapse in" : "collapse"}">
					<div class="accordion-inner">
					<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q10')}">
						
							<a href="10" class="tab"><div>
									10.
									<spring:message code="ref377"></spring:message>
									<c:if test="${feedbackCount[10]>0}">
										<span class="badge ${badgeType}">${feedbackCount[10]}</span>
									</c:if>	
								</div></a>
						
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q11')}">
						
							<a href="11" class="tab"><div>
									11.
									<spring:message code="ref392"></spring:message>
									<c:if test="${feedbackCount[11]>0}">
										<span class="badge ${badgeType}">${feedbackCount[11]}</span>
									</c:if>	
								</div></a>
						
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q12')}">
						
							<a href="12" class="tab"><div>
									12.
									<spring:message code="ref397"></spring:message>
									<c:if test="${feedbackCount[12]>0}">
										<span class="badge ${badgeType}">${feedbackCount[12]}</span>
									</c:if>	
								</div></a>
						
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q13')}">
						
							<a href="13" class="tab"><div>
									13.
									<spring:message code="ref407"></spring:message>
									<c:if test="${feedbackCount[13]>0}">
										<span class="badge ${badgeType}">${feedbackCount[13]}</span>
									</c:if>	
								</div></a>
						
						</c:if>
					</div>
				</div>
			</div>
			</c:if>
            
			<c:if test="${sessionUser.role!='reviewer'  || fn:contains(allowedQuestions, 'q14')|| fn:contains(allowedQuestions, 'q15')|| fn:contains(allowedQuestions, 'q16')}">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="#groupid_topic6b"
						 data-toggle="collapse">
						 	<spring:message code="reftopic6b"></spring:message>
						 	<c:if test="${feedbackCount[14] + feedbackCount[15] + feedbackCount[16]>0}">
								<span class="badge ${badgeType}">${feedbackCount[14] + feedbackCount[15] + feedbackCount[16]}</span>
							 </c:if>
				 	</a>
				</div>
				<div id="groupid_topic6b" class="accordion-body  ${10<= question && question <=16  ? "collapse in" : "collapse"}">
					<div class="accordion-inner">


						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q14')}">
						
							<a href="14" class="tab"><div>
									14.
									<spring:message code="ref435"></spring:message>
									<c:if test="${feedbackCount[14]>0}">
										<span class="badge ${badgeType}">${feedbackCount[14]}</span>
									</c:if>	
								</div></a>
						
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q15')}">
						
							<a href="15" class="tab"><div>
									15.
									<spring:message code="ref457"></spring:message>
									<c:if test="${feedbackCount[15]>0}">
										<span class="badge ${badgeType}">${feedbackCount[15]}</span>
									</c:if>	
								</div></a>
						
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q16')}">
						
							<a href="16" class="tab"><div>
									16.
									<spring:message code="ref467"></spring:message>
									<c:if test="${feedbackCount[16]>0}">
										<span class="badge ${badgeType}">${feedbackCount[16]}</span>
									</c:if>	
								</div></a>
						
						</c:if>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer'  || fn:contains(allowedQuestions, 'q17')|| fn:contains(allowedQuestions, 'q18')|| fn:contains(allowedQuestions,'q19')
														|| fn:contains(allowedQuestions, 'q20')}">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="#groupid_r87gsowp14i"
						 data-toggle="collapse">
						 	<spring:message code="ref486"></spring:message>
						 	<c:if test="${feedbackCount[17] + feedbackCount[18] + feedbackCount[19] + feedbackCount[20]>0}">
								<span class="badge ${badgeType}">${feedbackCount[17] + feedbackCount[18] + feedbackCount[19] + feedbackCount[20]}</span>
						 </c:if>
				 	</a>
				</div>
				<div id="groupid_r87gsowp14i" class="accordion-body  ${17<= question && question <=20  ? "collapse in" : "collapse"}">
					<div class="accordion-inner">
					
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q17')}">
						
							<a href="17" class="tab"><div>
									17.
									<spring:message code="ref487"></spring:message>
									<c:if test="${feedbackCount[17]>0}">
										<span class="badge ${badgeType}">${feedbackCount[17]}</span>
									</c:if>	
								</div></a>
						
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q18')}">
						
							<a href="18" class="tab"><div>
									18.
									<spring:message code="ref495"></spring:message>
									<c:if test="${feedbackCount[18]>0}">
										<span class="badge ${badgeType}">${feedbackCount[18]}</span>
									</c:if>	
								</div></a>
						
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q19')}">
						
							<a href="19" class="tab"><div>
									19.
									<spring:message code="ref536"></spring:message>
									<c:if test="${feedbackCount[19]>0}">
										<span class="badge ${badgeType}">${feedbackCount[19]}</span>
									</c:if>	
								</div></a>
						
						</c:if>
						<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q20')}">
						
							<a href="20" class="tab"><div>
									20.
									<spring:message code="ref545"></spring:message>
									<c:if test="${feedbackCount[20]>0}">
										<span class="badge ${badgeType}">${feedbackCount[20]}</span>
									</c:if>	
								</div></a>
						
						</c:if>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q21')}">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="#groupid_6hisy2b7qfr"
						 data-toggle="collapse">
						 <spring:message code="ref553"></spring:message>
						 <c:if test="${feedbackCount[0]>0}">
							<span class="badge ${badgeType}">${feedbackCount[0]}</span>
						 </c:if></a>
				</div>
				<div id="groupid_6hisy2b7qfr" class="accordion-body ${ question ==21  ? "collapse in" : "collapse"}">
					<div class="accordion-inner">
						
							<a href="21" class="tab"><div>
									21.
									<spring:message code="ref554"></spring:message>
									<c:if test="${feedbackCount[21]>0}">
										<span class="badge ${badgeType}">${feedbackCount[21]}</span>
									</c:if>	
								</div></a>
						
					</div>
				</div>
			</div>
			</c:if>
		</div>
	</div>
</div>