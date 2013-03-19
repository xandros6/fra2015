<%@ include file="../common/includes/taglibs.jsp"%>
<form:form class="cmxform" id="createUserForm" method="post" action="${pageContext.request.contextPath}/users/save/${page}">
	<div class="container-fluid">
		<div class="row-fluid custom">
			<div class="inner-fluid clearfix">
				<div class="span6 border">
					<fieldset>
						<form:input path="id" id="cid" name="id" type="hidden" />
						<p >
							<form:label path="name" class="control-label inline">Name</form:label> <label class="error inline" for="cname" generated="true"/>
							<form:input path="name" id="cname" name="name" size="25" class="required input-block-level" />						
						</p>
						<p>
							<form:label path="username" for="cusername" class="control-label inline">Username</form:label> <label class="error inline" for="cusername" generated="true"/>
							<form:input path="username" id="cusername" name="username"
								size="25" class="required input-block-level" />
						</p>
						<p>
							<form:label path="password" class="control-label inline" for="newPassword">Password <c:if
									test="${not empty command.id}">(left blank to not change current)</c:if>
							</form:label> <label class="error inline" for="newPassword" generated="true"/>
							<input id="newPassword" name="newPassword" size="25"
								type="password" value="${user.password}"
								class="<c:if test="${empty command.id}">required</c:if> password input-block-level" />
						</p>
						<p>
							<form:label path="email" for="email" class="control-label inline">E-Mail</form:label> <label class="error inline" for="email" generated="true"/>
							<form:input path="email" id="email" name="email" size="25"
								class="required email input-block-level" />
						</p>
						<p>
							<form:label path="role" class="control-label inline" for="roleComboBox">Role</form:label> <label class="error inline" for="roleComboBox" generated="true"/>
							<form:select path="role" id="roleComboBox" name="role" class="required input-block-level">
								<form:options items="${roles}" />
							</form:select>
						</p>
					</fieldset>
				</div>
				<div class="span6">
						<label class="control-label inline" for="countryComboBox">Countries:</label> <label class="error inline" for="ccountries" generated="true"></label>						
						<div class="input-append">           
              <input id="countries" style="margin: 0 auto;" type="text" disabled="disabled" autocomplete="off" />               
              <!-- 
              <a id="showAll" class="btn dropdown-toggle" href="#"" data-toggle="dropdown">
							 <span class="caret"></span>
							</a>
							 -->
							<a id="addCountryBtn" href="#" class="btn disabled">Add</a>
						</div>
						<form:input path="selCountries" name="selCountries" type="hidden" id="ccountries" class="required"/>
			
					<p id="selectedCountries">
					 
					<div style="height: 100px; overflow: auto; border: 1px solid #DDDDDD;">
						<table id="countriesTable" class="table table-hover table-striped table-noborder table-condensed">
                <tbody>
                  <c:forEach items='${command.countriesSet}' var='country' varStatus='rowItem'>
                    <tr id='tr_${country.id}'><td style="width: 10px;"><button class="btn btn-mini btn-danger" type="button">x</button></td><td>${country.name}</td><td style="width: 50px;">${country.iso3}</td></tr>
                  </c:forEach>
                </tbody>
              </table>
					</div>

					</p>
					<p>
					<div id="questions" class="hide">
						<label>Assigned questions:</label>
						<form:input path="questionsStr" type="hidden" id="questionsStr" />
						<div style="height: 150px; overflow: auto; border: 1px solid #DDDDDD;">
							<table
								class="table table-hover table-striped table-noborder table-condensed ">
								<tbody>
									<c:forEach items='${questions}' var='question'
										varStatus='rowItem'>
										<tr>
											<td><input id="${question.id}" class="questionCheck" type="checkbox" style="vertical-align: top;" <c:if test="${question.selected}">checked</c:if> /></td>
											<td><spring:message code="${question.title}"></spring:message></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					</p>
				</div>
			</div>
		</div>
	</div>
</form:form>
