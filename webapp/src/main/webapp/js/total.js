/**
 * Sum all the values in the columns of wich some td has class 'total' only if
 * all the fields are filled
 */
$(function(){
	$('.total').each(function(){
		var columnnumber =$(this).attr('columnnumber');
		var table = $(this).closest('table');
		var totcel =$(this); 
		var colentries = table.find('[columnnumber="'+columnnumber+'"].text');
		var update = function (){
			var tot = 0;
			var allAvaliable=true;
			colentries.each(function(){
				if(totcel.is($(this))) return;
				var rowname = $(this).closest('tr').attr("rowname");
				if(rowname){
					if(rowname.match(/^[^\.]*\.[^\.]*\..*/) )return;
					if(rowname=="1.5") return; //TOTAL = COUNTRY AREA?
				}
				var container = $(this).find('#cell-content');
				var value = container.text();
				if ($.isNumeric(value)){
					tot +=parseInt(value);
				}
				if(value.match(/^([\s\t\r\n]*)$/)){
					allAvaliable=false;
				}
				
			});
			totcel.text(allAvaliable?tot:"");
			
			
		};
		colentries.each(update);
		colentries.change(update);
		
		
	
	});
});