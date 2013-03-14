/*
 * USER WINDOW
 */
function saveUser(){
	var cquestions = "";
	$(".questionCheck").each(function( index ) {
		if($(this).is(':checked')){
			if(cquestions == ""){
				cquestions = $(this).attr('id');
			}else{
				cquestions = cquestions + "," + $(this).attr('id');
			}
		}
	});
	$("#questionsStr").val(cquestions);
	
	$("#createUserForm").validate({ignore: ""});

	$('#createUserForm').submit();
}

$(function(){
	$('#createUserWindow').on('hidden', function() {
		$(this).data('modal').$element.removeData();
	});	
	
	$('#editUserWindow').on('hidden', function() {
		$(this).data('modal').$element.removeData();
	});	

	$('#saveBtn').on('click', saveUser);
	
	$('#updateBtn').on('click', saveUser);

	$('#filterBtn').on('click', function() {
		$('#filterUserForm').submit();
	});
	

	$('#deleteBtn').on('click', function() {
		var userId = $('#deleteWarningWindow').data('modal').options.userid;
		var page = $('#deleteWarningWindow').data('modal').options.page;
		location.href=contextPath+"/users/delete/"+userId+"/"+page;
	});

});
