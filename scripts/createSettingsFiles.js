var fs = require('fs');
var sax = require('sax');
var _ = require('underscore');
var bw = require ("buffered-writer");
var cheerio = require('cheerio');

var skip = ['FRA2015', 'textarea', 'table', 'text', 'String', 'Number', 'true'];
var locale = 0;
var keywords = {};
var isVariable = false;
var count = 9000;
var hasVariable = false;

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
			break;
		case 'VARIABLE':
			isVariable = true;
			hasVariable = true;
			break;
		case 'ENTRY':
			hasVariable = false;
			break;
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

				uTemplate.write( '<![CDATA[ <label ref="'+ label +'" /> ]]>'  );					
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
		uTemplate.write(  '<![CDATA[' + $.html() + ' ]]>'  );	
	}

});

saxStream.on("text", function ( text ) {

	var value = clean( text );
	if (value && value.length>0 && !isVariable){
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
			
			
			uTemplate.write( '<![CDATA[ <label ref="'+ label +'" /> ]]>' );			
		} else {
			uTemplate.write( value );
		}
	} else {
		uTemplate.write( value );
	}
});

saxStream.on("closetag", function (name) {
		
		switch( name ){
			case 'SURVEY':
				uTemplate.write( '</' + name + '>');
				localization.write('</locale>');
				uTemplate.close();
				localization.close();
				break;
			case 'VARIABLE':
				uTemplate.write( '</' + name + '>');
				isVariable = false;
				break;
			case 'ENTRY':
				if ( !hasVariable ){
					uTemplate.write( '<variable>' + count++ + '</variable>');
				}
				uTemplate.write( '</' + name + '>');
				break;
			default:
				uTemplate.write( '</' + name + '>');
				break;
		}
});

fs.createReadStream("test.xml")
  .pipe(saxStream);