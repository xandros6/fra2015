<%@page import="it.geosolutions.fra2015.utils.RequestUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ include file="../common/includes/taglibs.jsp"%>
<%
    Map<String, Map<String, String>> countriesMap = (Map<String, Map<String, String>>) request
            .getSession().getAttribute("countryValuesToDisplay");
    List<String> sortedCountryNames = (List<String>)request.getSession().getAttribute(
            "sortedCountryNames");

    //Backup the initial status of the Http request
    Map<String,Object> reqBackup = RequestUtils.requestBackup(request);
    for (String sortedCountryName : sortedCountryNames) {
        
        String [] cName = sortedCountryName.split(";");
        if(cName.length < 2){
            continue;
        }
        String countryKey = cName[1];
        Map<String, String> countryValues = countriesMap.get(countryKey);
        for (String varName : countryValues.keySet()) {
            request.setAttribute(varName, countryValues.get(varName));

        }
%>
		<h1 style="text-align: center">
			<%=cName[0]%>
		</h1>
		<jsp:include page="summary.jsp" />
<%
		//Restore the initial status of the request
		RequestUtils.requestRestore(request, reqBackup);
    }
%>
<!-- BUTTON to hide/show empty rows of the summary -->
<!--	
	<div style="position:fixed;right:0;bottom:50" class="control-panel">    
	    <button id="summaryHideShowButton" type="button" class="btn btn-danger btn-small btn-save-survey" data-toggle="button">
			<spring:message code="summary.hide.empty.records"></spring:message>
		</button>
	</div>
	
    <script type="text/javascript">
		$("#summaryHideShowButton").toggle(function() {
			
			$('.summaryRow').each(function(){		
				hideEmptySummaryRecords(this);		
			});
			
			$(this).text('<spring:message code="summary.show.empty.records"></spring:message>');
			
		}, function() {
			location.reload(); 
		});   	
	</script>
-->