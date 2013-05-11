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
								
								<jsp:include page="admin/menu.jsp" />
								
								<div class="navbar-form pull-right">
									<jsp:include page="common/logoutbutton.jsp" />
									<jsp:include page="common/languageselector.jsp" />	
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

							<c:when test="${context=='activitylog'}">
								<jsp:include page="common/activitylog.jsp" />
							</c:when>
							<c:when test="${context=='users'}">
								<jsp:include page="admin/users.jsp" />
							</c:when>
							<c:when test="${context=='export'}">
								<jsp:include page="admin/export.jsp" />
							</c:when>
							<c:when test="${context=='surveystatus'}">
								<jsp:include page="common/surveystatus.jsp" />
							</c:when>
							<c:when test="${context=='mailer'}">
								<jsp:include page="admin/mailer.jsp" />
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