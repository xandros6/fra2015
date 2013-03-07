/*
 * USER WINDOW
 */
var resetCountryFields = function( user ){
	var win = $('#createUserWindow');
	win.find('#cid').val( user? user.id : null);
	win.find('#cname').val( user? user.name : '');
	win.find('#roleComboBox').val( user? user.role : '' );
	win.find('#cpassword').val( '');
	win.find('#cusername').val( user? user.username : '');
	win.find('#cemail').val( user? user.email : '');    
	win.find('#selectedCountries').empty();
	win.find('#ccountries').val( user? user.countries: '');
	win.find('#countries').val('');

	if (user){        
		if ( user.countries && user.countries.length > 0 ){
			var array = user.countries.split(', ');
			$.each( array, function(id, country){
				win.find( "#selectedCountries" )
				.append( createCountryLabel(country))
				.append( '&nbsp;&nbsp;');

			});        

			if ( user.role !== 'reviewer' && user.role !== 'editor'){
				win.find( "#addCountryBtn" ).off('click');
				win.find( "#addCountryBtn" ).addClass('disabled');
			}
		}        
		// user role cannot be modified
		win.find('#roleComboBox').prop('disabled', 'disabled');
	} else {        
		win.find('#roleComboBox').prop('disabled', false);
	}    
	win.find( "#saveBtn" ).text(user ? 'Update' : 'Save');
	win.find( "#saveBtn" ).removeClass('disabled');
};

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
	}

	return false;
};

 

$(function(){
	$('#createUserWindow').on('hidden', function() {
		$(this).data('modal').$element.removeData();
	});	

	$('#saveBtn').on('click', function() {
		$('#createUserForm').submit();
	});

});
