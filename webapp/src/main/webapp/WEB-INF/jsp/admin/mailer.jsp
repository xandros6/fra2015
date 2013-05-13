<%@ include file="../common/includes/taglibs.jsp"%>
<%@ include file="../common/includes/javascript.jsp"%>

<div>
	<div class="container">
		<h1>Mail tester</h1>
		<form class="form-horizontal" id="survey_form" method="POST"
			action="mailer">
			<br />

			<input type="hidden" name="country" id="country">
			<div class="control-group">

				<div>

					<label><spring:message code="receiver" text="Receiver" /></label> <select
						name="recevier">
						<option>
							<spring:message code="customtext" text="custom address" />
						</option>

						<c:forEach items="${roles}" var="role">

							<option value="${role.key}">${role.value}</option>

						</c:forEach>
					</select> 
					<input
					id="countries" style="margin: 0 auto;" type="text"
					autocomplete="off" placeholder="<spring:message code="export.selectcountry" />"/>
					<br/>
					 <input type="text" name="address" placeholder="<spring:message code="customaddress"
							text="Custom Address" />">
					 <select
						name="userLang">
						

						<c:forEach items="${mailLanguage}" var="l">

							<option value="${l.key}">${l.value}</option>

						</c:forEach>
					</select> 
				</div>

				<label><spring:message code="template" text="Template" /></label> <select
					name='template'>
					<!--   <option>
						<spring:message code="customtext" text="Custom Text" />
					</option>
					-->

					<c:forEach items="${templates}" var="template">

						<option value="${template.key}">${template.key}</option>

					</c:forEach>
				</select> <br />
				<br /> <label>message</label>
				<textarea name="customtext"></textarea>
				<span class="controls-row"></span> <br />
				<button type="submit" class="btn btn-primary btn-large">
					<spring:message code="send" text="Send" />
				</button>
			</div>

		</form>


		<script>
			//prevent submit on enter 
			$("input[text]").bind("keypress", function(e) {
				if (e.keyCode == 13) {
					return false;
				}
			});
			$(function() {
				//hide menu
				var $hide = $('#hide-menu');
				var $left = $('#left-menu');
				var $right = $('#survey-content');
				$hide
						.click(function() {

							if (!$left.hasClass('in')) {
								$left.addClass('in');
								$left.css('display', 'block');
								$right.removeClass('span12').addClass('span8');
								$hide
										.text('<spring:message code="left.hidemenu" text="Hide Menu"/>');
							} else {
								$left.removeClass('in');
								$left.css('display', 'none');
								$right.removeClass('span8').addClass('span12');
								$hide
										.text('<spring:message code="left.showmenu" text="Show Menu"/>');
							}
						});
			});
				//ckeditor enabling
				

			$(function() {
				$('#countries').typeahead({
					source : function(query, process) {
						var result = [];
						$.each(countriesArr, function(i, country) {
							result.push(country.name);
						});
						process(result);
					},
					updater : function(item) {
						var el =$.grep(countriesArr,function(e){return e.name==item})[0].iso3;
						$('#country').val(el);
						return item;
					}
				});
				
				

			});
		</script>
	</div>
</div>
