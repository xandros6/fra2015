<!DOCTYPE HTML> 
<%@ include file="common/includes/taglibs.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html> 
<head> 
	<%@ include file="common/includes/css.jsp" %>
		<!-- javascripts -->
		<%@ include file="common/includes/javascript.jsp" %>
	<meta http-equiv = "Content-Type" content = "text/html; charset=ISO-8859-1"> 
</head> 
<body>
	<div id="wrap">
		<div id="main">
			<div><div>
				<jsp:include page="common/header.jsp" />
				<!-- active tab content -->
				<div id="tabContent">
					<jsp:include page="survey/survey.jsp" />
				</div>
				<div id="popupPanel"></div>
			</div></div>
		</div>
		<div id="push"></div>
	</div>	
<%@ include file="common/footer.jsp" %>
</body>
</html>