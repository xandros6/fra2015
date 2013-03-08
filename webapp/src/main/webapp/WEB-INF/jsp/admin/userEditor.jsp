<%@ include file="../common/includes/taglibs.jsp"%>

<form:form class="cmxform" id="createUserForm"  method="post" action="${pageContext.request.contextPath}/users/save/${page}">
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
 				<form:options items="${roles}" />
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
var createCountryLabel = function( name ){
	var label = $('<span class="label label-info"></span>');
	label.append(name);
	return label;
};
var addCountryHandler = function(){
	var el = $('#createUserWindow');
	var value = el.find("#countries").val();
	el.find( "#countries" ).empty(); 
	el.find("#countries").val('');

	// check if this country is already selected
	var countries = el.find('#ccountries').val();

	if ( countries.indexOf( value ) !== -1 ){
		// country already in list
		// ignore
		return false;
	}

	el.find( "#selectedCountries" )
	.append( createCountryLabel(value))
	.append( '&nbsp;&nbsp;');


	if ( countries.length>0){
		countries += ', ' + value;
	} else {
		countries = value;
	}
	el.find('#ccountries').val( countries );


	var role = el.find('#roleComboBox').val();
	if ( role !== 'reviewer' && role !== 'editor'){
		el.find( "#addCountryBtn" ).off('click');
		el.find( "#addCountryBtn" ).addClass('disabled');
		$('#countries').attr('disabled', 'disabled');
	}

	return false;
};
function enableFunc(){  
	$('#ccountries').val("");
	$( "#selectedCountries" ).empty();
	$('#addCountryBtn').on('click');
	$('#addCountryBtn').click( addCountryHandler );
	$('#addCountryBtn').removeClass('disabled');
	$('#countries').removeAttr('disabled');
	var role = $('#roleComboBox').val();
	var countries = $('#ccountries').val();
	if ( role != 'reviewer' && role != 'editor' && countries){
		$('#addCountryBtn').off('click');
		$('#addCountryBtn').addClass('disabled');
		$('#countries').attr('disabled', 'disabled');
	}
}
function initFunc(){ 
	$('#addCountryBtn').click( addCountryHandler );
	var id = $('#cid').val();
	//If id is present user requires edit otherwise requires create new
	if(id){
		$('#roleComboBox').off('click');
		$('#roleComboBox').attr('disabled', 'disabled');
		var role = $('#roleComboBox').val();
		if ( role != 'reviewer' && role != 'editor'){
			$('#addCountryBtn').off('click');
			$('#addCountryBtn').addClass('disabled');
			$('#countries').attr('disabled', 'disabled');
		}
	}
	$('#roleComboBox').change( enableFunc );
}
initFunc();
</script>