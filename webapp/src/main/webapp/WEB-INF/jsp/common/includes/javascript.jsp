<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/js/i18next-1.5.9.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui-1.9.2.custom.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ui.timepicker.js"></script>
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/ckeditor/adapters/jquery.js"></script>

<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/ejs.js"></script>

<script src="${pageContext.request.contextPath}/js/underscore.js"></script>
<!--  
		<script src="${pageContext.request.contextPath}/js/constants.js"></script>
		<script src="${pageContext.request.contextPath}/js/rest.js"></script>
		<script src="${pageContext.request.contextPath}/js/uicore.js"></script>
		<script src="${pageContext.request.contextPath}/js/survey-rules.js"></script> 
		<script src="${pageContext.request.contextPath}/js/widgets.js"></script> 
		<script src="${pageContext.request.contextPath}/js/fra2015.js"></script> 
		<script src="${pageContext.request.contextPath}/js/ui.js"></script>
		-->
		<script >
		( function(root, $){
		    
		    
		    var toastHtml = new EJS({
		        url: '${pageContext.request.contextPath}/commons/toast.html',
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
		</script>