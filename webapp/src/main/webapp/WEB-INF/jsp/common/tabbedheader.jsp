<%@ include file="includes/taglibs.jsp"%>
<div class="container">
	<div class="navbar">
		<div class="navbar-inner">
			<% //TODO change this with user menu when user in session %>
			<c:choose>
				<c:when test="${1==1}">
				<jsp:include page="contributor/menu.jsp" />
				</c:when>
			</c:choose>
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
	<div class="pull-right">
		<p>
			<spring:message code="user.loggedas" />
			<span id="userField">User Algeria(DZA)</span>
			<!-- TODO user name + country -->
		</p>

	</div>
</div>