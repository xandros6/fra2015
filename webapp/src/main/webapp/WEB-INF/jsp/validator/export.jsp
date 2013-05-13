<%@ include file="../common/includes/taglibs.jsp"%>
<div><div class="container">
<spring:message code="export.selecthow" />
<div class="btn-group">
<button class="btn"  data-toggle="tooltip" id="pdf" title="not yet implemented">pdf</button>
<a class="btn" href="export/${country}">xml</a>
</div>
</br></br>
</div></div><script>$(function(){$("#pdf").tooltip()})</script>