(function($) {
    
    Core.define('auth', ['loginOk', 'loginKo', 'logoutOk', 'logoutKo'], function(context) {
        var loginUrl = baseUrl + '/rest/auth/login';
        var logoutUrl = baseUrl + '/rest/auth/invalidate';
        var username = null;
        var role = null;
        var token = null;
        var countries = null;
        return {
            login: function( username, password ){
                $(document).find('#progressbar').modal('hide');
                $.ajax({
                    url: loginUrl +'?username='+ username +'&password=' + password,
                    dataType:'json',
                    success: function( data ){
                        var result = data.Token;
                        username = result.user.username;
                        token = result.token;
                        role =  result.user.role;
                        countries = result.user.countries;
                        App.setUser(username, role, token, countries);
                        context.trigger('loginOk', username, role, token, countries);
                    },
                    error: function(response){
                        // $(document).find('#progressbar').modal('show');
                        console.error( response );
                        switch( response.status ){
                            case 500:
                                context.trigger('loginKo', 'Internal server error. ' + response.statusText);
                                break;
                            case 401:
                                context.trigger('loginKo', 'Invalid username or password.');
                                break;
                            default:
                                context.trigger('loginKo', 'Unknown error. ' + response.statusText);
                        }
                        
                    }
                });
            },
            logout: function(){
                $.ajax({
                    url: logoutUrl +'?token='+ token,
                    dataType:'json',
                    success: function( data ){
                        if ( data === true ){
                            context.trigger('logoutOk');
                        } else {
                            console.error('Cannot logout. Unknown reasons.');
                            context.trigger('logoutKo');
                        }
                        
                    },
                    failure: function( data ){
                        console.error('Cannot logout. ' + data);
                        context.trigger('logoutKo');
                    } 
                });               
            }
        };
    });
    
    Core.define('i18n', [], function(context) {
        // load ui translations
        $.i18n.init({
            lng:'en-US',
            resGetPath: 'locales/__lng__/__ns__.json'
        }).done(function(){
            $(document).i18n();
        });
                    
        // load survey translation
        
        $.ajax({
           url:'./locale_en-us.xml',
           cache:false,
           dataType:'xml',
           success: function(data){
               var map = {};
               var locale = $(data);
               locale.find('label')
                     .each(function(index, item){
                         var label = $(this);
                         map[label.attr('ref')] = label.text();
                     });
              /**
               *  global function which translate from <label ref="1"/> to the correct value
               */
              L = function( label ){
                  
                  if ( label.jquery ){
                      return map[ label.attr('ref') ];
                  }
                  
                  var re = /ref="(.*)"/;
                  var id = label.match(re)[1];
                  return map[id];
              };
           },
           error: function(data){
               console.error( data );
           }
             
        });
                    
        return {
            lang: function( newLang ){
                $.i18n.init({
                    lng:newLang
                }).done(function(){
                    $(document).i18n();
                });
            }
        };
    });
    
    Core.define('login-page', ['ready', 'action', 'login', 'lang'], function(context) {
        var el = $('<div></div>');
        var html = new EJS({
            url: './login.html', 
            ext:'.html'
        }).render();
        el.append( html );
        return {
            'page:login': function(){
                // bind events
                el.find('#languageSelector')
                .change( function(){
                    var lang = '';
                    el.find("select option:selected").each(function () {
                        lang += $(this).attr('value');
                    });
                    context.trigger('lang', lang);
                });
                el.find('#loginBtn')
                .click( function(){
                    var username = el.find('#usernameTextField').val();
                    var password = el.find('#passwordTextField').val();
                    el.find('#usernameTextField').val('');
                    el.find('#passwordTextField').val('');
                    context.trigger('login', username, password );
                });
                el.find('#bar').progressbar({
                    value: 0
                });
                // I am ready, notify context
                context.trigger('ready', el);
            },
            error: function( msg ){
                el.find('#errorPanel')
                .append('<div class="alert alert-error">' + msg + '</div>');
            }
        };
    });
    
    Core.define('logout-page', ['ready', 'action'], function(context) {
        var el = $('<div>Logout</div>');
        return {
            'page:logout': function(){
            // context.trigger('ready', el);
            },
            error: function( msg ){
                console.log( msg );
            }
        };       
        
    });
    
    Core.define('contributor-page', ['ready', 'lang', 'logout', 'reload'], function(context) {

       
        return {
            'page:contributor': function(username, role){
                var page = new ContributorPage;
                page.bind('load', function(el){
                    // bind events
                    // LOGOUT
                    el.find('.logout').bind('click', function(){
                        context.trigger('logout');
                    });
                    // CHANGE LANGUAGE
                    el.find('#languageSelector')
                    .change( function(){
                        var lang = '';
                        el.find("select option:selected").each(function () {
                            lang += $(this).attr('value');
                        });
                        context.trigger('lang', lang);
                    }); 
                    // LOGOUT button text value
                    page.el.find('#userField').text(username+' ('+role+')');
                    context.trigger('ready', el); 

                });
                page.bind('change', function(){
                    context.trigger('reload');
                });
                
                page.render();
            },
            error: function( msg ){
                console.log( msg );
            }
        };       
        
    });

    Core.define('admin-page', ['ready', 'lang', 'logout'], function(context) {

        return {
            'page:admin': function(username, role){
                var page = new AdminPage;
                page.bind('load', function(el){
                    // bind events
                    // LOGOUT
                    el.find('.logout').bind('click', function(){
                        context.trigger('logout');
                    });
                    // CHANGE LANGUAGE
                    el.find('#languageSelector')
                    .change( function(){
                        var lang = '';
                        el.find("select option:selected").each(function () {
                            lang += $(this).attr('value');
                        });
                        context.trigger('lang', lang);
                    }); 
                    // LOGOUT button text value
                    page.el.find('#userField').text(username+' ('+role+')');
                    context.trigger('ready', el); 
                });
                
                page.bind('change', function(){
                    context.trigger('reload');
                });
                
                page.render();
            },
            error: function( msg ){
                console.log( msg );
            }
        };       
        
    });
    
    Core.define('reviewer-page', ['ready','lang', 'logout'], function(context) {

        return {
            'page:reviewer': function(username, role){
                var page = new ReviewerPage;
                page.bind('load', function(el){
                    // bind events
                    // LOGOUT
                    el.find('.logout').bind('click', function(){
                        context.trigger('logout');
                    });
                    // CHANGE LANGUAGE
                    el.find('#languageSelector')
                    .change( function(){
                        var lang = '';
                        el.find("select option:selected").each(function () {
                            lang += $(this).attr('value');
                        });
                        context.trigger('lang', lang);
                    }); 
                    // LOGOUT button text value
                    page.el.find('#userField').text(username+' ('+role+')');
                    context.trigger('ready', el); 
                });
                
                page.bind('change', function(){
                    context.trigger('reload');
                });
                
                page.render();
            },
            error: function( msg ){
                console.log( msg );
            }
        };       
        
    });

    Core.define('router', 
        ['error', 'page:login', 'page:logout', 'page:contributor', 'page:admin', 'page:reviewer'], 
        function(context) {
            var el = $('#main');
            var token = null;
            function setPage( page ){
                el.empty();
                el.append( page ); 
                el.i18n();
                
            };
        
            return {
                loginOk: function( username, role, token ){
                    console.log('authenticated ' + username + ' with role ' + role);
                    token = token;
                    context.trigger('page:'+role, username, role);
                },
                loginKo: function( msg ){
                    context.trigger('error', msg);
                },
                logoutOk: function(){
                    token = null;
                    context.trigger('page:login')
                },
                logoutKo: function(){
                    context.trigger('error', 'Cannot logout.');
                },
                ready: function( page ){
                    setPage( page );
                },
                reload: function(){
                    
                
                    jQuery('textarea.texteditor').each( function() {                       
                        var id = $(this).attr('id');    
                        var instance = CKEDITOR.instances[ id ];
                        if (instance){
                            CKEDITOR.remove( instance );
                            $('#cke_' + id).remove();
                        }               
                        CKEDITOR.replace( id, { 
                            toolbar: 'MyToolbar'
                        } );
                        
                    });
                    
                    
                    /*for (var i in CKEDITOR.instances) {
                        CKEDITOR.instances[i].on('change', function() {
                            alert('test 1 2 3')
                        });
                    }*/
                },
                action: function( ){
                    var params = Array.prototype.slice.call(arguments);
                    context.trigger.apply(this, params);
                },
                init: function(){
                    context.trigger('page:login');
                }
            };
        
        
        });
    
    Core.split('page', 'router', ['login-page', 'logout-page', 'contributor-page', 'admin-page', 'reviewer-page']);
    Core.compose('control', 'auth', 'i18n');
    Core.compose('app', 'control', 'page');

    
    
}).call(this, jQuery);