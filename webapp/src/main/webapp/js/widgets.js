/* 
 * This file contains common ui widgets used in FRA2012
 */

( function(root, $){
    root.Widgets = {
  
        createToast: function( container ){
        
            var el = $('<div></div>');
            var html = new EJS({
                url: './commons/toast.html',
                ext:'.html'
            }).render();
            el.append( html );
        
            var toast = el.find('#toast');
        
            return {
            
                open: function( msg ){
                    
                    container.append( el );
                    
                    toast.find('#content').empty().append(msg);
                    toast.modal({ 
                        "show": true                     
                    });
                    // set timeout for closing
                    setTimeout(function(){
                        toast.modal('hide');
                    }, 3000);
                }
            };
        }

    };
    
})(this, jQuery);



