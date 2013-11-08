<%@ include file="../common/includes/taglibs.jsp"%>
<form:form class="cmxform" id="createUserForm" method="post"
	action="${pageContext.request.contextPath}/users/save/${page}">
	<div class="container-fluid">
		<div class="row-fluid custom">
			<div class="inner-fluid clearfix">
				<div class="span6 border">
					<fieldset>
						<form:input path="id" id="cid" name="id" type="hidden" />
						<p>
							<form:label path="name" class="control-label inline">Name</form:label>
							<label class="error inline" for="cname" generated="true" />
							<form:input path="name" id="cname" name="name" size="25"
								class="required input-block-level" />
						</p>
						<p>
							<form:label path="username" for="cusername"
								class="control-label inline">Username</form:label>
							<label class="error inline" for="cusername" generated="true" />
							<form:input path="username" id="cusername" name="username"
								size="25" class="required input-block-level" />
						</p>
						<p>
							<form:label path="password" class="control-label inline"
								for="newPassword">Password <c:if
									test="${not empty command.id}">(left blank to not change current)</c:if>
							</form:label>
							<label class="error inline" for="newPassword" generated="true" />
							
							<c:choose>
								<c:when test="${empty command.id}">
									<input id="newPassword" name="newPassword" size="25"
										type="password" value="${user.password}"
										class="required password input-block-level" />
								</c:when>
								<c:otherwise>
									<div class="input-append">
									    <input id="newPassword" name="newPassword" size="25"
											type="password" value="${user.password}"
											class="showHidePassword password input-block-level" />
											
										<a href="#" class="btn topopup" data-toggle="tooltip">
											<spring:message	code="editor.popup.show" text="Show"></spring:message>
										</a>
									</div>
									
									<!-- The as default hidden Popup to show to the Admin the old password of the User -->
								    <div id="toPopup">
								       	<span class="ecs_tooltip"><spring:message code="editor.popup.close" text="Close"></spring:message><span class="arrow"></span></span>
										<div id="popup_content">
											<div id="closePopup" class="close">X</div>
								            <h4><spring:message	code="editor.popup.olduserpw" text="Current User Password"></spring:message></h4>
								            <b align="center">${command.password}</b>
								        </div>						
								    </div>
								    
		   							<div id="backgroundPopup"></div>
								</c:otherwise>
							</c:choose>
							
						</p>
						<p>
							<form:label path="email" for="email" class="control-label inline">E-Mail</form:label>
							<label class="error inline" for="email" generated="true" />
							<form:input path="email" id="email" name="email" size="25"
								class="required email input-block-level" />
						</p>
						<p>
							<form:label path="role" class="control-label inline"
								for="roleComboBox">Role</form:label>
							<label class="error inline" for="roleComboBox" generated="true" />
							<form:select path="role" id="roleComboBox" name="role"
								class="required input-block-level">
								<form:options items="${roles}" />
							</form:select>
						</p>
					</fieldset>
				</div>
				<div class="span6">
					<div class="clearfix"
						style="border-left: 1px solid #DDDDDD; border-right: 1px solid #DDDDDD; border-top: 1px solid #DDDDDD; padding: 4px; background-color: #F5F5F5;">
						<table>
							<tr>
								<td width="100%">
								  <span class="inline">Countries </span>
								  <label class="error inline" for="ccountries" generated="true" />
								</td>
								<td>
									<div class="btn-group">
										<a id="countryMenu"
											class="btn btn-mini dropdown-toggle disabled"
											data-toggle="dropdown" href="javascript:void(0)"> <span
											class="caret"></span>
										</a>
										<ul class="dropdown-menu right">
											<li><a id="addAllCountryBtn" href="#">Add all</a></li>
											<li><a id="removeAllCountryBtn" href="#">Remove all</a>
											</li>
										</ul>
									</div>
								</td>
							</tr>
						</table>
						<p>
						<div class="input-append">
							<input id="countries" style="margin: 0 auto; width: 300px"
								type="text" disabled="disabled" autocomplete="off"
								placeholder="Type to filter countries" /> <a id="addCountryBtn"
								href="#" class="btn disabled">Add</a>
						</div>
					</div>
					<form:input path="selCountries" name="selCountries" type="hidden" id="ccountries" class="required" />
					<div
						style="height: 100px; overflow: auto; border: 1px solid #DDDDDD;">
						<table id="countriesTable"
							class="table table-hover table-striped table-noborder table-condensed">
							<tbody>
								<c:forEach items='${command.countriesSet}' var='country'
									varStatus='rowItem'>
									<tr id='tr_${country.id}'>
										<td style="width: 10px;"><button
												class="btn btn-mini btn-danger" type="button">x</button></td>
										<td>${country.name}</td>
										<td style="width: 50px;">${country.iso3}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div id="submittercbx" class="hide">
						<label class="checkbox"><spring:message
								code="user.cansubmit" text="Can submit"></spring:message>
							<form:checkbox path="canSubmit"></form:checkbox></label>
					</div>
					
					<p>
					
					<div id="questions" class="hide form-inline">
						<div class="clearfix"
							style="border-left: 1px solid #DDDDDD; border-right: 1px solid #DDDDDD; border-top: 1px solid #DDDDDD; padding: 4px; background-color: #F5F5F5;">
							<table>
								<tr>
									<td width="100%">
									 <span class="inline">Assigned questions </span>
									 <label class="error inline" for="questionsStr" generated="true" />
									</td>
									<td>
										<div class="btn-group">
											<a class="btn btn-mini dropdown-toggle"
												data-toggle="dropdown" href="#"> <span class="caret"></span>
											</a>
											<ul class="dropdown-menu right">
												<li><a id="addAllQuestionBtn" href="#">Add all</a></li>
												<li><a id="removeAllQuestionBtn" href="#">Remove
														all</a></li>
											</ul>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<form:input path="questionsStr" type="hidden" id="questionsStr" />
						<div id="questionsCheck"
							style="height: 150px; overflow: auto; border: 1px solid #DDDDDD">
							<table
								class="table table-hover table-striped table-noborder table-condensed ">
								<tbody>
									<c:forEach items='${questions}' var='question'
										varStatus='rowItem'>
										<tr>
											<td><input id="${question.id}" class="questionCheck"
												type="checkbox" style="vertical-align: top;"
												<c:if test="${question.selected}">checked</c:if> /></td>
											<td><spring:message code="${question.title}"></spring:message></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<p>
						
						<div style="height: 30px; overflow: auto; border: 1px solid #DDDDDD; padding-left: 4px; background-color: #F5F5F5;">
							<label class="checkbox inline"> <form:checkbox
									path="preventContributorsEmails"
									name="preventContributorsEmails" type="checkbox"
									id="preventContributorsEmails" />Prevent notification e-mails from contributors
							</label>
						</div>	
											
						<p>
						
						<div>
						  <button id="reviewerPresetBtn" class="btn" type="button" >Topic reviewer preset</button>	
						</div>					
					</div>
				</div>
			</div>
		</div>
	</div>	
</form:form>

<script type="text/javascript">
    jQuery(function($) {
    	$("a.topopup").click(function() {
    		// ////////////////////////////////////
    		// then show popup, delay in .1 second
    		// ////////////////////////////////////
   			setTimeout(function(){ 
   				loadPopup(); 
   			}, 100); 
   			return false;
    	});

    	/* event for close the popup */
    	$("div#closePopup").hover(
			function() {
				$('span.ecs_tooltip').show();
			},
			function () {
				$('span.ecs_tooltip').hide();
			}
		);

    	$("div#closePopup").click(function() {
    		disablePopup();
    	});

        $("div#backgroundPopup").click(function() {
    		disablePopup();
    	});

    	var popupStatus = 0;

    	function loadPopup() {
    		// ///////////////////////////////
    		// If value is 0, show the popup
    		// ///////////////////////////////
    		if(popupStatus == 0) { 
    			$("#toPopup").fadeIn(0500); // fadein popup div
    			$("#backgroundPopup").css("opacity", "0.7"); // css opacity, supports IE7, IE8
    			$("#backgroundPopup").fadeIn(0001);
    			popupStatus = 1; // and set value to 1
    		}
    	}

    	function disablePopup() {
    		// ///////////////////////////////
    		// If value is 1, close the popup
    		// ///////////////////////////////
    		if(popupStatus == 1) { 
    			$("#toPopup").fadeOut("normal");
    			$("#backgroundPopup").fadeOut("normal");
    			popupStatus = 0;  // and set value to 0
    		}
    	}
    });
</script>