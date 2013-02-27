<%@ include file="../common/includes/taglibs.jsp"%>
<div>
	<div class="container">
		<div class="row">
			<jsp:include page="leftmenu.jsp"></jsp:include>
			<form method="POST" action="questions/q${question}.jsp">
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
    $('td.editable').click(function(){
        var cell = $(this);
        if ( cell.hasClass('editable') ){
            cell.removeClass("editable");
            cell.addClass("editing");
            var text = cell.find('#cell-content').html();
            var hidden =cell.find('input');
            var input = $('<input style="width:80%" name'+hidden.attr('name') +' class="celleditor" type="text" value="'+text+'"/>');
            input.val(text);
            if (cell.hasClass('number')){
                // on keydown verify if the key is a number
                input.keydown(function(evt){
                    var e = evt || window.event; 
                    var charCode = e.which || e.keyCode;                        
                    if (charCode > 31 && (charCode < 47 || charCode > 57))
                        return false;
                    if (e.shiftKey) return false;
                    return true;
                });                               
            }

            cell.find('#cell-content').html( input );
            cell.find('.celleditor').blur( function(){
                if ( cell.hasClass('editing') ){
                    cell.removeClass("editing");
                    cell.addClass("editable");
                    var text = cell.find(".celleditor").attr('value');
                    cell.find('#cell-content').html( text );
                    hidden.val( text ).trigger('change');
                }
                return false;
            });
            cell.find('.celleditor').focus();
        }
        return false;
    });
    /* TODO add row
    $('#addBtn').each(function(){
    	var table = $(this).closest("entry").find('table.extensible');
    	var addEmptyRow = function(){
            var last = table.find('tr:last');
            var row = last.clone(); 
            
            $.each(row.find('td'), function(index, item){
                var cell = $(this);
                cell.attr('rowNumber', parseInt(cell.attr('rowNumber'))+1);
            });
            
            row.find('.entry-item')
            // .addClass('editable entry-item')
            //.attr('entry-id', this.options.variable) // ?
       		//TODO add name to the input
            // .off('click')
            .click(function(){
                var cell = $(this); 
                if ( cell.hasClass('editable') ){
                    cell.removeClass("editable"); 
                    cell.addClass("editing");
                    var text = cell.html();
                    cell.html('<input style="width:80%" name="" class="celleditor" type="text" value="'+text+'"/>');
                    cell.find('.celleditor').blur( function(){
                        if ( cell.hasClass('editing') ){
                            cell.removeClass("editing");
                            cell.addClass("editable");
                            var text = cell.find(".celleditor").attr('value');
                            cell.html( text );
                        }
                        return false;
                    });
                    cell.find('.celleditor').focus();
                }
                return false;
            }
            )
            .empty().append('&nbsp;');
            row.appendTo(table); 

            row.find('.delete-btn').click(function(e){
                var result = window.confirm('Are you sure you want to delete these data?');
                if ( result ){
                    alert('Delete! Mock up method.');  
                }
       
                return false;
            });

            return row;
        };
        $(this).click(function(evt){
            addEmptyRow();
            return false;
        });
    });
	*/    
     
}); 
</script>