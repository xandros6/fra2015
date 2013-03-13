<%@ include file="../common/includes/taglibs.jsp"%>
<form:form class="cmxform" id="createUserForm" method="post"
	action="${pageContext.request.contextPath}/users/save/${page}">
	<div class="container-fluid">
		<div class="row-fluid">
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
							<form:select path="role" id="roleComboBox" name="role"
								class="required input-block-level">
								<form:options items="${roles}" />
							</form:select>
						</p>
					</fieldset>
				</div>
				<div class="span6">

						<label class="control-label inline" for="countryComboBox">Countries:</label> <label class="error inline" for="ccountries" generated="true"/>
						<div class="input-append">
							<input id="countries" style="margin: 0 auto;" type="text"
								disabled="disabled" data-provide="typeahead" autocomplete="off"
								data-source='[${countriesIso3}]' /> 
							<a id="addCountryBtn" href="#" class="btn disabled">Add</a>
						</div>
						<form:input path="countries" name="countries" type="hidden" id="ccountries" class="required"/>
			
					<p id="selectedCountries">
					<!-- 
					<div style="height: 60px; overflow: auto">
						<table
							class="table table-hover table-condensed table-striped table-noborder">
							<tr>
								<td><button class="btn btn-mini btn-danger" type="button">x</button></td>
								<td>DZA</td>
							</tr>
							<tr>
								<td><button class="btn btn-mini btn-danger" type="button">x</button></td>
								<td>DZA</td>
							</tr>
							<tr>
								<td><button class="btn btn-mini btn-danger" type="button">x</button></td>
								<td>DZA</td>
							</tr>
						</table>
					</div>
					 -->
					<c:forTokens items='${command.countries}' delims=',' var='country'>
						<span class="label label-info">${country}</span>
					</c:forTokens>
					</p>
					<p>
					<div id="questions" class="hide">
						<label>Assigned questions:</label>
						<form:input path="questionsStr" type="hidden" id="questionsStr" />
						<div style="height: 190px; overflow: auto">
							<table
								class="table table-hover table-striped table-noborder table-condensed">
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
<script type="text/javascript">
	var createCountryLabel = function(name) {
		var label = $('<span class="label label-info"></span>');
		label.append(name);
		return label;
	};
	var addCountryHandler = function() {
		var el = $('#createUserWindow');
		var value = el.find("#countries").val();
		el.find("#countries").empty();
		el.find("#countries").val('');

		// check if this country is already selected
		var countries = el.find('#ccountries').val();

		if (countries.indexOf(value) !== -1) {
			// country already in list
			// ignore
			return false;
		}

		el.find("#selectedCountries").append(createCountryLabel(value)).append(
				'&nbsp;&nbsp;');

		if (countries.length > 0) {
			countries += ', ' + value;
		} else {
			countries = value;
		}
		el.find('#ccountries').val(countries);

		var role = el.find('#roleComboBox').val();
		if (role !== 'reviewer' && role !== 'editor') {
			el.find("#addCountryBtn").off('click');
			el.find("#addCountryBtn").addClass('disabled');
			$('#countries').attr('disabled', 'disabled');
		}

		return false;
	};
	function enableFunc() {
		$('#ccountries').val("");
		$("#selectedCountries").empty();
		$('#addCountryBtn').on('click');
		$('#addCountryBtn').click(addCountryHandler);
		$('#addCountryBtn').removeClass('disabled');
		$('#countries').removeAttr('disabled');
		var role = $('#roleComboBox').val();
		var countries = $('#ccountries').val();
		if (role != 'reviewer' && role != 'editor' && countries) {
			$('#addCountryBtn').off('click');
			$('#addCountryBtn').addClass('disabled');
			$('#countries').attr('disabled', 'disabled');
		}
		if (role == 'reviewer') {
			$('#questions').attr('class', 'show');
		} else {
			$('#questions').attr('class', 'hide');
		}
		
	  if(role == ''){
	    $('#addCountryBtn').off('click');
	    $('#addCountryBtn').addClass('disabled');
	    $('#countries').attr('disabled', 'disabled');
	  }

	}
	function initFunc() {
		$('#addCountryBtn').click(addCountryHandler);
		var id = $('#cid').val();
		//If id is present user requires edit otherwise requires create new
		if (id) {
			$('#roleComboBox').off('click');
			$('#roleComboBox').attr('disabled', 'disabled');
			var role = $('#roleComboBox').val();
			if (role != 'reviewer' && role != 'editor') {
				$('#addCountryBtn').off('click');
				$('#addCountryBtn').addClass('disabled');
				$('#countries').attr('disabled', 'disabled');
			}else{
				$('#addCountryBtn').on('click');
				$('#addCountryBtn').click(addCountryHandler);
		    $('#addCountryBtn').removeClass('disabled');
		    $('#countries').removeAttr('disabled');
			}
			if (role == 'reviewer') {
				$('#questions').attr('class', 'show');
			} else {
				$('#questions').attr('class', 'hide');
			}
		}
		$('#roleComboBox').change(enableFunc);
	}
	initFunc();
</script>