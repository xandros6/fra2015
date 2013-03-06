$(function() {

	// editable tables
	$('td.editable.text').click(fra.editRow);
	// Delete buttons inizialization
	$('.btn.delete-btn').click(fra.deleteRow);

	// add row functionality to proper buttons
	$('.addBtn').each(
			function() {
				var entry = $(this).parent().parent().find(".entry");

				var table = entry.find('table.extensible');
				var addEmptyRow = function() {
					var last = table.find('tr:last');
					var row = last.clone();
					// change rowNumber
					$.each(row.find('td'), function(index, item) {
						var cell = $(this);
						cell.attr('rowNumber',
								parseInt(cell.attr('rowNumber')) + 1);
					});
					// replace input name if present
					$.each(row.find('td'), function(index, item) {
						var cell = $(this);
						var hidden = cell.find('input');
						var name="";
						//create the input anyway (the new row is an information too,so we have to commit)
						 if(hidden.length <=0){
			            	placeholder= cell.find('.entry_item_placeholder');
			            	if(placeholder.length<=0){return}
			            	name = placeholder.attr('id');
			            	hidden=$('<input type="hidden" style="width:80%" name="'+ name +'" type="text" value=""/>');
			            	placeholder.replaceWith(hidden);
					    }
						name = hidden.attr('name');

						var myRegexp = /(_fraVariable_[0-9A-Za-z]*_)(.*)(_.*_)/;
						var match = myRegexp.exec(name);
						if (match && match.length > 2) {
							var rowNumber = parseInt(match[2]) + 1; // row
																	// number

							var newName = name.replace(myRegexp, "$1"
									+ rowNumber + "$3");

							hidden.attr('name', newName);
						}

					});
					// change number of the row
					row.find('td').each(function() {
						if (!$(this).hasClass('entry-item')) {
							var content = $(this).html();
							try {
								var x = parseInt(content) + 1;
								if (x) {
									$(this).html(x);
								}
							} catch (e) {
							}

						}else{
							$(this).find('#cell-content').empty();
						}

					});
					row.find('.entry-item').click(fra.editRow);
					row.find('.entry-item').find('input').attr('value', "");
					row.find('.entry-item').find('div').html();

					row.appendTo(table);

					row.find('.delete-btn').click(fra.deleteRow);

					return row;
				};
				$(this).click(function(evt) {
					addEmptyRow();
					return false;
				});
			});
	$('td.boolean').each(
			function() {
				radio = $(this);
				var chks = $(this).find("input.radio-boolean").click(function(){
					chks.not(this).attr('checked', false);
				});
                    
                 
				
	});
})
