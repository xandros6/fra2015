<%@ include file="../common/includes/taglibs.jsp"%>
<br/>
<div id="footer">
	<div class="container">
		<p class="muted credit">
			<spring:message code="footer.disclaimer"/>
			<spring:message code="footer.help"/>
		</p>
		<br />
		<div id="uelogo">
			<img src="${pageContext.request.contextPath}/img/uelogo2.png" width="99" height="70"/> <br/>
		</div>
        <br />
		<p class="muted credit uedisclaimer">
			<spring:message code="footer.eu.notice"/>
		</p>
	</div>
</div>
