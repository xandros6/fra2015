<div>
	<div class="container">
		<div class="row">
			<jsp:include page="leftmenu.jsp" ></jsp:include>
			<div class="span8" id="survey-content">
				<jsp:include page="questions/q${question}.jsp" />
			</div>
		<jsp:include page="../common/saveall.jsp"></jsp:include>
	
	</div>
</div>
<script>
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