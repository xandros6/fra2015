<%@ include file="taglibs.jsp"%>
<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/js/i18next-1.5.9.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery-ui-1.9.2.custom.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.ui.timepicker.js"></script>
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script
	src="${pageContext.request.contextPath}/ckeditor/adapters/jquery.js"></script>

<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/ejs.js"></script>

<script src="${pageContext.request.contextPath}/js/underscore.js"></script>
<script src="${pageContext.request.contextPath}/js/utils.js"></script>
<script src="${pageContext.request.contextPath}/js/users.js"></script>
<script src="${pageContext.request.contextPath}/js/total.js"></script>
<!--  
		<script src="${pageContext.request.contextPath}/js/constants.js"></script>
		<script src="${pageContext.request.contextPath}/js/rest.js"></script>
		<script src="${pageContext.request.contextPath}/js/uicore.js"></script>
		<script src="${pageContext.request.contextPath}/js/survey-rules.js"></script> 
		<script src="${pageContext.request.contextPath}/js/widgets.js"></script> 
		<script src="${pageContext.request.contextPath}/js/fra2015.js"></script> 
		<script src="${pageContext.request.contextPath}/js/ui.js"></script>
		-->


<!-- Message utility -->
<c:if test="${(not empty messageCode) && (not empty messageType)}">

<script>
$(function(){
	$('#savemessage').modal();
	var hide = function(){
        window.clearTimeout( timeoutID );
        $('#savemessage').modal('hide'); 
    };
    timeoutID = setTimeout(hide, ${ not empty messageTimeout ? messageTimeout : 2000});
});
</script>
</c:if><script>
fra.tooltips= {
		ref66_tt:'<spring:message code="ref66_tt"></spring:message>',
		ref67_tt:'<spring:message code="ref67_tt"></spring:message>',
		ref161_tt:'<spring:message code="ref161_tt"></spring:message>',
		ref179_tt:'<spring:message code="ref179_tt"></spring:message>',
		ref260_tt:'<spring:message code="ref260_tt"></spring:message>',
		ref332_tt:'<spring:message code="ref332_tt"></spring:message>',
		ref79:'<spring:message code="ref79"></spring:message>',
		ref362_tt:'<spring:message code="ref362_tt"></spring:message>',
		ref367:'<spring:message code="ref367"></spring:message>',
		ref368:'<spring:message code="ref368"></spring:message>',
		ref79:'<spring:message code="ref79"></spring:message>'
		
};
fra.messages={
		confirmsubmit:'<spring:message code="alert.survey.confirmsubmit"></spring:message>',
		deleterowconfirm:'<spring:message code="alert.survey.deleterowconfirm"></spring:message>',
		deleterowdenied:'<spring:message code="alert.survey.deleterowdenied"></spring:message>',
		savesuccess:'All data saved succefully!'
		
}

function newAlert (type, message) {
   
}

$(function(){	

	contextPath = "${pageContext.request.contextPath}";
	
	<c:if test="${(not empty messageText) && (not empty messageType)}">
	 	$("#alert-area").append($('<div class="alert alert-${messageType}" style="text-align:center"><strong>${messageText}</strong></div>'));
	    $("#alert-area").delay(5000).fadeOut("slow", function () { $(this).remove(); });
	</c:if>
	
	$(document).find('td').each( function(index, entry){
        var cell = $(this);
        
        
        if ( cell.hasClass('action-column')){
            return;
        }
        
        var value = cell.html();

        // etj startDate
        var re = /{{([^}])*}}/g;
        var matchArr = value.match( re );
        value = value.replace( re, '<i class="icon-question-sign" data></i>');
        cell.empty().append( value );


        if(matchArr) {
            // console.log( "value " + value );

            cell.find('i').each( function(index2, entry2){
                // console.log( "entry " + matchArr[index2] + " #"+index2 );
                var labelId = matchArr[index2].substr(2,matchArr[index2].length-4)
                // console.log( "labelid ->" + labelId + "<-" );
                var tooltip =fra.tooltips["ref"+labelId];
					$(entry2).attr("data-content",tooltip.replace("\"","\\\"") );
				$(entry2).attr("data-original-title",'<spring:message code="tootip.title.note"/>');
				$(entry2).attr("data-toggle","popover");
                if (tooltip) {
                    $(entry2).popover({
                        title: 'Note',
                        html: true,
                        content: tooltip
                    });
                } else {
                    alert("Bad tooltip # " + labelId);
                }
				
      
            });
        }

    //etj end

        
    // create tooltip
    //                var re = /{{(.*)}}/;
    //                var match = value.match( re );
    //                value = value.replace( re, '<i class="icon-question-sign"></i>');
        
    //                cell.empty().append( value );



    //                if ( match ){
    //                    console.log( match );
    // enable tooltips
    //                    cell.find('i').popover({
    //                        title: 'Note',
    //                        html: true,
    //                        content: match[1]
    //                    }); 
    //                }
        
        
    });
})



</script>