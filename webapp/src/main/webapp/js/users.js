/*
 * USER WINDOW
 */

$(function(){
	$('#createUserWindow').on('hidden', function() {
		$(this).data('modal').$element.removeData();
	});	

	$('#saveBtn').on('click', function() {

		$("#createUserForm").validate();

		$('#createUserForm').submit();
	});

	$('#filterBtn').on('click', function() {
		$('#filterUserForm').submit();
	});
	

	$('#deleteBtn').on('click', function() {
		var userId = $('#deleteWarningWindow').data('modal').options.userid;
		var page = $('#deleteWarningWindow').data('modal').options.page;
		location.href=contextPath+"/users/delete/"+userId+"/"+page;
	});

});
