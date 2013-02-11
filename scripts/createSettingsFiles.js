var fs = require('fs');
var sax = require('sax');
var _ = require('underscore');
var bw = require ("buffered-writer");
var cheerio = require('cheerio');

var skip = ['FRA2015', 'textarea', 'table', 'text', 'String', 'Number', 'true'];
var locale = 0;
var keywords = {};

/*
 * clean a word from extra chars
 */
function clean( w ){
	return w.replace(/[^\d\w\s,().\?\/\\n\\t{}<>=\"\":%-]/gi, '') // remove special chars
			.replace(/\s+/g, " ")  // remove extra spaces
			.trim(); // remove trailing chars
};

var uTemplate = 
	bw.open ("template.xml")
    .on ("error", function (error){
        console.log (error);
    });

var localization = 
		bw.open ("localization.xml")
	    .on ("error", function (error){
	        console.log (error);
	});

var saxStream = sax.createStream(false);
saxStream.on("error", function (e) {
  // console.log( e);
  // clear the error
  this._parser.error = null
  this._parser.resume()
});

saxStream.on("opentag", function (node) {
	uTemplate.write( '<' + node.name + '>');
	switch( node.name ){
		case 'SURVEY':
			localization.write('<locale>')
						.write('<language>EN-us</language>')
						.write('<version>0.1</version>');
		default:
			break;
	}
});

saxStream.on("cdata", function ( text ) {
	
	// load html
    $ = cheerio.load( text );

	if ( $('td').length === 0 ){ // not table
		var value = clean( text);
		if (value && value.length>0 ){
			if ( _.indexOf(skip, value) === -1 ){ // value not in reserved words
				var label;
				if ( keywords[value] ){ // already present
					label = keywords[ value ];
				} else { // new keyword
					label = locale++;
					keywords[ value ] = label;

					localization.write( '<label ref="' + label + '">')
								.write( '<value>'+ value +'</value>')
								.write( '</label>');
				}

				uTemplate.write( '<label ref="'+ label +'" />'  );					
			}
		}		
	} else {
		$('td').each( function(index, element){
			var cell = $(element);
			var value = clean( cell.text() );
			if (value && value.length>0 ){
				if ( _.indexOf(skip, value) === -1 ){ // value not in reserved words
					var label;
					if ( keywords[value] ){ // already present
						label = keywords[ value ];
					} else { // new keyword
						label = locale++;
						keywords[ value ] = label;

						localization.write( '<label ref="' + label + '">')
									.write( '<value>'+ value +'</value>')
									.write( '</label>');
					}

					cell.empty().append( '<label ref="'+ label +'" />' );					
				}
			}		
		});	
		uTemplate.write( $.html() );	
	}

});

saxStream.on("text", function ( text ) {
	var value = clean( text );
	if (value && value.length>0 ){
		if ( _.indexOf(skip, value) === -1){
			var label;
			if ( keywords[value] ){ // already present
				label = keywords[ value ];
			} else { // new keyword
				label = locale++;
				keywords[ value ] = label;
				localization.write( '<label ref="' + label + '">')
							.write( '<value>'+ value +'</value>')
							.write( '</label>');
			}
			
			
			uTemplate.write( '<label ref="'+ label +'" />' );			
		} else {
			uTemplate.write( value );
		}
	}
});

saxStream.on("closetag", function (name) {
		uTemplate.write( '</' + name + '>');
		switch( name ){
			case 'SURVEY':
				localization.write('</locale>');
				uTemplate.close();
				localization.close();
			default:
				break;
		}
});

fs.createReadStream("test.xml")
  .pipe(saxStream);