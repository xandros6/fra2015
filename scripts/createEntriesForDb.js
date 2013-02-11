var fs = require('fs');
var sax = require('sax');
var _ = require('underscore');
var bw = require ("buffered-writer");
var $ = require('jquery');

var tag = null;
var type = null;
var content = null;

var db = 
	bw.open ("populateDb.xml")
    .on ("error", function (error){
        console.log (error);
    });



fs.readFile('universalTemplate.xml', 'utf8', function (err,data) {
  if (err) {
    return console.log(err);
  }

  db.write('<entries>')

  var template = $(data);
  template.find('entry').each( function(index, entry){
	var e = $(entry);
	
	// e.g. textarea, table, text
	var type = e.find('> type').text(); 
	var id = null;

	switch( type ){
		case 'textarea':
			db.write( '<entry>');
			db.write( '<type>' + type + '</type>'); 
			db.write( '<id>' + id + '</id>');
			
			db.write( '</entry>');
			break;
		case 'table':
			db.write( '<entry>');
			db.write( '<type>' + type + '</type>'); 
			db.write( '<id>' + id + '</id>');
			db.write('<EntryItems>');
				e.find('> template')
				 .find('td.entry-item')
				 .each( function(index, elem){
					var cell = $(elem);
					var type = null;

					if ( cell.hasClass('text') ){
						type = 'String';
					} else if ( cell.hasClass('number') ){
						type = 'Number';
					} else if ( cell.hasClass('boolean')){
						type = 'Boolean';
					}

					db.write('<entryItem>');
					db.write('<id></id>')
					db.write('<rowNumber>'+ cell.attr('rowNumber') +'</rowNumber>');
					db.write('<columnNumber>'+ cell.attr('columnNumber') +'</columnNumber>');	
					db.write('<type>' + type + '</type>');
					db.write('</entryItem>');
				 });
			db.write('</EntryItems>');
			db.write( '</entry>');
	}
	
	
	
  });

  db.write('</entries>')
  db.close();
});

