
$(function(){
	$('.total').each(function(){
		var columnnumber =$(this).attr('columnnumber');
		var table = $(this).closest('table');
		var totcel =$(this); 
		var colentries = table.find('[columnnumber="'+columnnumber+'"].text');
		var update = function (){
			var tot = 0;
			
			colentries.each(function(){
				if(totcel.is($(this))) return;
				var container = $(this).find('#cell-content');
				var value = container.text();
				if ($.isNumeric(value)){
					tot +=parseInt(value);
				}
				totcel.text(tot);
			});
			
			
		};
		colentries.each(update);
		colentries.change(update);
		
		
	
	});
});