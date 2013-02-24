<!DOCTYPE HTML> 
                
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html> 
<head> 
		<link href="${pageContext.request.contextPath}/js/jquery.ui.timepicker.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/smoothness/jquery-ui-1.9.2.custom.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/fra2015.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/ribbon.css" rel="stylesheet" />
		<!-- javascripts -->
		<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
		<script src="${pageContext.request.contextPath}/js/i18next-1.5.9.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery-ui-1.9.2.custom.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.ui.timepicker.js"></script>
		<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
		<script src="${pageContext.request.contextPath}/ckeditor/adapters/jquery.js"></script>

		<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath}/js/ejs.js"></script>

		<script src="${pageContext.request.contextPath}/js/underscore.js"></script>
<!--  
		<script src="${pageContext.request.contextPath}/js/constants.js"></script>
		<script src="${pageContext.request.contextPath}/js/rest.js"></script>
		<script src="${pageContext.request.contextPath}/js/uicore.js"></script>
		<script src="${pageContext.request.contextPath}/js/survey-rules.js"></script> 
		<script src="${pageContext.request.contextPath}/js/widgets.js"></script> 
		<script src="${pageContext.request.contextPath}/js/fra2015.js"></script> 
		<script src="${pageContext.request.contextPath}/js/ui.js"></script>
		-->
<meta http-equiv = "Content-Type" content = "text/html; charset=ISO-8859-1"> 
 
</head> 
<body>




<div id="wrap">
<div id="main"><div><div class="container">

<div id="progressbar" class="modal hide fade">
<div class="modal-header"></div>
<div class="modal-body">
<div id="bar" class="ui-progressbar ui-widget ui-widget-content ui-corner-all" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="ui-progressbar-value ui-widget-header ui-corner-left" style="display: none; width: 0%; "></div></div>
</div>
<div class="modal-footer"></div>
</div>

<div class="row">
<div class="span8">
<img src="${pageContext.request.contextPath}/img/fra2015logo.jpg">

<div class="alert alert-error">
<strong>Warning.</strong> This is a demo version.
</div> 



</div>
<div class="span4">
<div class="form-signin">
<h2 class="form-signin-heading" data-i18n="login_title"><spring:message code="login.title" /></h2>
<form action='login' method="post">
<input id="usernameTextField" type="text" class="input-block-level" name="user.username" placeholder="Username">
<input id="passwordTextField" type="password" class="input-block-level" name="user.password"  placeholder="Password">
<label>
<span data-i18n="login_select">Select your language</span>: <br>
<select id="languageSelector" class="input-block-level">
<option value="en-US">English</option>
<option value="fr-FR">Français</option>
<option value="es-ES">Español</option>
</select>
</label>

<button type="submit" id="loginBtn" class="btn btn-large btn-primary" data-i18n="login_signin">Sign in</button>
</form>
</div>
</div>

</div>

<div class="row">
<div id="errorPanel"></div>
</div>


</div> <!-- /container --></div></div>
<div id="push"></div>
</div>
<%@ include file="common/footer.jsp" %>




<script type="text/javascript">

</script>



</body>
</html>