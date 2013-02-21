/* 
 * This file contains common ui widgets used in FRA2012
 */

( function(root, $){
    
    
    var toastHtml = new EJS({
        url: './commons/toast.html',
        ext:'.html'
    }).render();
    
    var el = $('<div></div>');
    el.append( toastHtml );
    
        
    var toast = el.find('#toast');
            
    var timeoutID;
    var hide = function(){
        window.clearTimeout( timeoutID );
        toast.modal('hide'); 
    };
            
    function display(){
        toast.modal({ 
            "show": true                     
        });
        // set timeout for closing
        timeoutID = setTimeout(hide, 3000);
    };
    
    root.Widgets = {
  
        createToast: function( container ){
        
            container.append( el );

        
            return {
            
                open: function( msg ){
                    toast.find('#content').empty().append(msg);
                    display();
                },
                
                error: function( msg ){
                    toast.find('#content').empty()
                    .append( $('<div class="alert alert-error"></div>').append(msg) );
                    display();     
                }
            };
        }

    };
    
})(this, jQuery);



