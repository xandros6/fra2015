<%@ include file="../common/includes/taglibs.jsp"%>
<div>
	<div class="container">
		<form action="usersettings" method="post" class="form-horizontal">
			<spring:message code="settings.setdefault"></spring:message>
			: <select name="mailfavoritelanguage" class="language input-medium"
				style="width: 100px">
				<option value="en" ${mailfavoritelanguage=='en'?'selected':''}>English</option>
				<option value="fr" ${mailfavoritelanguage=='fr'?'selected':''}>Français</option>
				<option value="es" ${mailfavoritelanguage=='es'?'selected':''}>Español</option>
			</select>
			<button type="submit" class="btn">
				<spring:message code="save"></spring:message>
			</button>
		</form>
		<a href="#changePW" role="button" class="btn" data-toggle="modal"><spring:message code="settings.changepassword" text="change password"></spring:message></a>
		<form action="usersettings" method="post" id="pwchangeform">
			<div id="changePW" class="modal hide fade">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3><spring:message code="settings.changepassword" text="change password"></spring:message></h3>
				</div>
				<div class="modal-body">
					<div class="form-horizontal">
						<div class="control-group">
							<label class="control-label" for="oldPassword"><spring:message code="settings.oldpassword" text="old password"></spring:message></label>
							<div class="controls">
								<input type="password" id="oldPassword" name="oldPassword" required>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="newPassword"><spring:message code="settings.newpassword" text="new password"></spring:message></label>
							<div class="controls">
								<input type="password" id="newPassword" name="newPassword" required>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="confirmPassword"><spring:message code="settings.confirmpassword" text="confirm new password"></spring:message></label>
							<div class="controls">
								<input type="password" id="confirmPassword" name="confirmPassword" required>
							</div>
						</div>
						
					</div>
				</div>
				<div class="modal-footer">
					<a href="#" data-dismiss="modal" class="btn"><spring:message code="close" text="close"></spring:message></a>
					<button type="submit" class="btn btn-primary">
						<spring:message code="save"></spring:message>
					</button>

				</div>
			</div>
		</form>
		<script>
		$(function(){
			$('#pwchangeform').validate({
	            rules : {
	            	newPassword : {
	                },
	                confirmPassword : {
	                    equalTo : "#newPassword"
	                }
	            },
	            messages: {
	            	oldPassword :"<spring:message code="settings.required"  />",
	        		newPassword : "<spring:message code="settings.required"  />",
	        		confirmPassword :"<spring:message code="settings.retype"  />"
	        		
	        	},
			});
		})
		
		
		</script>
	</div>
</div>