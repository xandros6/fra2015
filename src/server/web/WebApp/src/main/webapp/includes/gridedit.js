var localizedStrings={
    controlButtons:{
        'addRow':'+',
        'saveTable':'Save'
    },
    rowButtons:{
        'deleteRow':'-',
        'editRow':'Edit',
        'commitRow':'Save'
    },
    
    errors:{
        'null.table':'Table is null',
        'null.row':'Row is null',
        'null.cell':'Cell is null',
        'null.columns':'Column array is null or zero length',
        'commit.noedits':'No edits to commit'
    }
};

function addLocalizedObject(selectString, obj) {
    
    localizedStrings[selectString] = obj;
    
}



function configureTable(tableIndex,columns, caption) {
    
    if (columns == null || columns.length == 0) {
        alert(localizedStrings['errors']['null.columns']);
        return;
    }
    
    var table = $(tableIndex);
    
    if (table == null) {
        alert(localizedStrings['errors']['null.table']);
    } 
    
    table.data('columns', columns);
    table.data('removed', new Array());
    
    if (caption != null) {
        table.html("<caption>"+caption+"</caption>");
    }
    
    var addText = localizedStrings['controlButtons']['addRow'];
    var saveText = localizedStrings['controlButtons']['saveTable'];
    
    var columnCount = columns.length+1;
    
    var html = table.html();
        
    html+=("<thead><tr></tr></thead>");
    
    table.html(html);
    var row = table.find("tr");//$(tableIndex+" tr:last");
    
    html = row.html();
    
    for (var i=0;i<columns.length;i++) {
       
        html+="<th>";
        html+=localizedStrings[tableIndex][columns[i]];
        html+="</th>";
        
    }
    
    html+="<th>&nbsp;</th>";
    
    row.html(html);
    
    row.after("<tr></tr>");
    
    row = table.find(" tr:last");
    
    row.html("<td colspan=\""+columnCount+"\"></td>");
    
    var control = row.find("td:last");
    
    html = "<input class=\"addButton\" type=\"button\" value=\""+addText+"\"/>";
    html += "<input class=\"saveButton\" type=\"button\" value=\""+saveText+"\"/>";
    
    control.html(html);
    
    var bAdd = control.find(".addButton");
        
    bAdd.click(function(ev){
        var row = addRow(table);
        if (row != null) {
            row.data('created',true);
        }
        row.data('id', '-1');
        
    });
    
    var bSave = control.find(".saveButton");
    
    bSave.click(onSaveTable);
}

function addRow(table) {
    
    if (table == null) {
        alert(localizedStrings['errors']['null.table']);
        return null;
    } 
    
    var removeText = localizedStrings['rowButtons']['deleteRow'];
    var editText = localizedStrings['rowButtons']['editRow'];
    
    var firstRow = table.find("tr:first");
    var lastRow = table.find("tr:last");
    
    var html = "<tr name=\""+lastRow.index()+"\">";
    
    firstRow.find("th").each(function(i) {
        
        html += "<td class=\"editable\"></td>";
        
    });
    
    html += "</tr>";
    
    lastRow.before(html);
    
    var row = lastRow.prev();
    
    if (row.index() % 2 == 0) {
        row.addClass("even");
    } else {
        row.addClass("odd");
    }
    


    
    var cell = row.find("td:last");
    
    cell.removeClass("editable");
    
    html='<input class="deleteRow" type="button" value="'+removeText+'" />';
    html+='<input class="editRow" type="button" value="'+editText+'" />';
    
    cell.html(html);
    
    var button = cell.find(".deleteRow");
                        
    button.click(onDeleteClick);
    
    button = cell.find(".editRow");
    
    button.click(onEditClick);
    
    return row;
    
}

function onSaveTable(ev) {
    
    ev.preventDefault();
    
    commitTable($(this).closest("table"));
    
}


function onDeleteClick(ev) {
    
    ev.preventDefault();
    
    var row = $(this).closest("tr");
    
    deleteRow(row);
        
}

function onEditClick(ev) {
    
    ev.preventDefault();
    
    $(this).unbind('click');
            
    var row = $(this).closest("tr");
    
    editRow(row);
        
    $(this).click(onCommitClick);
    
    $(this).val(localizedStrings['rowButtons']['commitRow']);
        
}

function onCommitClick(ev) {
    
    ev.preventDefault();
    
    $(this).unbind('click');
    
    var row = $(this).closest("tr");
    
    commitRow(row);
    
    $(this).click(onEditClick);
    
    $(this).val(localizedStrings['rowButtons']['editRow']);
    
}

function getColumnCount(tableIndex) {
    
    var table = $(tableIndex);
    
    if (table == null) {
        alert(localizedStrings['errors']['null.table']);
    } 
    
    var count = table.find(" tr:first > th").size();
    
    if (count == 0) {
        return table.find(" tr:first > td").size();
    }
    
    return count;
    
}

function deleteRow(row) {
    if (row == null) {
        alert(localizedStrings['errors']['null.row']);
        return;
    }
    
    var created = row.data('created');
    
    if (!created) {

        var table = row.closest("table");
        
        var removed = table.data('removed');
        
        alert(removed.length);
        
        removed[removed.length] = row.data('id');
        
        //        table.data('removed').push(row.data('id'));
        
        alert(removed);
        
    }
    
    row.remove();
    
}
            
function editRow(row) {
    
    if (row == null) {
        alert(localizedStrings['errors']['null.row']);
        return;
    }
    
    row.find("td").each(function(i) {
        
        var cell = row.find("td:nth-child("+i+")");
        
        if (cell != null && cell.hasClass("editable")) {
            
            cell.removeClass("editable");
            
            cell.addClass("editing");
            
            var text = cell.html();
        
            cell.html('<input class="celleditor" type="text" value="'+text+'"/>');
        }
        
    });
    

    
}

function commitRow(row) {
    
    if (row == null) {
        alert(localizedStrings['errors']['null.row']);
        return;
    }
    
    row.find("td").each(function(i) {
        
        var cell  = row.find("td:nth-child("+i+")");
        
        if (cell != null && cell.hasClass("editing")) {
            
            var text = cell.find("input").val();
            
            cell.html(text);
        
            cell.removeClass("editing");
            
            cell.addClass("editable");
            
        }
    });
    
    if (!row.data('created')) {
        row.data('updated', true);
    }
    
}


function commitTable(table) {
    
    if (table == null) {
        alert(localizedStrings['errors']['null.table']);
        return;
    }
    
    var removed = table.data('removed');
    
    for (var i =0;i<removed.length;i++) {
        //@todo ajax remove(removed[i]);
        
        alert("remove "+removed[i]);
    }
    
    table.data('removed', new Array());

    table.find("tr").each(function(index) {
        
        if ($(this).data('created')) {
            $(this).data('created',false);
            $(this).data('id', Math.floor(Math.random()*100));
            
            alert("create "+JSON.stringify(marshall($(this))))
            
        //@todo ajax create($(this))
        } else if ($(this).data('updated')) {
            $(this).data('updated',false);
            alert("update "+JSON.stringify(marshall($(this))))
        }
        
    });
    
    
}

function marshall(row) {
    var table = row.closest("table");
    var columns = table.data('columns');
    var json = {};
    
    row.find("td").each(function(i) {
        
        var cell  = row.find("td:nth-child("+i+")");
            
        var text = cell.html();
            
        json[columns[i]] = text;
        
    });
    
    json['id'] = row.data('id');
    
    return json;
}

function unmarshall(table, json) {
    
    var columns = table.data('columns');
    
    var row = addRow(table);
    
    row.data('id') = json['id'];
    
    row.find("td").each(function(i) {
        
        var cell  = row.find("td:nth-child("+i+")");
            
        cell.html(json[columns[i]]);
        
    });
    
}


