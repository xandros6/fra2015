/* 
 * This file contains methods to validate a survey against a set of rules
 *
 */

(function(root, $){
    root.Validator = {
      
        /*
         * create a validator for the given survey
         */
        create: function(survey){
  
            // TOFIX define a context for the eval
            LAND_AREA = 10;
            COUNTRY_AREA = 100;
  
            // load rules from server
            var loadRules = function( callback){
                
                $.ajax({
                    url:baseUrl+'/validation-rules.xml',
                    dataType:'xml',
                    cache:false,
                    success: function( data ){
                        var rules = [];
                        var xml = $(data);
                        xml.find('rule').each(function(index, rule){
                            var entryId = $(rule).find('> entryId').text();
                            var result = {};
                            result.error = $(rule).find('> error').text();
                            result.check = function(){
                                var colNames = ['1990', '2000', '2005', '2010', '2015'];
                                var re = /{{([^}])*}}/g;
                                var condition = $(rule).find('> condition').text().replace("<![CDATA[", "").replace("]]>", "");;
                                var rowNames = condition.match( re );
                                if(rowNames) {
                                    $.each( colNames, function(index, colName){
                                        $.each( rowNames, function(index, rowName){
                                            condition = condition.replace(  rowName , survey.get( entryId, colName, rowName));
                                        })
                               
                                    });
                                } 
                                // console.log( condition );
                                return eval( condition );
                        
                            };
                            rules.push( result );
                        });
                        callback(null, rules);
                    },
                    error: function( data ){
                        //console.error(data);
                        callback(data);
                    }
                });                
            };
            

  
            return {
     
                /*
                 * validate the whole survey
                 */
                validate: function( callback ){
                    loadRules( function( err, rules ){
                        if (err){
                            return console.error('Cannot load rules: ' + err);
                        }
                        var errors = [];
                        $.each( rules, function(index, rule){
                            if ( ! rule.check() ){
                                errors.push( rule.error );
                            }
                        });
                        callback( errors );  
                        return true;
                    });
                    
                }
            };
           
        }
      
    };  
})(this, jQuery);



