var fs = require('fs');
var sax = require('sax');
var _ = require('underscore');
var bw = require ("buffered-writer");
var $ = require("jquery");

var value = null;
var section = null;
var count = 0;

function print( dom ){
	console.log( $('<div />').append( dom ).html() );	
}

var survey = $('<Survey></Survey>');
survey.append( $('<name>FRA2015</name>') );

var elements = $('<elements></elements>');
survey.append( elements );

var parent =  elements;
var rowNum, celNum;


var saxStream = sax.createStream(false);
saxStream.on("error", function (e) {
  // console.log( e);
  // clear the error
  this._parser.error = null
  this._parser.resume()
});
saxStream.on("opentag", function (node) {
	
	// console.log( node );
	switch( node.name ){
		case 'H3':
			while ( parent.level == 'H3' ){
				parent = parent.up;
			}
			
			value = '';
			section = $('<section></section>');
			var elements = $('<elements></elements>');
			section.append(elements);
			parent.append( section );
			
			section.level = node.name;
			section.up = parent;
			section.elements = elements;
			
			parent = section;
			
			break;
		case 'H2':
			while ( parent.level == 'H2' || parent.level == 'H3'){
				parent = parent.up;
			}
			
			value = '';
			section = $('<section></section>');
			// section.append( $('<items></items>'));
			section.level = node.name;
			section.up = parent;
			
			parent.append( section );
			parent = section;
			
			break;
			
		case 'H1':
			while ( parent.level == 'H1' || parent.level == 'H2' || parent.level == 'H3'){
				parent = parent.up;
			}
			
			value = '';
			section = $('<section></section>');
			parent.append( section );
			
			section.level = node.name;
			section.up = parent;
			parent = section;
			
			break;
		case 'TABLE':
			rowNum = 0;
			var entry = $('<entry></entry>');
			entry.append('<type>table</type>');
			parent.append( entry );
			var table = $('<table></table>');
			entry.up = parent;
			table.up = entry;
			parent = table;
			break;
		case 'TR':
			var row = $('<tr></tr>');
			parent.append(row);
			row.up = parent;
			parent = row;
			celNum = 0;
			break;
		case 'TD':
			value = '';
			var cell = $('<td></td>');
			if ( node.attributes.COLSPAN ){
				cell.attr('colspan', node.attributes.COLSPAN);
			}
			if ( node.attributes.ROWSPAN ){
				cell.attr('colspan', node.attributes.ROWSPAN);
			}
			parent.append( cell );
			cell.up = parent;
			parent = cell;
			break;
		default:
			break;
	}
});
saxStream.on("text", function ( text ) {
		value += ' ' + text.replace(/&nbsp/g, '').replace(/\n/g, '').replace(/\r/g, '').replace(/;/g, '').replace(/[^\w\s]/gi, '');
});
saxStream.on("closetag", function (name) {
	// console.log(name);
	switch( name ){
		case 'H1':
		case 'H2':
		case 'H3':
			parent.append( $('<title></title>').append( value.trim() ) );
			break;
		case 'TABLE':
		    var table = parent;
			parent = parent.up || parent;
			var text = '<!-- <![CDATA[ ' +  $('<div></div>').append(table).html() +' ]]> -->';
			var template = $('<template></template>');
			template.html( text );
			parent.append(template)
			parent = parent.up || parent;
			break;
		case 'TR':
			parent = parent.up || parent;
			rowNum++;
			break;
		case 'TD':
		    parent.append( value.trim() );
			parent.attr('rowNumber', rowNum);
			parent.attr('columnNumber', celNum);
			parent = parent.up || parent;
			celNum++;
			break;
		default:
			break;
	}
});
saxStream.on("end", function () {
   print( survey );
});
fs.createReadStream("original3.html")
  .pipe(saxStream);