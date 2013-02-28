<%@ include file="taglibs.jsp"%>
<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/js/i18next-1.5.9.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui-1.9.2.custom.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ui.timepicker.js"></script>
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/ckeditor/adapters/jquery.js"></script>

<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/ejs.js"></script>

<script src="${pageContext.request.contextPath}/js/underscore.js"></script>
<!--  
		<script src="${pageContext.request.contextPath}/js/constants.js"></script>
		<script src="${pageContext.request.contextPath}/js/rest.js"></script>
		<script src="${pageContext.request.contextPath}/js/uicore.js"></script>
		<script src="${pageContext.request.contextPath}/js/survey-rules.js"></script> 
		<script src="${pageContext.request.contextPath}/js/widgets.js"></script> 
		<script src="${pageContext.request.contextPath}/js/fra2015.js"></script> 
		<script src="${pageContext.request.contextPath}/js/ui.js"></script>
		-->
<script>
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
	    }
}
</script>