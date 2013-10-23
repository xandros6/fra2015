<%@ include file="../common/includes/taglibs.jsp"%>

<div class="container">
	<c:if test="${not empty statuscode && not empty country }">
				<jsp:include page="../common/statuslabel.jsp"></jsp:include>

	</c:if>
	<div class="container">
	<jsp:include page="../common/check.jsp" />
	</div>
</div>