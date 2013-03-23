
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
	        
	        if ( cell.hasClass('editable') ){
	            cell.removeClass("editable");
	            cell.addClass("editing");
	            var text = cell.find('#cell-content').html();
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
	            
	            if(fra.isNumeric(name) ) {cell.addClass('number');}
		        
				if(cell.hasClass('number')){type='input';}
	            var input = $('<'+type+' style="width:80%" name="'+ name +'" class="celleditor" type="text" value="'+text+'"/>');
	            input.val(text);
	            if (cell.hasClass('number')){
	                // on keydown verify if the key is a number
	                input.keydown(function(evt){
	                	return ( event.ctrlKey || event.altKey 
	                            || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false) 
	                            || (95<event.keyCode && event.keyCode<106)
	                            || (event.keyCode==8) || (event.keyCode==9) 
	                            || (event.keyCode>34 && event.keyCode<40) 
	                            || (event.keyCode==46)
	                            || (event.keyCode==109)
	                            || (event.keyCode==110)
	                            ||  (event.keyCode==190)
	                           ) 
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
	                    fra.dirty=true;
	                    
	                }
	                return false;
	            });
	            cell.find('.celleditor').focus();
	            $('input').bind('keypress keydown keyup', function(e){
	                if(e.keyCode == 13) { e.preventDefault(); }
	             });
	        }
	        return false;
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
			case "20":
				return col=="1" && row=="1"
			}
			
	    },
	    setNumber:function(cell){
	    	var type='textarea';
	        
	        placeholder= cell.find('.entry_item_placeholder');
	        if(placeholder.length <=0) return;
            name = placeholder.attr('id');
            if(!name) return;
            if(fra.isNumeric(name) ) {cell.addClass('number');}
    }
}

//assign number class to all td interessed:
$(function(){
	$('.entry td.editable').each(function(){
		fra.setNumber($(this));
	});
})

//not all numerics are 3b,33 (not a variable,only first column) 4b_x_3,7_X_1_,7_X_2,8b_x_3,_fraVariable_20_1_1_
var allnumericVariables = ["1a","1b","2a","2b","2c","3a","3c","3d","3e","4a","5a","5b","6","8a","9","12","14","16","17","18a","18b","19","21a","21b"]
/* some numeric values from summary
var numericVariablelist = ["_fraVariable_1a_2_1_",
                           "_fraVariable_1a_2_2_",
                           "_fraVariable_1a_2_3_",
                           "_fraVariable_1a_2_4_",
                           "_fraVariable_1a_2_5_",
                           "_fraVariable_1a_3_1_",
                           "_fraVariable_1a_3_2_",
                           "_fraVariable_1a_3_3_",
                           "_fraVariable_1a_3_4_",
                           "_fraVariable_1a_3_5_",
                           "_fraVariable_1a_4_1_",
                           "_fraVariable_1a_4_2_",
                           "_fraVariable_1a_4_3_",
                           "_fraVariable_1a_4_4_",
                           "_fraVariable_1a_4_5_",
                           "_fraVariable_1a_5_1_",
                           "_fraVariable_1a_5_2_",
                           "_fraVariable_1a_5_3_",
                           "_fraVariable_1a_5_4_",
                           "_fraVariable_1a_5_5_",
                           "_fraVariable_1a_6_1_",
                           "_fraVariable_1a_6_2_",
                           "_fraVariable_1a_6_3_",
                           "_fraVariable_1a_6_4_",
                           "_fraVariable_1a_6_5_",
                           "_fraVariable_1a_7_1_",
                           "_fraVariable_1a_7_2_",
                           "_fraVariable_1a_7_3_",
                           "_fraVariable_1a_7_4_",
                           "_fraVariable_1a_7_5_",
                           "_fraVariable_1b_2_1_",
                           "_fraVariable_1b_2_6_",
                           "_fraVariable_1b_2_2_",
                           "_fraVariable_1b_2_7_",
                           "_fraVariable_1b_2_3_",
                           "_fraVariable_1b_2_8_",
                           "_fraVariable_1b_2_4_",
                           "_fraVariable_1b_2_9_",
                           "_fraVariable_1b_2_5_",
                           "_fraVariable_1b_2_10_",
                           "_fraVariable_1b_3_1_",
                           "_fraVariable_1b_3_6_",
                           "_fraVariable_1b_3_2_",
                           "_fraVariable_1b_3_7_",
                           "_fraVariable_1b_3_3_",
                           "_fraVariable_1b_3_8_",
                           "_fraVariable_1b_3_4_",
                           "_fraVariable_1b_3_9_",
                           "_fraVariable_1b_3_5_",
                           "_fraVariable_1b_3_10_",
                           "_fraVariable_1b_4_1_",
                           "_fraVariable_1b_4_6_",
                           "_fraVariable_1b_4_2_",
                           "_fraVariable_1b_4_7_",
                           "_fraVariable_1b_4_3_",
                           "_fraVariable_1b_4_8_",
                           "_fraVariable_1b_4_4_",
                           "_fraVariable_1b_4_9_",
                           "_fraVariable_1b_4_5_",
                           "_fraVariable_1b_4_10_",
                           "_fraVariable_1b_5_1_",
                           "_fraVariable_1b_5_6_",
                           "_fraVariable_1b_5_2_",
                           "_fraVariable_1b_5_7_",
                           "_fraVariable_1b_5_3_",
                           "_fraVariable_1b_5_8_",
                           "_fraVariable_1b_5_4_",
                           "_fraVariable_1b_5_9_",
                           "_fraVariable_1b_5_5_",
                           "_fraVariable_1b_5_10_",
                           "_fraVariable_1b_6_1_",
                           "_fraVariable_1b_6_6_",
                           "_fraVariable_1b_6_2_",
                           "_fraVariable_1b_6_7_",
                           "_fraVariable_1b_6_3_",
                           "_fraVariable_1b_6_8_",
                           "_fraVariable_1b_6_4_",
                           "_fraVariable_1b_6_9_",
                           "_fraVariable_1b_6_5_",
                           "_fraVariable_1b_6_10_",
                           "_fraVariable_1b_7_1_",
                           "_fraVariable_1b_7_6_",
                           "_fraVariable_1b_7_2_",
                           "_fraVariable_1b_7_7_",
                           "_fraVariable_1b_7_3_",
                           "_fraVariable_1b_7_8_",
                           "_fraVariable_1b_7_4_",
                           "_fraVariable_1b_7_9_",
                           "_fraVariable_1b_7_5_",
                           "_fraVariable_1b_7_10_",
                           "_fraVariable_1b_8_1_",
                           "_fraVariable_1b_8_6_",
                           "_fraVariable_1b_8_2_",
                           "_fraVariable_1b_8_7_",
                           "_fraVariable_1b_8_3_",
                           "_fraVariable_1b_8_8_",
                           "_fraVariable_1b_8_4_",
                           "_fraVariable_1b_8_9_",
                           "_fraVariable_1b_8_5_",
                           "_fraVariable_1b_8_10_",
                           "_fraVariable_2a_2_1_",
                           "_fraVariable_2a_2_2_",
                           "_fraVariable_2a_2_3_",
                           "_fraVariable_2a_2_4_",
                           "_fraVariable_2a_2_5_",
                           "_fraVariable_2a_3_1_",
                           "_fraVariable_2a_3_2_",
                           "_fraVariable_2a_3_3_",
                           "_fraVariable_2a_3_4_",
                           "_fraVariable_2a_3_5_",
                           "_fraVariable_2a_4_1_",
                           "_fraVariable_2a_4_2_",
                           "_fraVariable_2a_4_3_",
                           "_fraVariable_2a_4_4_",
                           "_fraVariable_2a_4_5_",
                           "_fraVariable_2a_4_1_",
                           "_fraVariable_2a_4_2_",
                           "_fraVariable_2a_4_3_",
                           "_fraVariable_2a_4_4_",
                           "_fraVariable_2a_4_5_",
                           "_fraVariable_2a_5_1_",
                           "_fraVariable_2a_5_2_",
                           "_fraVariable_2a_5_3_",
                           "_fraVariable_2a_5_4_",
                           "_fraVariable_2a_5_5_",
                           "_fraVariable_2a_6_1_",
                           "_fraVariable_2a_6_2_",
                           "_fraVariable_2a_6_3_",
                           "_fraVariable_2a_6_4_",
                           "_fraVariable_2a_6_5_",
                           "_fraVariable_2b_7_1_",
                           "_fraVariable_2b_7_2_",
                           "_fraVariable_2b_7_3_",
                           "_fraVariable_2b_7_4_",
                           "_fraVariable_2b_7_5_",
                           "_fraVariable_2b_7_6_",
                           "_fraVariable_2b_7_7_",
                           "_fraVariable_2b_7_8_",
                           "_fraVariable_2b_7_9_",
                           "_fraVariable_2c_2_1_",
                           "_fraVariable_2c_2_2_",
                           "_fraVariable_2c_2_3_",
                           "_fraVariable_2c_2_4_",
                           "_fraVariable_2c_2_5_",
                           "_fraVariable_2c_3_1_",
                           "_fraVariable_2c_3_2_",
                           "_fraVariable_2c_3_3_",
                           "_fraVariable_2c_3_4_",
                           "_fraVariable_2c_3_5_",
                           "_fraVariable_3a_3_1_",
                           "_fraVariable_3a_3_6_",
                           "_fraVariable_3a_3_2_",
                           "_fraVariable_3a_3_7_",
                           "_fraVariable_3a_3_3_",
                           "_fraVariable_3a_3_8_",
                           "_fraVariable_3a_3_4_",
                           "_fraVariable_3a_3_9_",
                           "_fraVariable_3a_3_5_",
                           "_fraVariable_3a_3_10_",
                           "_fraVariable_3a_4_1_",
                           "_fraVariable_3a_4_6_",
                           "_fraVariable_3a_4_2_",
                           "_fraVariable_3a_4_7_",
                           "_fraVariable_3a_4_3_",
                           "_fraVariable_3a_4_8_",
                           "_fraVariable_3a_4_4_",
                           "_fraVariable_3a_4_9_",
                           "_fraVariable_3a_4_5_",
                           "_fraVariable_3a_4_10_",
                           "_fraVariable_3a_5_1_",
                           "_fraVariable_3a_5_6_",
                           "_fraVariable_3a_5_2_",
                           "_fraVariable_3a_5_7_",
                           "_fraVariable_3a_5_3_",
                           "_fraVariable_3a_5_8_",
                           "_fraVariable_3a_5_4_",
                           "_fraVariable_3a_5_9_",
                           "_fraVariable_3a_5_5_",
                           "_fraVariable_3a_5_10_",
                           "_fraVariable_3a_6_1_",
                           "_fraVariable_3a_6_6_",
                           "_fraVariable_3a_6_2_",
                           "_fraVariable_3a_6_7_",
                           "_fraVariable_3a_6_3_",
                           "_fraVariable_3a_6_8_",
                           "_fraVariable_3a_6_4_",
                           "_fraVariable_3a_6_9_",
                           "_fraVariable_3a_6_5_",
                           "_fraVariable_3a_6_10_",
                           "_fraVariable_3a_7_1_",
                           "_fraVariable_3a_7_6_",
                           "_fraVariable_3a_7_2_",
                           "_fraVariable_3a_7_7_",
                           "_fraVariable_3a_7_3_",
                           "_fraVariable_3a_7_8_",
                           "_fraVariable_3a_7_4_",
                           "_fraVariable_3a_7_9_",
                           "_fraVariable_3a_7_5_",
                           "_fraVariable_3a_7_10_",
                           "_fraVariable_3a_8_1_",
                           "_fraVariable_3a_8_6_",
                           "_fraVariable_3a_8_2_",
                           "_fraVariable_3a_8_7_",
                           "_fraVariable_3a_8_3_",
                           "_fraVariable_3a_8_8_",
                           "_fraVariable_3a_8_4_",
                           "_fraVariable_3a_8_9_",
                           "_fraVariable_3a_8_5_",
                           "_fraVariable_3a_8_10_",
                           "_fraVariable_3c_3_1_",
                           "_fraVariable_3c_3_2_",
                           "_fraVariable_3c_3_3_",
                           "_fraVariable_3c_3_4_",
                           "_fraVariable_3c_3_5_",
                           "_fraVariable_3c_4_1_",
                           "_fraVariable_3c_4_2_",
                           "_fraVariable_3c_4_3_",
                           "_fraVariable_3c_4_4_",
                           "_fraVariable_3c_4_5_",
                           "_fraVariable_3c_5_1_",
                           "_fraVariable_3c_5_2_",
                           "_fraVariable_3c_5_3_",
                           "_fraVariable_3c_5_4_",
                           "_fraVariable_3c_5_5_",
                           "_fraVariable_3d_3_1_",
                           "_fraVariable_3d_3_6_",
                           "_fraVariable_3d_3_2_",
                           "_fraVariable_3d_3_7_",
                           "_fraVariable_3d_3_3_",
                           "_fraVariable_3d_3_8_",
                           "_fraVariable_3d_3_4_",
                           "_fraVariable_3d_3_9_",
                           "_fraVariable_3d_3_5_",
                           "_fraVariable_3d_3_10_",
                           "_fraVariable_3d_4_1_",
                           "_fraVariable_3d_4_6_",
                           "_fraVariable_3d_4_2_",
                           "_fraVariable_3d_4_7_",
                           "_fraVariable_3d_4_3_",
                           "_fraVariable_3d_4_8_",
                           "_fraVariable_3d_4_4_",
                           "_fraVariable_3d_4_9_",
                           "_fraVariable_3d_4_5_",
                           "_fraVariable_3d_4_10_",
                           "_fraVariable_3d_5_1_",
                           "_fraVariable_3d_5_6_",
                           "_fraVariable_3d_5_2_",
                           "_fraVariable_3d_5_7_",
                           "_fraVariable_3d_5_3_",
                           "_fraVariable_3d_5_8_",
                           "_fraVariable_3d_5_4_",
                           "_fraVariable_3d_5_9_",
                           "_fraVariable_3d_5_5_",
                           "_fraVariable_3d_5_10_",
                           "_fraVariable_3e_3_1_",
                           "_fraVariable_3e_3_6_",
                           "_fraVariable_3e_3_2_",
                           "_fraVariable_3e_3_7_",
                           "_fraVariable_3e_3_3_",
                           "_fraVariable_3e_3_8_",
                           "_fraVariable_3e_3_4_",
                           "_fraVariable_3e_3_9_",
                           "_fraVariable_3e_3_5_",
                           "_fraVariable_3e_3_10_",
                           "_fraVariable_3e_4_1_",
                           "_fraVariable_3e_4_6_",
                           "_fraVariable_3e_4_2_",
                           "_fraVariable_3e_4_7_",
                           "_fraVariable_3e_4_3_",
                           "_fraVariable_3e_4_8_",
                           "_fraVariable_3e_4_4_",
                           "_fraVariable_3e_4_9_",
                           "_fraVariable_3e_4_5_",
                           "_fraVariable_3e_4_10_",
                           "_fraVariable_3e_6_1_",
                           "_fraVariable_3e_6_6_",
                           "_fraVariable_3e_6_2_",
                           "_fraVariable_3e_6_7_",
                           "_fraVariable_3e_6_3_",
                           "_fraVariable_3e_6_8_",
                           "_fraVariable_3e_6_4_",
                           "_fraVariable_3e_6_9_",
                           "_fraVariable_3e_6_5_",
                           "_fraVariable_3e_6_10_",
                           "_fraVariable_3e_7_1_",
                           "_fraVariable_3e_7_6_",
                           "_fraVariable_3e_7_2_",
                           "_fraVariable_3e_7_7_",
                           "_fraVariable_3e_7_3_",
                           "_fraVariable_3e_7_8_",
                           "_fraVariable_3e_7_4_",
                           "_fraVariable_3e_7_9_",
                           "_fraVariable_3e_7_5_",
                           "_fraVariable_3e_7_10_",
                           "_fraVariable_3e_9_1_",
                           "_fraVariable_3e_9_6_",
                           "_fraVariable_3e_9_2_",
                           "_fraVariable_3e_9_7_",
                           "_fraVariable_3e_9_3_",
                           "_fraVariable_3e_9_8_",
                           "_fraVariable_3e_9_4_",
                           "_fraVariable_3e_9_9_",
                           "_fraVariable_3e_9_5_",
                           "_fraVariable_3e_9_10_",
                           "_fraVariable_4a_2_1_",
                           "_fraVariable_4a_2_2_",
                           "_fraVariable_4a_2_3_",
                           "_fraVariable_4a_2_4_",
                           "_fraVariable_4a_2_5_",
                           "_fraVariable_4a_3_1_",
                           "_fraVariable_4a_3_2_",
                           "_fraVariable_4a_3_3_",
                           "_fraVariable_4a_3_4_",
                           "_fraVariable_4a_3_5_",
                           "_fraVariable_4a_4_1_",
                           "_fraVariable_4a_4_2_",
                           "_fraVariable_4a_4_3_",
                           "_fraVariable_4a_4_4_",
                           "_fraVariable_4a_4_5_",
                           "_fraVariable_5a_2_1_",
                           "_fraVariable_5a_2_2_",
                           "_fraVariable_5a_2_3_",
                           "_fraVariable_5a_2_4_",
                           "_fraVariable_5a_2_5_",
                           "_fraVariable_5a_3_1_",
                           "_fraVariable_5a_3_2_",
                           "_fraVariable_5a_3_3_",
                           "_fraVariable_5a_3_4_",
                           "_fraVariable_5a_3_5_",
                           "_fraVariable_5a_4_1_",
                           "_fraVariable_5a_4_2_",
                           "_fraVariable_5a_4_3_",
                           "_fraVariable_5a_4_4_",
                           "_fraVariable_5a_4_5_",
                           "_fraVariable_5a_5_1_",
                           "_fraVariable_5a_5_2_",
                           "_fraVariable_5a_5_3_",
                           "_fraVariable_5a_5_4_",
                           "_fraVariable_5a_5_5_",
                           "_fraVariable_5a_6_1_",
                           "_fraVariable_5a_6_2_",
                           "_fraVariable_5a_6_3_",
                           "_fraVariable_5a_6_4_",
                           "_fraVariable_5a_6_5_",
                           "_fraVariable_5a_7_1_",
                           "_fraVariable_5a_7_2_",
                           "_fraVariable_5a_7_3_",
                           "_fraVariable_5a_7_4_",
                           "_fraVariable_5a_7_5_",
                           "_fraVariable_5a_8_1_",
                           "_fraVariable_5a_8_2_",
                           "_fraVariable_5a_8_3_",
                           "_fraVariable_5a_8_4_",
                           "_fraVariable_5a_8_5_",
                           "_fraVariable_5b_2_1_",
                           "_fraVariable_5b_2_2_",
                           "_fraVariable_5b_2_3_",
                           "_fraVariable_5b_2_4_",
                           "_fraVariable_5b_2_5_",
                           "_fraVariable_5b_3_1_",
                           "_fraVariable_5b_3_2_",
                           "_fraVariable_5b_3_3_",
                           "_fraVariable_5b_3_4_",
                           "_fraVariable_5b_3_5_",
                           "_fraVariable_5b_4_1_",
                           "_fraVariable_5b_4_2_",
                           "_fraVariable_5b_4_3_",
                           "_fraVariable_5b_4_4_",
                           "_fraVariable_5b_4_5_",
                           "_fraVariable_5b_5_1_",
                           "_fraVariable_5b_5_2_",
                           "_fraVariable_5b_5_3_",
                           "_fraVariable_5b_5_4_",
                           "_fraVariable_5b_5_5_",
                           "_fraVariable_5b_6_1_",
                           "_fraVariable_5b_6_2_",
                           "_fraVariable_5b_6_3_",
                           "_fraVariable_5b_6_4_",
                           "_fraVariable_5b_6_5_",
                           "_fraVariable_6_2_1_",
                           "_fraVariable_6_2_2_",
                           "_fraVariable_6_2_3_",
                           "_fraVariable_6_2_4_",
                           "_fraVariable_6_2_5_",
                           "_fraVariable_6_3_1_",
                           "_fraVariable_6_3_2_",
                           "_fraVariable_6_3_3_",
                           "_fraVariable_6_3_4_",
                           "_fraVariable_6_3_5_",
                           "_fraVariable_8a_3_1_",
                           "_fraVariable_8a_3_2_",
                           "_fraVariable_8a_3_3_",
                           "_fraVariable_8a_3_4_",
                           "_fraVariable_8a_3_5_",
                           "_fraVariable_8a_3_6_",
                           "_fraVariable_8a_3_7_",
                           "_fraVariable_8a_3_8_",
                           "_fraVariable_8a_3_9_",
                           "_fraVariable_8a_3_10_",
                           "_fraVariable_8a_4_1_",
                           "_fraVariable_8a_4_2_",
                           "_fraVariable_8a_4_3_",
                           "_fraVariable_8a_4_4_",
                           "_fraVariable_8a_4_5_",
                           "_fraVariable_8a_4_6_",
                           "_fraVariable_8a_4_7_",
                           "_fraVariable_8a_4_8_",
                           "_fraVariable_8a_4_9_",
                           "_fraVariable_8a_4_10_",
                           "_fraVariable_8a_7_1_",
                           "_fraVariable_8a_7_2_",
                           "_fraVariable_8a_7_3_",
                           "_fraVariable_8a_7_4_",
                           "_fraVariable_8a_7_5_",
                           "_fraVariable_8a_7_6_",
                           "_fraVariable_8a_7_7_",
                           "_fraVariable_8a_7_9_",
                           "_fraVariable_8a_7_10_",
                           "_fraVariable_8a_8_1_",
                           "_fraVariable_8a_8_2_",
                           "_fraVariable_8a_8_3_",
                           "_fraVariable_8a_8_4_",
                           "_fraVariable_8a_8_5_",
                           "_fraVariable_8a_8_6_",
                           "_fraVariable_8a_8_7_",
                           "_fraVariable_8a_8_8_",
                           "_fraVariable_8a_8_9_",
                           "_fraVariable_8a_8_10_",
                           "_fraVariable_9_1_1_",
                           "_fraVariable_17_2_1_",
                           "_fraVariable_17_2_2_",
                           "_fraVariable_17_2_3_",
                           "_fraVariable_17_3_1_",
                           "_fraVariable_17_3_2_",
                           "_fraVariable_17_3_3_",
                           "_fraVariable_18a_2_1_",
                           "_fraVariable_18a_2_2_",
                           "_fraVariable_18a_2_3_",
                           "_fraVariable_18a_2_4_",
                           "_fraVariable_18a_3_1_",
                           "_fraVariable_18a_3_2_",
                           "_fraVariable_18a_3_3_",
                           "_fraVariable_18a_3_4_",
                           "_fraVariable_18a_4_1_",
                           "_fraVariable_18a_4_2_",
                           "_fraVariable_18a_4_3_",
                           "_fraVariable_18a_4_4_",
                           "_fraVariable_18a_5_1_",
                           "_fraVariable_18a_5_2_",
                           "_fraVariable_18a_5_3_",
                           "_fraVariable_18a_5_4_",
                           "_fraVariable_18a_6_1_",
                           "_fraVariable_18a_6_2_",
                           "_fraVariable_18a_6_3_",
                           "_fraVariable_18a_6_4_",
                           "_fraVariable_18a_7_1_",
                           "_fraVariable_18a_7_2_",
                           "_fraVariable_18a_7_3_",
                           "_fraVariable_18a_7_4_",
                           "_fraVariable_18a_8_1_",
                           "_fraVariable_18a_8_2_",
                           "_fraVariable_18a_8_3_",
                           "_fraVariable_18a_8_4_",
                           "_fraVariable_18a_9_1_",
                           "_fraVariable_18a_9_2_",
                           "_fraVariable_18a_9_3_",
                           "_fraVariable_18a_9_4_",
                           "_fraVariable_18b_2_1_",
                           "_fraVariable_18b_2_2_",
                           "_fraVariable_18b_2_3_",
                           "_fraVariable_18b_2_4_",
                           "_fraVariable_18b_3_1_",
                           "_fraVariable_18b_3_2_",
                           "_fraVariable_18b_3_3_",
                           "_fraVariable_18b_3_4_",
                           "_fraVariable_18b_4_1_",
                           "_fraVariable_18b_4_2_",
                           "_fraVariable_18b_4_3_",
                           "_fraVariable_18b_4_4_",
                           "_fraVariable_18b_5_1_",
                           "_fraVariable_18b_5_2_",
                           "_fraVariable_18b_5_3_",
                           "_fraVariable_18b_5_4_",
                           "_fraVariable_18b_6_1_",
                           "_fraVariable_18b_6_2_",
                           "_fraVariable_18b_6_3_",
                           "_fraVariable_18b_6_4_",
                           "_fraVariable_19_2_1_",
                           "_fraVariable_19_2_2_",
                           "_fraVariable_19_2_3_",
                           "_fraVariable_19_2_4_",
                           "_fraVariable_19_3_1_",
                           "_fraVariable_19_3_2_",
                           "_fraVariable_19_3_3_",
                           "_fraVariable_19_3_4_",
                           "_fraVariable_21a_2_1_",
                           "_fraVariable_21a_2_2_",
                           "_fraVariable_21b_2_1_",
        ];
        */
