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
    //editable tables
    $('td.editable').click(fra.editRow);
    //Delete buttons inizialization
    $('.btn.delete-btn').click(fra.deleteRow);
    
    
    // add row functionality to proper buttons
    $('.addBtn').each(function(){
    	var entry =$(this).parent().parent().find(".entry");
    	
    	var table = entry.find('table.extensible');
    	var addEmptyRow = function(){
            var last = table.find('tr:last');
            var row = last.clone(); 
            //change rowNumber 
            $.each(row.find('td'), function(index, item){
                var cell = $(this);
                cell.attr('rowNumber', parseInt(cell.attr('rowNumber'))+1);
            });
            // replace input name
            $.each(row.find('td'), function(index, item){
                var cell = $(this);
                var hidden =cell.find('input');
                var name = hidden.attr('name');
                
                var myRegexp = /([A-Za-z0-9_]*\[)([0-9]*)(\].*)/;
                var match = myRegexp.exec(name);
                if (match && match.length >2){
	                var rowNumber = parseInt(match[2]) + 1; // row number
	                
	                var newName = name.replace(myRegexp,"$1"+ rowNumber + "$3");
	               
	                hidden.attr('name',newName);
                }
                
                
            });
         	// change number of the row 
 	    	row.find('td').each(function(){
 	    		if(!$(this).hasClass('entry-item')){
 	    			var content = $(this).html();
 	    			try{
 	    				var x = parseInt(content)+1;
 	    				if (x){$(this).html(x);}
 	    			}catch(e){}
 	    			
 	    		}
 	    		
 	    	});
            row.find('.entry-item').click(fra.editRow);
            row.find('.entry-item').find('input').attr('value',"");
            row.find('.entry-item').find('div').html();
            
            row.appendTo(table); 

            row.find('.delete-btn').click(fra.deleteRow);

            return row;
        };
        $(this).click(function(evt){
            addEmptyRow();
            return false;
        });
    });
	    
     
}); 
</script>