/*
 * USER WINDOW
 */

var countryDeleteHandelr = function(id,el) {
	el.find('#countriesTable tr#tr_'+id).remove();
	var countries = el.find('#ccountries').val();
	var countriesArr = countries.split(',');
	countriesArr.splice( countriesArr.indexOf(''+id), 1 );
	el.find('#ccountries').val(countriesArr.join(","));
	if(countriesArr.length == 0){
		enableCountry(el);
	}
}

var enableCountry = function(el){
	var countryMenu = el.find('#countryMenu');
	var addCountryBtn = el.find('#addCountryBtn');
	var addAllCountryBtn = el.find('#addAllCountryBtn');
	var countriesField = el.find('#countries');
	var roleComboBox = el.find('#roleComboBox');
	addCountryBtn.on('click');
	addCountryBtn.removeClass('disabled');
	addCountryBtn.click(function() {
		addCountryHandler(el);
	});	
	countriesField.removeAttr('disabled');
	var role = roleComboBox.val();
	if (role == 'reviewer' || role == 'editor'){
		countryMenu.removeClass('disabled');
	}else{
		countryMenu.addClass('disabled');
	}	
}

var createCountryRow = function(id,name,iso3,el) {
	var row = '<tr id=tr_'+id+'><td style="width: 10px;"><button class="btn btn-mini btn-danger" type="button">x</button></td><td>'+name+'</td><td style="width: 50px;">'+iso3+'</td></tr>'
	el.find('#countriesTable > tbody:last').append(row);
	el.find('#countriesTable tr#tr_'+id).find('button').click(function() {
		countryDeleteHandelr(id,el);
	});
	return row;
}

var addAllCountryHandler = function(el) {
	var countriesField = el.find('#countries');
	var countriesString = el.find('#ccountries'); 
	countriesField.val("");
	countriesString.val("");
	el.find('#countriesTable > tbody:last').empty();
	
	var countries = "";	
	$.each(countriesArr, function (i, country) {
		createCountryRow(country.id,country.name,country.iso3,el);
		countries += ',' + country.id;
	}); 
	countriesString.val(countries);
}

var addAllQuestionHandler = function(el) {
	var questions = el.find('#questionsCheck');
	questions.find(':checkbox').attr('checked', true);
}

var removeAllQuestionHandler = function(el) {
	var questions = el.find('#questionsCheck');
	questions.find(':checkbox').attr('checked', false);
}

var removeAllCountryHandler = function(el) {
	var countriesField = el.find('#countries');
	var countriesString = el.find('#ccountries'); 
	countriesField.val("");
	countriesString.val("");
	el.find('#countriesTable > tbody:last').empty();
}

var reviewerPresetHandler = function(el) {
	addAllCountryHandler(el);
	addAllQuestionHandler(el);
	el.find('#preventContributorsEmails').attr('checked', true);	
}

var addCountryHandler = function(el) {
	var countriesField = el.find('#countries');
	var countriesString = el.find('#ccountries');
	var countriesBlock = el.find('#selectedCountries');
	var roleComboBox = el.find('#roleComboBox');
	var addCountryBtn = el.find('#addCountryBtn');
	var value = countriesField.val();
	//var selectedCountry = $.grep(countriesArr, function(e){ return e.name == value; })[0];
	var selectedCountry = map[value];
	countriesField.val('');
	if (!selectedCountry || countriesString.val().split(',').indexOf(selectedCountry.id) !== -1) {
		// country already in list
		// ignore
		return false;
	}
	createCountryRow(selectedCountry.id,selectedCountry.name,selectedCountry.iso3,el);
	// check if this country is already selected
	var countries = countriesString.val();	
	if (countries.length > 0) {
		countries += ',' + selectedCountry.id;
	} else {
		countries = selectedCountry.id;
	}
	countriesString.val(countries);
	var role = roleComboBox.val();
	if (role !== 'reviewer' && role !== 'editor') {
		addCountryBtn.off('click');
		addCountryBtn.addClass('disabled');
		countriesField.attr('disabled', 'disabled');
	}
	return false;

};

function changeRole(el){
	var roleComboBox = el.find('#roleComboBox');
	var countriesString = el.find('#ccountries');
	var countriesBlock = el.find('#selectedCountries');
	var countryMenu = el.find('#countryMenu');
	var addCountryBtn = el.find('#addCountryBtn');
	var addAllCountryBtn = el.find('#addAllCountryBtn');
	var countriesField = el.find('#countries');
	var questionsBlock =  el.find('#questions');
	var canSubmitBlock = el.find('#submittercbx');
	countriesField.val("");
	countriesString.val("");
	el.find('#countriesTable > tbody:last').empty();
	var role = roleComboBox.val();
	var countries = countriesString.val();
	if (role != 'reviewer' && role != 'editor' && countries) {
		countryMenu.addClass('disabled');
		addCountryBtn.off('click');
		addCountryBtn.addClass('disabled');
		countriesField.attr('disabled', 'disabled');
	}else{
		enableCountry(el);
	}
	if (role == 'reviewer') {
		questionsBlock.attr('class', 'show');
	} else {
		questionsBlock.attr('class', 'hide');
	}
	if (role=='contributor'){
		canSubmitBlock.toggleClass('hide',false)
	}else{
		canSubmitBlock.toggleClass('hide',true)
	}
	if(role == ''){
		addCountryBtn.off('click');
		addCountryBtn.addClass('disabled');
		addAllCountryBtn.off('click');
		addAllCountryBtn.addClass('disabled');
		countriesField.attr('disabled', 'disabled');
		countriesField.val("Chose a role before");
	}
}	
	
function initEditUserWindow(el){
	initShowAll(el);
	initCountrySelector(el);
	initMenuHandlers(el);
	var roleComboBox = el.find('#roleComboBox');
	var usernameField = el.find('#cusername');
	var addCountryBtn = el.find('#addCountryBtn');
	var countriesField = el.find('#countries');
	var questionsBlock =  el.find('#questions');
	var canSubmitBlock = el.find('#submittercbx');
	var countryMenu = el.find('#countryMenu');
	usernameField.attr('disabled', 'true');
	roleComboBox.attr('disabled', 'true');
	
	var role = roleComboBox.val();
	if (role != 'reviewer' && role != 'editor') {
		var countryMenu = el.find('#countryMenu');
		countryMenu.addClass('disabled');
		addCountryBtn.off('click');
		addCountryBtn.addClass('disabled');
		countriesField.attr('disabled', 'disabled');
	}else{
		addCountryBtn.on('click');
		addCountryBtn.click(function() {
			addCountryHandler(el);
		});
		addCountryBtn.removeClass('disabled');		
		countryMenu.removeClass('disabled');		
		countriesField.removeAttr('disabled');
	}
	if (role == 'reviewer') {
		questionsBlock.attr('class', 'show');
	} else {
		questionsBlock.attr('class', 'hide');
	}
	if (role=='contributor'){
		canSubmitBlock.toggleClass('hide',false)
	}else{
		canSubmitBlock.toggleClass('hide',true)
	}
	el.find('#countriesTable').find("tr").each(function() {
		  var id = $(this).attr('id').replace("tr_","");
		  $(this).find('button').click(function() {
				countryDeleteHandelr(id,el);
		  });
	});
}

function initCreateUserWindow(el){
	initShowAll(el);
	initCountrySelector(el);
	el.find('#countries').val("Chose a role before");
	var roleComboBox = el.find('#roleComboBox');
	roleComboBox.change(function() {
		changeRole(el);
	});
	initMenuHandlers(el);
}

function initMenuHandlers(el){
	var countryMenu = el.find('#countryMenu');
	countryMenu.addClass('disabled');
	var addAllQuestionBtn = el.find('#addAllQuestionBtn');
	addAllQuestionBtn.on('click');
	addAllQuestionBtn.click(function() {
		addAllQuestionHandler(el);
	});
	var removeAllQuestionBtn = el.find('#removeAllQuestionBtn');
	removeAllQuestionBtn.on('click');
	removeAllQuestionBtn.click(function() {
		removeAllQuestionHandler(el);
	});
	var addAllCountryBtn = el.find('#addAllCountryBtn');
	addAllCountryBtn.on('click');
	addAllCountryBtn.click(function() {
		addAllCountryHandler(el);
	});	
	var removeAllCountryBtn = el.find('#removeAllCountryBtn');
	removeAllCountryBtn.on('click');
	removeAllCountryBtn.click(function() {
		removeAllCountryHandler(el);
	});
	var reviewerPresetBtn = el.find('#reviewerPresetBtn');
	reviewerPresetBtn.on('click');
	reviewerPresetBtn.click(function() {
		reviewerPresetHandler(el);
	});
}

function initShowAll(el){
	/*
	el.find('#showAll').click(function(){
	        //add something to ensure the menu will be shown
		el.find('#countries').val(' ');
		el.find('#countries').typeahead('lookup');	
	});
	*/
}

function initCountrySelector(el){
	el.find('#countries').typeahead({
	    source: function (query, process) {
	    	var result  = [];	 
	    	map = {};
	        $.each(countriesArr, function (i, country) {
	        	var label = country.name + " (" + country.iso3 + ")";
	        	result.push(label);
	        	map[label] = country;
	        });
	        process(result);
	    }
	});
}

function initFilterWindow(el){
	el.find('#filter_countries').typeahead({
	    source: function (query, process) {
	    	var result  = [];	 
	    	map = {};
	        $.each(countriesArr, function (i, country) {
	        	var label = country.name + " (" + country.iso3 + ")";
	        	result.push(label);
	        	map[label] = country;
	        });
	        process(result);
	    },
	    updater: function(item) {
	    	el.find('#countries').val(map[item].id);
	        return item;
	    }
	});
	var selectedId = el.find('#countries').val();
	if(selectedId){
		var filterCountriesValue = $.grep(countriesArr, function(e){ return e.id == selectedId; })[0];
		var label = filterCountriesValue.name + " (" + filterCountriesValue.iso3 + ")";
		el.find('#filter_countries').val(label);
	}
	el.find('#filter_countries').focus(function (e) {
		el.find('#filter_countries').val('');
		el.find('#selCountries').val(''); // Clear typeahead
	});
	el.find('#filter_cname_clear_btn').click(function(event){ el.find('#filter_cname').val('') });
	el.find('#filter_cusername_clear_btn').click(function(event){ el.find('#filter_cusername').val('') });
	el.find('#filter_cemail_clear_btn').click(function(event){ el.find('#filter_cemail').val('') });
	el.find('#filter_roleComboBox_clear_btn').click(function(event){ el.find('#filter_roleComboBox').val('') });
	el.find('#filter_countries_clear_btn').click(function(event){ el.find('#filter_countries').val(''); el.find('#selCountries').val('') });
}

function saveUser(el){
	var cquestions = "";
	el.find(".questionCheck").each(function( index ) {
		if($(this).is(':checked')){
			if(cquestions == ""){
				cquestions = $(this).attr('id');
			}else{
				cquestions = cquestions + "," + $(this).attr('id');
			}
		}
	});
	
	
	el.find("#questionsStr").val(cquestions);
	//at least 1 question for reviewer
	var valRules = {ignore: ""};
	var role = el.find('#roleComboBox').val();
	if (role == 'reviewer') {
		valRules.rules={
			questionsStr: "required"
		}
	}else{
		var settings = $('form').validate().settings;
		if (settings.rules.questionsStr) {
			delete settings.rules.questionsStr;
		}
		
	}
	el.find("#createUserForm").validate(valRules);

	el.find('#createUserForm').submit();
}

function initActivityLog(){
	var el = $('#filterActivityLogForm');
	el.find('#filter_from_clear_btn').click(function(event){ el.find('#fromDate').val('');el.submit() });
	el.find('#filter_to_clear_btn').click(function(event){ el.find('#toDate').val('');el.submit() });
	el.find('#filter_username_clear_btn').click(function(event){ el.find('#username').val('');el.submit() });
	el.find('#filter_country_clear_btn').click(function(event){ el.find('#country').val(''); el.find('#filter_countries').val('');el.submit( )});
	el.find('#filter_questionId_clear_btn').click(function(event){ el.find('#questionId').val('');el.submit( )});
	el.find('#filter_content_clear_btn').click(function(event){ el.find('#content').val('');el.submit()});
	el.find('#filter_from_clear_btn').click(function(event){ el.find('#fromDate').val('');el.submit()});
	el.find('#activityLogFilterBtn').click(function(event){el.submit()});
	el.find('#questionId').numeric();
	el.find('#filter_countries').typeahead({
	    source: function (query, process) {
	    	var result  = [];	 
	    	map = {};
	        $.each(countriesArr, function (i, country) {
	        	var label = country.name + " (" + country.iso3 + ")";
	        	result.push(label);
	        	map[label] = country;
	        });
	        process(result);
	    },
	    updater: function(item) {
	    	if(map[item]){
	    		el.find('#country').val(map[item].iso3);
	    	}
	        return item;
	    }
	});
	var selectedIso3 = el.find('#country').val();
	if(selectedIso3){
		var filterCountriesValue = $.grep(countriesArr, function(e){ return e.iso3 == selectedIso3; })[0];
		var label = filterCountriesValue.name + " (" + filterCountriesValue.iso3 + ")";
		el.find('#filter_countries').val(label);
	}
}

$(function(){
	$('#createUserWindow').on('hidden', function() {
		$(this).data('modal').$element.removeData();
	});	
	
	$('#editUserWindow').on('hidden', function() {
		$(this).data('modal').$element.removeData();
	});	

	$('#saveBtn').on('click', function(){
		var el = $('#createUserWindow');
		saveUser(el);
	});
	
	$('#updateBtn').on('click', function(){
		var el = $('#editUserWindow');
		saveUser(el);
	});

	$('#filterBtn').on('click', function() {
		$('#filterUserForm').submit();
	});
	
	$('#createUserWindow').on('loaded',function() {
		var el = $('#createUserWindow');
		initCreateUserWindow(el);
	});
	
	$('#editUserWindow').on('loaded',function() {
		var el = $('#editUserWindow');
		initEditUserWindow(el);
	});
	
	$('#filterWindow').on('loaded',function() {
		var el = $('#filterWindow');
		initFilterWindow(el);
	});

	$('#deleteBtn').on('click', function() {
		var userId = $('#deleteWarningWindow').data('modal').options.userid;
		var page = $('#deleteWarningWindow').data('modal').options.page;
		location.href=contextPath+"/users/delete/"+userId+"/"+page;
	});

	$('#datetimepickerFrom').datetimepicker({
		language: 'pt-BR'
	});
	
	$('#datetimepickerTo').datetimepicker({
		language: 'pt-BR'
	});
	
	initActivityLog();
});
