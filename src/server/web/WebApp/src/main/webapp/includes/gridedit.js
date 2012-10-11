function createRow(tableIndex, rowIndex) {
    var control, cols;
                 
    control = $("#"+tableIndex+" tr:last");
                    
    cols = $("#"+tableIndex+" tr:first > th").size();
    
    var rid = tableIndex+"Row"+rowIndex;

    control.before( '<tr id="'+rid+ (rowIndex%2?'" class="odd"':'" class="even" ')+'></tr>');
                
    var row = $("#"+rid);
                    
    row = configRow(tableIndex, rowIndex, cols, true );
                
    return row;
}
            
function configRow(tableIndex, rowIndex, cols, controls) {
    
    var did = tableIndex+"DeleteRow"+rowIndex;
    var eid = tableIndex+"EditRow"+rowIndex;
    var sid = tableIndex+"SaveRow"+rowIndex; 
    
    var row = $("#"+tableIndex+"Row"+rowIndex);
                
    var result= "", i=0;
                
    for (i;i<cols;i++) {
        result+="<td";
        switch (i) {
            case cols-1:
                result+=">"
                if (controls)  {
                    result+='<input id="'+did+'" type="button" value="-" />';
                    result+='<input id="'+eid+'" type="button" value="Edit" />';
                    result+='<input id="'+sid+'" type="button" value="Done"/>';
                }
                break;
            default:
                result+=" class=\"editable\">";
        }

        result+="</td>";
    }
       $("#"+did).button();          
    row.html(result);
    
    var button = $("#"+did);
    button.button();
    button.click(function(ev) {
                        
        deleteRow(tableIndex, rowIndex);
                        
    });
                    
    button = $("#"+eid);
    button.button();               
    button.click(function(ev) {
                        
        editRow(tableIndex, rowIndex);
                        
    });
                    
    button = $("#"+sid);
    button.button();                
    button.click(function(ev) {
                        
        commitRow(tableIndex, rowIndex);
                        
    });
    
                
    return row;
}
            
function deleteRow(tableIndex, rowIndex) {
    
    var rid = tableIndex+"Row"+rowIndex;
                
    $("#"+rid).remove();
                
}

function editRow(tableIndex, rowIndex) {
    
    var rid = tableIndex+"Row"+rowIndex;
        
    var row = $("#"+rid);
    
    if (row == null) {
        alert("Invalid row: "+rid);
        return;
    }
    
    var columns, columnCount,i;
    
    columns = $("#"+rid+" > td");
    
    columnCount = columns.size();
    
    for (i=0;i<columnCount;i++) {
        
        var cell, text;
        
        cell = $("#"+rid+" td:nth-child("+i+")");
        
        if (cell.hasClass("editable")) {
            cell.removeClass("editable");
            cell.addClass("editing");
            
            text = cell.html();
        
            cell.html('<input class="celleditor" type="text" value="'+text+'"/>');
        }
        
        
    }
    
}

function commitRow(tableIndex, rowIndex) {
    
    var rid = tableIndex+"Row"+rowIndex;
    
    var row = $("#"+rid);
    
    if (row == null) {
        alert("Invalid row: "+rid);
        return;
    }
    
    var columns, columnCount,i;
    
    columns = $("#"+rid+" > td");
    
    columnCount = columns.size();
    
    for (i=0;i<columnCount;i++) {
        
        var cell, text;
        
        cell = $("#"+rid+" td:nth-child("+i+")");
        
        if (cell.hasClass("editing")) {
            
            var input = $("#"+rid+" td:nth-child("+i+") input");
            
            text = input.val();
            
            cell.html(text);
        
            cell.removeClass("editing");
            
            cell.addClass("editable");
            
        }
        
    }
    
}


