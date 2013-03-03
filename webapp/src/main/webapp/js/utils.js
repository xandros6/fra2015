fra = {
		deleteRow:function(){
	    	var row = $(this).closest("tr");
	    	var table = $(this).closest("table");
	    	var rows = table.find("tr");
	    	//at least 2 rows containing inputs
	    	var entries =0;
	    	for (var i = 0;i<rows.length && entries <2; i++){
	    		$(rows[i]).find('.entry-item').length >0 ?entries++ : entries;
	    	}
	    	if (entries<2){
    			alert("You can not delete this"); //TODO i18n
				 return false;
	    	}
	    	
	    	 var result = window.confirm('Are you sure you want to delete these data?');//TODO i18n
	         if ( result ){
	        	// change number of the row 
	 	    	row.nextAll().find('td').each(function(){
	 	    		if(!$(this).hasClass('entry-item')){
	 	    			var content = $(this).html();
	 	    			try{
	 	    				var x = parseInt(content)-1;
	 	    				if (x){$(this).html(x);}
	 	    			}catch(e){}
	 	    			
	 	    		}
	 	    		
	 	    	});
	             row.remove();
	         }

	         return false;
	    },
	    editRow: function(){
    		var type='textarea';
	        var cell = $(this);
	        if(cell.hasClass('number')){type='input';}
	        if ( cell.hasClass('editable') ){
	            cell.removeClass("editable");
	            cell.addClass("editing");
	            var text = cell.find('#cell-content').html();
	            var hidden =cell.find(type);
	            var name= "";
	            var placeholder;
	            
	            //fist editing
	            if(hidden.length <=0){
	            	placeholder= cell.find('.entry_item_placeholder');
	            	name = placeholder.attr('id');
	            	hidden=$('<input type="hidden" style="width:80%" name="'+ name +'" type="text" value="'+text+'"/>');
	            	placeholder.replaceWith(hidden);
            	//already edited
	            }else{
	            	name = hidden.attr("name");
	            	
	            	placeholder=hidden;
	            }
	            
	            var input = $('<'+type+' style="width:80%" name="'+ name +'" class="celleditor" type="text" value="'+text+'"/>');
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
	    }
}