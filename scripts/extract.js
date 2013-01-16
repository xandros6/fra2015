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

var survey = $('<survey></survey>');
survey.append( $('<version>0.5</version>') );
survey.append( $('<language>en-US</language>') );
// survey.append( $('<items></items>') );
var parent = survey;



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
			// section.append( $('<items></items>'));
			section.level = node.name;
			section.up = parent;
			
			parent.append( section );
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
			// section.append( $('<items></items>'));
			section.level = node.name;
			section.up = parent;
			
			parent.append( section );
			parent = section;
			
			break;
		case 'TABLE':
			var table = $('<table></table>');
			parent.append( table );
			table.up = parent;
			parent = table;
			break;
		case 'TR':
			var row = $('<tr></tr>');
			parent.append( row );
			row.up = parent;
			parent = row;
			break;
		case 'TD':
			value = '';
			var cell = $('<td></td>');
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
			parent = parent.up || parent;
			break;
		case 'TR':
			parent = parent.up || parent;
			break;
		case 'TD':
			parent.append( value.trim() );
			parent = parent.up || parent;
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