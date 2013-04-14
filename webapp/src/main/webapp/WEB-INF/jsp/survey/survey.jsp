<%@ include file="../common/includes/taglibs.jsp"%>
<div>
	<div class="container">
		<div class="row">
			<jsp:include page="leftmenu.jsp"></jsp:include>
			<c:if test="${not empty statuscode && not empty country }">
				<jsp:include page="../common/statuslabel.jsp"></jsp:include>

			</c:if>
			<form id="survey_form" method="POST" action="${question}">
				<div class="span8" id="survey-content">

					<jsp:include page="questions/q${question}.jsp" />
				</div>
				<c:if test="${
					(profile == 'CONTRIBUTOR' && fra:isContributorEditable(status) )||
					(profile == 'EDITOR' && fra:isReviewEditorEditable(status) )||
					(profile == 'REVIEWER' && fra:isReviewerEditable(status))
					}">
				<jsp:include page="../common/saveall.jsp"></jsp:include>
					
				</c:if>
			</form>
		</div>
	</div>
	
	<script>

//prevent submit on enter 
$("input[text]").bind("keypress", function (e) {
    if (e.keyCode == 13) {
        return false;
    }
});
$(function(){
	//hide menu
	var $hide= $('#hide-menu');
	var $left= $('#left-menu');
	var $right=$('#survey-content');
	$hide.click(function(){
		
        if ( !$left.hasClass('in')){
            $left.addClass('in');
            $left.css('display', 'block');
            $right.removeClass('span12').addClass('span8');
            $hide.text('Hide menu');
        } else {
            $left.removeClass('in');
            $left.css('display', 'none');
            $right.removeClass('span8').addClass('span12');
            $hide.text('Show menu');
        }
    });
	
	
	//ckeditor enabling
    jQuery('textarea.texteditor').each( function() {                       
                        
  		var id = $(this).attr('id');
  		id = (id!=undefined)?id:$(this).attr('name');
  		if(id == undefined){
  			id = "cke_" +Math.floor(Math.random()*999999);
  			$(this).attr('id',id);
		}
        var readOnly = false;
        var status = $('input:radio[name=STATUS'+id+']:checked').val();
		if(status && status!="undefined"){ //returns undefined string, don't know why
			if( status == "ok"){
				readOnly= true; 
				}
			else{
				readOnly= false; 

			}
			var data;
			$('input:radio[name=STATUS'+id+']').change(function(){
				var input = $('input:radio[name=STATUS'+id+']:checked');
				var status = input.val();
				var instance = CKEDITOR.instances[id];
				var container = input.closest('.fbstatus');
				container.removeClass('alert-success');
				container.removeClass('alert-warning');
				container.removeClass('alert-error');
				if( status == "ok"){
					instance.setReadOnly(true); 
					container.addClass('alert-success');

				}else if(status =="ko"){
					instance.setReadOnly(false);
					container.addClass('alert-error');

				}else{
					instance.setReadOnly(false);
					container.addClass('alert-warning');

				}

			})
		}
		CKEDITOR.replace( id, { 
			toolbar: 'MyToolbar',
			readOnly : readOnly
		}).on('blur',function(){
			fra.dirty=true;
		})
		
		
	});
	
	//enable /disable CKEDITOR when fbstatus changes
	 
    
    window.onbeforeunload =   function confirmExit()
    {
      if(fra.dirty && !fra.submit){
    	  return '<spring:message code="alert.survey.pageleaving" />';
      }
    }
 
    $(function(){
    	$('#survey_form').on("submit",function(){
    		fra.submit=true;
    		window.onbeforeload=null;
    	})
    })
	    
     
}); 
</script>