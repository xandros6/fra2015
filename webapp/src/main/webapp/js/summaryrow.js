/**
 * This function hide empty records inside the survey summary table
 */
function hideEmptySummaryRecords(element){
	
	var row = $(element);
	
	// //////////////////////////////////////////////
	// Find a previous TD that have rowspan defined
	// //////////////////////////////////////////////
	var tr;
	var rowspanTd;
	var rowspanTdValue;
	
	var haveRowSpan = false;
	while(!haveRowSpan){
		if(!tr){
			tr = row.prev();
		}else{
			tr = tr.prev();
		}

		var td = tr.find(">:first-child");
		if(td.attr("rowspan")){
			haveRowSpan = true;
			rowspanTd = td;
			rowspanTdValue = td.attr("rowspan");
		}
	}
	
	// ////////////////////////////////////////
	// Cycle inside the interesting row cell 
	// in order to know if data exists.
	// ////////////////////////////////////////
	var rowCells = element.cells;
	
	var emptyNumber = 0;
	for(var i=2; i<rowCells.length; i++){
		var cell = rowCells[i];
		
		var content = cell.textContent.trim();
		if(content.match(/^(\s|,)*$/)){
			emptyNumber++;
		}
	}
	
	var empty;
	if(rowCells.length - 2 == emptyNumber){
		empty = true;
	}else{
		empty = false;
	}

	// /////////////////////////////////////
	// Hide the Row if not contains data
	// /////////////////////////////////////
	if(empty){
		row.hide();
		
		var newRowSpanValue = rowspanTdValue - 1;
		rowspanTd.attr("rowspan", newRowSpanValue);
		
		if(newRowSpanValue <= 1){
			tr.hide();
		}
	}
}