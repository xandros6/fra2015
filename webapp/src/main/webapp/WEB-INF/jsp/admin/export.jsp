<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../common/includes/taglibs.jsp"%>
<%@ include file="../common/includes/javascript.jsp"%>

<div>
  <div class="container"> 
    <h3><spring:message code="exportXML.title" /></h3>
		<input id="countries" style="margin: 0 auto;" type="text" autocomplete="off" />
		<button class="btn" id="xml" title="XML" disabled="disabled" >XML</button>	
	  <jsp:include page="../common/export.jsp" />
  </div>
</div>