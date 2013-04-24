
fra = {
		deleteRow:function(){
	    	var row = $(this).closest("tr");
	    	var table = $(this).closest("table");
	    	var rows = table.find("tr");
	    	// at least 2 rows containing inputs
	    	var entries =0;
	    	for (var i = 0;i<rows.length && entries <2; i++){
	    		$(rows[i]).find('.entry-item').length >0 ?entries++ : entries;
	    	}
	    	if (entries<2){
    			alert(fra.messages.deleterowdenied); // TODO i18n
				 return false;
	    	}
	    	
	    	 var result = window.confirm(fra.messages.deleterowconfirm);
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
	 	    	//remove row
	            row.remove();
	            fra.dirty=true;
	         }

	         return false;
	    },
	    editRow: function(){
    		var type='textarea';
	        var cell = $(this);
	        if(cell.hasClass('editing')){
	        	return true;
	        }
	        
	        if ( cell.hasClass('editable') ){
	            cell.removeClass("editable");
	            cell.addClass("editing");
	            var text = cell.find('#cell-content').text();
	            var hidden =cell.find('input:hidden');
	            var name= "";
	            var placeholder;
	            
	            // fist editing
	            if(hidden.length <=0){
	            	placeholder= cell.find('.entry_item_placeholder');
	            	name = placeholder.attr('id');
	            	hidden=$('<input type="hidden" style="width:80%" name="'+ name +'" type="text" value="'+text+'"/>');
	            	placeholder.replaceWith(hidden);
            	// already edited
	            }else{
	            	name = hidden.attr("name");
	            	
	            	placeholder=hidden;
	            }
	            var textalign ='left';
	            if(fra.isNumeric(name) ) {cell.addClass('number');textalign='right';}
	            var cls = "";
				if(cell.hasClass('number')){type='input';cls="input-small"}
				
	            var input = $('<'+type+' style="text-align:'+textalign+';" name="'+ name +'" class="celleditor '+cls+'"" type="text" value="'+text+'"/>');
	            input.val(text);
	            var oldtext = text;
            	var hideEditor = function(){  
            		
	                if ( cell.hasClass('editing') ){
	                    cell.removeClass("editing");
	                    cell.addClass("editable");
	                    var text = cell.find(".celleditor").attr('value');
	                    if(cell.hasClass('number')){
		                    try{
		                    	if(text!=""){
			                    	text =Number(text);
			                    	
			                    	if(isNaN(text)){ 
			                    		text="N/A"; 		
		                    		}
		                    	}
		                    }catch(e){
		                    	text=oldtext;
		                    }
	                	}
	                    cell.find('#cell-content').text( text );
	                    
                    	hidden.val( text );
	                    if(oldtext!=text){
	                    	hidden.trigger('change');
	                    	fra.dirty=true;
	                    	
	                    }
	                    
	                    
	                    
	                }
	                return false;
	            }
	            if (cell.hasClass('number')){
	                // on keydown verify if the key is a number
	                input.keydown(function(e){
	                	var evt=(e)?e:(window.event)?window.event:null;
	                    if(evt){
	                       var code=(evt.charCode)?evt.charCode:((evt.keyCode)?evt.keyCode:((evt.which)?evt.which:0));
	                   
	                	return ( evt.ctrlKey || evt.altKey 
	                            || (47<code && code<58 && evt.shiftKey==false) 
	                            || (95<code && code<106)
	                            || (code==8)  
	                            || (code>34 && code<40) 
	                            || (code==46)
	                            || (code==109)
	                            || (code==110)
	                            ||  (code==190)
	                            || (code==78)
	                            || (code==65)
	                            || (code==47)
	                           ) 
	                    }
	                });                               
	            }
	            //tab navigation
	            input.bind('keydown',function(e){
                	var evt=(e)?e:(window.event)?window.event:null;
                	if(evt){
	                       var code=(evt.charCode)?evt.charCode:((evt.keyCode)?evt.keyCode:((evt.which)?evt.which:0));
	                     if(evt.shiftKey && code == 9){
	                    	 evt.preventDefault();
	                    	 $(this).each(hideEditor);
	                    	 fra.showPrevious(cell);
	                    	 return true;
	                     }
		                if(code==9){
		                	 evt.preventDefault();
		        	    	$(this).each(hideEditor);

	                		fra.showNext(cell)
	                		 
	                		
	                    	 
	                    }
                	}
                });    
	            cell.find('#cell-content').html( input );
	            cell.find('.celleditor').blur(hideEditor);
	            cell.find('.celleditor').focus();
	            $('input').bind('keypress keydown keyup', function(e){
	                if(e.keyCode == 13) { e.preventDefault(); }
	                
	                
	             });
	        }
	        return false;
	    },
	    showPrevious: function(cell){
	    	var nextCell = cell.prev('td.editable');
	    	if (nextCell.length<=0){
	    		var nextCell = cell.closest('tr').prev('tr').contents('td.editable').last();
	    	}
	    	if(nextCell.length>0){
   			 
   			 nextCell.trigger('mousedown');
           	 
   			 return true;
	    	}
	    	
	    },
	    showNext:function(cell){
    		var nextCell = cell.next('td.editable');
    		 if (nextCell.length<=0){
    			 var nextCell = cell.closest('tr').next('tr').contents('td.editable').first();
    		 }
    		 if(nextCell.length>0){
    			 
    			 nextCell.trigger('mousedown');
            	 
    			 return true;
    		 }
    		 /*//next entry
    		 var nextEntry = cell.closest('.entry').next('.entry');
    		 if(nextEntry.length<=0){
    			 nextEntry = cell.closest('.entry').closest('div').next('div');
    			 
    		 }
    		 if(nextEntry.length<=0){
    			 nextEntry = cell.closest('section').next('section');
    			 
    		 }
    		 alert(nextEntry.length)
    		 //another table
    		 var nextCell = nextEntry.find('td.editable');
    		 if (nextCell.length<=0){
    			 var nextCell = nextEntry.find('input');
    		 }
    		 if (nextCell.length<=0){
    			 var nextCell = nextEntry.find('select');
    		 }
    		 if(nextCell.length<=0){
    			 var nextCell = nextEntry.find('textarea');
    		 }
    		 alert(nextCell.length);
    		 if(nextCell.length>0){
    			 nextCell.trigger('mousedown');
            	 e.preventDefault();
    			 return true;
    		 }
    		 */
    		 
	    },
	    
	    isNumeric: function (name){
	    	var myRegexp = /_fraVariable_([^_]*)_([^_]*)_([^_]*)_/;
			var match = myRegexp.exec(name);
			var varname = match[1];
			var row = match[2];
			var col = match[3];
			if(allnumericVariables.indexOf(varname)>=0 ) return true;
			switch(varname){
			case "3b":
				return parseInt(col)>2;
			case "4b":
				return col =="3" || col =="4" ;
			case "7":
				return col =="2" || col =="1";
			case "8b":
				return col=="3";	
			case "16b":
				return col>"0";
			case "20":
				return col=="1" && row=="1";
			case "13a":
				return col=="1";
			}
			
	    },
	    setNumber:function(cell){
	    	var type='textarea';
	        
	        placeholder= cell.find('.entry_item_placeholder');
	        if(placeholder.length <=0) return;
            name = placeholder.attr('id');
            if(!name) return;
            if(fra.isNumeric(name) ) {
            	cell.addClass('number');
            	var content=cell.find('#cell-content');
            	var text = cell.find('#cell-content').text();
            	if(text!=""){
                	text =Number(text);
                	
                	if(isNaN(text)){ 
                		text="N/A"; 		
            		}
            	}
            	content.text(text)
        	}
    }
}
$(function(){
	$('.useit').click(function(){
		var body = $(this).closest('.feedbackentry').find('.feedbackentry-body').html();
		var block =  $(this).closest('div.feedback-block');
		var id = block.find('textarea').attr('name');
		var ckid =  id;
		var editor = CKEDITOR.instances[ckid]
		editor.setData(editor.getData() + body);
	});
	
});
//assign number class to all td interessed:
$(function(){
	$('.entry td.editable').each(function(){
		fra.setNumber($(this));
	});
})

//not all numerics are 3b,33 (not a variable,only first column) 4b_x_3,7_X_1_,7_X_2,8b_x_3,_fraVariable_20_1_1_
var allnumericVariables = ["1a","1b","2a","2b","2c","3a","3c","3d","3e","4a","4c","5a","5b","6","8a","9","12","14","16a","17","18a","18b","19","21a","21b"]


