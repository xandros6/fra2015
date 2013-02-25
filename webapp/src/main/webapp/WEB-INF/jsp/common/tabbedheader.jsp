<%@ include file="includes/taglibs.jsp"%>
<div class="container">
	<div class="navbar">
		<div class="navbar-inner">
			<jsp:include page="contributor/menu.jsp" />
			<div class="navbar-form pull-right">
				<button type="submit" class="logout btn">
					<i class="icon-off"></i>
					<spring:message code="toolbar.logout" />
				</button>
				<select id="languageSelector" class="language input-small">
					<option value="en-US">English</option>
					<option value="fr-FR">Fran�ais</option>
					<option value="es-ES">Espa�ol</option>
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