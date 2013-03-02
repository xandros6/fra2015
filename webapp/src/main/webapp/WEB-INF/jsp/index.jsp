<!DOCTYPE HTML>
<%@ include file="common/includes/taglibs.jsp"%>
<html>
<head>
<%@ include file="common/includes/css.jsp"%>
<!-- javascripts -->
<%@ include file="common/includes/javascript.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<div id="wrap">
		<div id="main">
			<div>
				<div>
					<jsp:include page="common/banner.jsp" />
					<div class="container">
						<div class="navbar">
							<div class="navbar-inner">
								<%
									//TODO change this with user menu when user in session
								%>
								
								<jsp:include page="common/contributor/menu.jsp" />
								
								<div class="navbar-form pull-right">
									<button type="submit" class="logout btn">
										<i class="icon-off"></i>
										<spring:message code="toolbar.logout" />
									</button>
									<select id="languageSelector" class="language input-small">
										<option value="en-US">English</option>
										<option value="fr-FR">Français</option>
										<option value="es-ES">Español</option>
									</select>
								</div>
							</div>
						</div>
						<jsp:include page="common/userbar.jsp" />
					</div>
					<!-- active tab content -->
					<div id="tabContent">
						<%
							//Survey contributor
						%>
						<c:choose>

							<c:when test="${context=='survey'}">
								<jsp:include page="survey/survey.jsp" />
							</c:when>
							<c:when test="${context=='check'}">
								<jsp:include page="contributor/check-submit.jsp" />
							</c:when>
							<c:when test="${context=='summary'}">
								<jsp:include page="contributor/summary.jsp" />
							</c:when>
							<c:when test="${context=='export'}">
								<jsp:include page="contributor/export.jsp" />
							</c:when>
						</c:choose>

					</div>
					<div id="popupPanel"></div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<%@ include file="common/footer.jsp"%>
</body>
</html>