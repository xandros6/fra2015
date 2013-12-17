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

								<jsp:include page="editor/menu.jsp" />
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
							<c:when test="${context=='surveylist'}">
								<jsp:include page="editor/surveys.jsp" />
							</c:when>
							<c:when test="${context=='export'}">
								<jsp:include page="editor/export.jsp" />
							</c:when>
							<c:when test="${context=='survey'}">
								<jsp:include page="survey/survey.jsp" />
							</c:when>
							<c:when test="${context=='surveystatus'}">
								<jsp:include page="common/surveystatus.jsp" />
							</c:when>
							<c:when test="${context=='settings'}">
								<jsp:include page="common/settings.jsp" />
							</c:when>
							<c:when test="${context=='summary'}">
								<jsp:include page="common/summary.jsp" />
							</c:when>
							<c:when test="${context=='check'}">
								<jsp:include page="common/check_only.jsp" />
							</c:when>
							<c:when test="${context=='summaryStatus'}">
								<jsp:include page="editor/summarystatus.jsp" />
							</c:when>
						</c:choose>

					</div>
					<div id="popupPanel"></div>
				</div>
			</div>
		</div>
		<div id="push"></div>

		<%@ include file="common/footer.jsp"%>
</body>
</html>