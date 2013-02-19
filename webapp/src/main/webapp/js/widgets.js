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
            container.append( el );
        
            var toast = el.find('#toast');
            
            function display(){
                toast.modal({ 
                    "show": true                     
                });
                // set timeout for closing
                setTimeout(function(){
                    toast.modal('hide');
                }, 3000);
            };
        
            return {
            
                open: function( msg ){
                    toast.find('#content').empty().append(msg);
                    display();
                },
                
                error: function( msg ){
                    toast.find('#content').empty()
                         .append( $('<div class="alert alert-error"></div>').append(msg));
                         
                }
            };
        }

    };
    
})(this, jQuery);



