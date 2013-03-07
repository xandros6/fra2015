<%@ include file="../common/includes/taglibs.jsp"%>

<form:form class="cmxform" id="createUserForm"  method="post" action="save/${page}">
	<fieldset>
		<form:input path="id" id="cid" name="id" type="hidden" value="${user.id}"/>
		<p>
			<form:label path="name" class="control-label">Name</form:label> 
			<form:input path="name" id="cname" name="name" size="25" class="required input-block-level"/>
		</p>
		<p>
			<form:label path="username" for="cusername" class="control-label">Username</form:label> 
			<form:input path="username" id="cusername" name="username" size="25" class="required input-block-level"/>
		</p>
		<p>
			<form:label path="password" class="control-label">Password</form:label> 
			<form:input path="password" id="cpassword" name="password" size="25" type="password" class="required password input-block-level" />
		</p>
		<p>
			<form:label path="email" class="control-label">E-Mail</form:label> 
			<form:input path="email" id="cemail" name="email" size="25" class="required email input-block-level"/>
		</p>
		<p>
			<form:label path="role" class="control-label" for="roleComboBox">Role</form:label> 
			<form:select path="role" id="roleComboBox" class="input-block-level">
				<option value="contributor" >Contributor</option>
				<option value="reviewer">Reviewer</option>
				<option value="editor">Review Editor</option>
				<option value="validator">Country Validator</option>
			</form:select>
		</p>
		<p>
			<label class="control-label" for="countryComboBox">Countries:</label>
			<input id="countries" style="margin: 0 auto;" type="text" data-provide="typeahead" autocomplete="off" data-source='[${countriesIso3}]' /> 
			<a id="addCountryBtn" href="#" class="btn">Add</a> 
			<form:input path="countries" type="hidden" id="ccountries"/>
		</p>
		<p id="selectedCountries">
			<c:forTokens items='${command.countries}' delims=',' var='country'>
				<span class="label label-info">${country}</span>
			</c:forTokens>		
		</p>
	</fieldset>
</form:form>
<script type="text/javascript">
function initFunc(){   		
	$('#addCountryBtn').off('click').click( addCountryHandler );	
}
initFunc();
</script>