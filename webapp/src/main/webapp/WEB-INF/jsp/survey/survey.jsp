<%@ include file="../common/includes/taglibs.jsp"%>
<div>
	<div class="container">
		<div class="row">
			<jsp:include page="leftmenu.jsp"></jsp:include>
			<form method="POST" action="${question}">
				<div class="span8" id="survey-content">

					<jsp:include page="questions/q${question}.jsp" />
				</div>
				<jsp:include page="../common/saveall.jsp"></jsp:include>
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
                                
		CKEDITOR.replace( id, { 
			toolbar: 'MyToolbar'
		});
	});
	
	
	    
     
}); 
</script>