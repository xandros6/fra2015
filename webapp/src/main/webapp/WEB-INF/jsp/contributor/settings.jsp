<%@ include file="../common/includes/taglibs.jsp"%>
<div><div class="container">
<form action="usersettings"  method="post" class="form-horizontal">
<spring:message code="settings.setdefault"></spring:message>:
<select name="mailfavoritelanguage" class="language input-medium" style="width:100px">
	<option value="en" ${mailfavoritelanguage=='en'?'selected':''}>English</option>
	<option value="fr" ${mailfavoritelanguage=='fr'?'selected':''}>Français</option>
	<option value="es" ${mailfavoritelanguage=='es'?'selected':''}>Español</option>
</select>
<button type="submit" class="btn"><spring:message code="save"></spring:message></button>
</form>

</div></div>