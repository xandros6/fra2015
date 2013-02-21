var fs = require('fs');
var sax = require('sax');
var _ = require('underscore');
var bw = require ("buffered-writer");
var $ = require('jquery');

var tag = null;
var type = null;
var content = null;
var myvar = 0;

var db = 
	bw.open ("populateDb.xml")
    .on ("error", function (error){
        console.log (error);
    });



fs.readFile('template.xml', 'utf8', function (err,data) {
  if (err) {
    return console.log(err);
  }

  db.write('<entries>')

  var template = $(data);
  template.find('entry').each( function(index, entry){
	var e = $(entry);
	
	// e.g. textarea, table, text
	var type = e.find('> type').text(); 
	var variable = e.find('> variable').text(); ;

	switch( type ){
		case 'textarea':
			db.write( '<entry>');
			db.write( '<type>' + type + '</type>'); 
			if ( variable ){
				db.write( '<variable>' + variable + '</variable>');
			} else {
				db.write( '<variable>' + myvar++ + '</variable>');
			}
			
			
			db.write( '</entry>');
			break;
		case 'table':
			db.write( '<entry>');
			db.write( '<type>' + type + '</type>'); 
			if ( variable ){
				db.write( '<variable>' + variable + '</variable>');
			} else {
				db.write( '<variable>' + myvar ++ + '</variable>');
			}
			
			db.write('<EntryItems>');
			
				var template = e.find('> template'); //.replace("<![CDATA[", "").replace("]]>", "");
				
				template.find('td')
				 .each( function(index, elem){
					var cell = $(elem);
					
					if ( cell.hasClass('entry-item') || cell.hasClass('prefilled')){
						


			
						db.write('<entryItem>');

						var rowName = cell.parent().attr('rowName');
						var colName = cell.attr('columnName');

						if ( rowName ){
							db.write('<rowName>'+ rowName +'</rowName>');
						}
						if ( colName ){
							db.write('<columnName>'+ colName +'</columnName>');
						}

						db.write('<rowNumber>'+ cell.attr('rowNumber') +'</rowNumber>');
						db.write('<columnNumber>'+ cell.attr('columnNumber') +'</columnNumber>');	
						
									var type = null;
									if ( cell.hasClass('text') ){
										type = 'String';
									} else if ( cell.hasClass('number') ){
										type = 'Number';
									} else if ( cell.hasClass('boolean')){
										type = 'Boolean';
									} else {
										type = 'String';
									}

									if ( type ){
										db.write('<type>' + type + '</type>');
									}
						
						
						
						db.write('</entryItem>');						
					}
					

				 });
			db.write('</EntryItems>');
			db.write( '</entry>');
	}
	
	
	
  });

  db.write('</entries>')
  db.close();
});

