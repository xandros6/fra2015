/**
 * Sum all the values in the columns of wich some td has class 'total' only if
 * all the fields are filled
 */
$(function(){
	$('.total').each(function(){
		
		var columnnumber =$(this).attr('columnnumber');
		var table = $(this).closest('table');
		var totcel =$(this); 
		var colentries = table.find('tr:not(".skipTotal") [columnnumber="'+columnnumber+'"].text');
		
		var update = function (){
			var tot = 0.0;
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
				
				// ///////////////////////////////////////////////////////////////////////////
				// The 4b particular table should calculate the total even if not all the 
				// rows above have been completed by the country, as the country could not 
				// have information on all of them.
				// ///////////////////////////////////////////////////////////////////////////
				var entryItem = $(container[0].parentNode);
				var isQ4bTable = entryItem.attr('entry-id') ? (entryItem.attr('entry-id') == '4b' ? true : false) : false;
				
				var isNumeric = $.isNumeric(value);
				
				if(!isNumeric && isQ4bTable){
					value = "0";
					isNumeric = true;
				}
				
				if (isNumeric){
					var sum = parseFloat(value);
					tot = sum + tot;
					tot -= tot - tot.toFixed(12); 
				}else{
					allAvaliable=false;
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