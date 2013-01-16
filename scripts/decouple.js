var fs = require('fs');
var sax = require('sax');
var _ = require('underscore');
var bw = require("buffered-writer");
var $ = require("jquery");

function print( dom ){
	console.log( $('<div />').append( dom ).html() );	
}

function isNumber(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}

/*
	<label>
		<ref>label</ref>
		<en>What is the area of forest and other wooded land and how has it changed over time</en>
		<value>What is the area of forest and other wooded land and how has it changed over time</value>
	</label>

*/

var locale = $('<locale></locale>');
locale.append( $('<version>PUT VERSION HERE</version>') );
locale.append( $('<language>PUT LANGUAGE CODE HERE</language>') );

var count = 0;
var labels = {};

var saxStream = sax.createStream(false);
saxStream.on("error", function(e) {
	// console.log( e);
	// clear the error
	this._parser.error = null
	this._parser.resume()
});
saxStream.on("opentag", function(node) {

});

saxStream.on("text", function(text) {
	var text = text.trim();
	if ( ! isNumber(text) && ! text == '' && ! labels[ text ] ){
		labels[ text ] = count++;
	}
	
});
saxStream.on("closetag", function(name) {

});
saxStream.on("end", function() {
	var keys = _.keys( labels );
	_.each( keys, function(key){
		var label = $('<label></label>');
		label.append( $('<ref></ref>').append( labels[key]) );
		label.append( $('<en></en>').append( key ) );
		label.append( $('<value></value>').append( 'TRANSLATED TEXT' ) );
		locale.append( label );
	});
	print( locale );
	
	fs = require('fs')
	fs.readFile('example.xml', 'utf8', function (err, content) {
	  if (err) {
	    return console.log(err);
	  }
	  _.each( keys, function(key){
		 var re = new RegExp('>' + key + '<\\/' ,"g");
		 content = content.replace(re, '><label ref="'+ labels[key] +'" /></' );
	  });
		fs.writeFile('template.xml', content, function(err) {
		    if(err) {
		        console.log(err);
		    } else {
		        console.log("The file was saved!");
		    }
		});
	
	});

});
fs.createReadStream("example.xml").pipe(saxStream);
