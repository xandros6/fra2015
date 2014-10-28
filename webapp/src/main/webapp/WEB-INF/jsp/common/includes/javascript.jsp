<%@ include file="taglibs.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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

<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.bootstrap-duallistbox.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.numeric.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.fileDownload.js"></script>

<script src="${pageContext.request.contextPath}/js/ejs.js"></script>

<script src="${pageContext.request.contextPath}/js/underscore.js"></script>
<script src="${pageContext.request.contextPath}/js/utils.js"></script>
<script src="${pageContext.request.contextPath}/js/total.js"></script>
<script src="${pageContext.request.contextPath}/js/summaryrow.js"></script>
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
		ref332_tt:'<spring:message code="ref332_tt"></spring:message>',
		ref79:'<spring:message code="ref79"></spring:message>',
		ref362_tt:'<spring:message code="ref362_tt"></spring:message>',
        reftab5att1:'<spring:message code="reftab5att1"></spring:message>',
		ref367:'<spring:message code="ref367"></spring:message>',
		ref368:'<spring:message code="ref368"></spring:message>'
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
	
	countriesArr = [];
	<c:forEach var="country" items="${countries}">
	countriesArr.push({"id":"${country.id}","name": "<spring:message code='country.${country.iso3}'></spring:message>","iso3": "${country.iso3}"});         
	</c:forEach>
	
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

        var deactivateTooltip = false;
        if($("#kosentailerfraut").length > 0){
        	deactivateTooltip = true;
        }
        if(matchArr) {
            // console.log( "value " + value );

            cell.find('i').each( function(index2, entry2){
                // console.log( "entry " + matchArr[index2] + " #"+index2 );
                var labelId = matchArr[index2].substr(2,matchArr[index2].length-4)
                // console.log( "labelid ->" + labelId + "<-" );
                var tooltip =fra.tooltips["ref"+labelId];
				if(!tooltip){
					tooltip = 'Tooltip NOT DEFINED';
				}
				if(!deactivateTooltip){
					$(entry2).attr("data-content",tooltip.replace("\"","\\\"") );
					$(entry2).attr("data-original-title",'<spring:message code="tootip.title.note"/>');
					$(entry2).attr("data-toggle","popover");
					$(entry2).addClass=("tooltip-popover");
				}
				else{
					$(entry2).removeClass();
				}
                if (tooltip && !deactivateTooltip) {
                    $(entry2).popover({
                        title: 'Note',
                        placement:function(tip, element) {
                            var $element, above, actualHeight, actualWidth, below, boundBottom, boundLeft, boundRight, boundTop, elementAbove, elementBelow, elementLeft, elementRight, isWithinBounds, left, pos, right;
                            isWithinBounds = function(elementPosition) {
                              return boundTop < elementPosition.top && boundLeft < elementPosition.left && boundRight > (elementPosition.left + actualWidth) && boundBottom > (elementPosition.top + actualHeight);
                            };
                            $element = $(element);
                            pos = $.extend({}, $element.offset(), {
                              width: element.offsetWidth,
                              height: element.offsetHeight
                            });
                            actualWidth = 283;
                            actualHeight = 117;
                            boundTop = $(document).scrollTop();
                            boundLeft = $(document).scrollLeft();
                            boundRight = boundLeft + $(window).width();
                            boundBottom = boundTop + $(window).height();
                            elementAbove = {
                              top: pos.top - actualHeight,
                              left: pos.left + pos.width / 2 - actualWidth / 2
                            };
                            elementBelow = {
                              top: pos.top + pos.height,
                              left: pos.left + pos.width / 2 - actualWidth / 2
                            };
                            elementLeft = {
                              top: pos.top + pos.height / 2 - actualHeight / 2,
                              left: pos.left - actualWidth
                            };
                            elementRight = {
                              top: pos.top + pos.height / 2 - actualHeight / 2,
                              left: pos.left + pos.width
                            };
                            above = isWithinBounds(elementAbove);
                            below = isWithinBounds(elementBelow);
                            left = isWithinBounds(elementLeft);
                            right = isWithinBounds(elementRight);
                            if (above) {
                              return "top";
                            } else {
                              if (below) {
                                return "bottom";
                              } else {
                                if (left) {
                                  return "left";
                                } else {
                                  if (right) {
                                    return "right";
                                  } else {
                                    return "right";
                                  }
                                }
                              }
                            }
                          },
                        html: true,
                        content: tooltip,
                        trigger:'hover'
                    });
                    
                } else {
                	if(!deactivateTooltip){
                    	alert("Bad tooltip # " + labelId);
                	}
                }
				
      
            });
            var $poped =$("i");
            /*
            $poped.each(function() {
                var $this = $(this);
                $this.on('hover',function() {
                        var popover = $this.data('popover');
                        var shown = popover && popover.tip().is(':visible');
                        if(shown) return;        // Avoids flashing
                        $this.popover('show');
                });
            });

            // Trigger for the hiding
             $('html').on('click.popover.data-api',function() {
                $poped.popover('hide');
            });
            */
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
<c:if test="${not empty sessionUser}">

<script type="text/javascript">
		//First advice
		var firstAdviceTime =7200000; //2 h
		var end = new Date();
		//end of session
		end.setHours(end.getHours()+3);
		function addZeros(num){
			return num <=9 ? '0' + num : num;
		}
        function DisplaySessionTimeout()
        {
        	var now = new Date();
        	var sessionTimeout = ( end.getTime() - now.getTime()) / 1000;
            //assigning minutes left to session timeout to Label
            var hours = addZeros(Math.floor( sessionTimeout / (60*60) %24));
       		var mins  = addZeros(Math.floor( sessionTimeout / 60 % 60 ));
        	var secs  = addZeros (Math.floor( sessionTimeout % 60));
            
            
    	 	$("#alert-area").html($('<div class="alert alert-warning" style="text-align:center"><strong><spring:message code="timeout.start" text="You will be disconnected in" /> '
    	 			+ hours + ':' + mins + ':' + secs + ' <spring:message code="timeout.trail" text="due inactivity. Please save your changes the or thay will be lost" /></strong></div>'));

            //if session is not less than 0
            if (sessionTimeout >= 0)
                //call the function again after 1 minute delay
                window.setTimeout("DisplaySessionTimeout()", 1000);
            else
            {
                //show message box
    	 		$("#alert-area").html($('<div class="alert alert-error" style="text-align:center"><strong><spring:message code="timeout.disconnected" text="Disconnected due inactivity" /> </strong></div>'));

            	
            }
        }
        //first alert after 2 hours  
        window.setTimeout("DisplaySessionTimeout()", firstAdviceTime);

</script>		<div class="alertArea" style="position:fixed;top:0;z-index:10000" id="alert-area"></div>
</c:if>
<script src="${pageContext.request.contextPath}/js/users.js"></script>