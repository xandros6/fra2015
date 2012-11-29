
(function($) {
    
    // fake data for login
    var users = {
        'contributor':'contributor',
        'admin':'admin',
        'reviewer':'reviewer'
    };
    
    var User = Class.create({
        
        initialize: function(){
            this.username = null;
            this.token = null;
        },
        
        isGuest: function(){
            return (this.token === null);
        },
        
        login: function(username, password){
            if ( users[ username ] === password ){
                this.username = username;
                this.password = password;
                this.token = 'FAKE TOKEN';
                return true;
            }
            return false;
        },
        
        logout: function(){
            this.token = null;
        }
    });
    
    
    this.Application = Class.create({
        
        listeners: [],
        
        initialize: function(){
            this.user = new User;
        },
        
        addListener: function( listener ){
            this.listeners.push( listener );
        },
        
        notify: function( event ){
            for (var i=0; i<this.listeners.length; i++){
                this.listeners[i].trigger( event );
            }
        }
       
        
    });
    
    var View = Class.create({
        initialize:function(){
            this.el = $('<div></div>');
        },
        render: function(){
            // do nothing  
            return this;
        }
    });


    var Page = Class.create(View, {
        render:function( $super ){
            $super();
            this.el.find('.logout').bind('click', function(){
                App.notify('logout'); 
            });
        }
    
    });    
    
    var Template = Class.create(View, {
        
        initialize: function($super, options){
            $super();
            this.url = options.url;
            this.events = {
                'load': []  
            };
        },
        render:function( $super ){
            $super();
            var html = new EJS({
                url: this.url, 
                ext:'.html'
            }).render();
            this.el.empty();
            this.el.append( html );
            this.trigger( 'load' );
            return this;
        },
        // TODO refactor in View
        trigger: function( event ){
            var handlers = this.events[event];
            for (var i=0; i<handlers.length; i++){
                var handler = handlers[i];
                handler.call( this, this.el );
            }
        },
        bind: function(event, handler){
            this.events[event].push( handler );
        }
    
    });    
    
    
    var Controller = Class.create({
        initialize:function( routing ){
            this.routing = routing;
        },
        start: function(){
            var startPage = this.routing['default'];
            startPage.call( this );
        },
        trigger: function(event){
            var page = this.routing[event];
            page.call( this );
        }
    });
    
    this.View = View;
    this.Controller = Controller;
    
    this.Page = Page;
    
    this.LoginPage = Class.create(Page, {
        render: function(){
            var html = new EJS({
                url: './login.html', 
                ext:'.html'
            }).render();
            this.el.append( html );
        },
        getLoginButton: function(){
            return this.el.find('#loginBtn');
        },
        getUsername: function(){
            return this.el.find('#usernameTextField').val();
        },
        getPassword: function(){
            return this.el.find('#passwordTextField').val();
        },
        displayError: function(msg){
            this.el.find('#errorPanel')
            .append('<div class="alert alert-error">' + msg + '</div>');
        }
                                
    });
    
    var TabPage = Class.create(Page, {
        
        initialize:function( $super, options ){
            $super();
            this.container = options.container;
            this.tabs = options.tabs;
        },
        render: function($super){
            var self = this;
            var selectionHandler = function( index ){
                return function(){
                    return self.select( index );
                };
            };
            this.el.append( this.container.render().el );
            
            var tabs = this.el.find('.tab');
            for (var i=0; i<tabs.length; i++){
                var tab = tabs[i];
                this.el.find(tab).bind('click', selectionHandler( i ));
            }
            $super();
        },
        select: function( index ){
            // deselect previous selected tab
            this.el.find('.active').attr('class', '');
            // get selected tab
            var tab = this.el.find('.tab')[ index ];
            this.el.find(tab).parent().attr('class', 'active');
            // display tab
            this.el.find('#tabContent').empty();
            this.el.find('#tabContent').append( this.tabs[ index ].render().el );
        }
    });
    
    var Templates = {
        
        /* contributor templates */
        
        'contributor/index': function(){
            return new Template({
                url: './contributor/index.html'
            });
        },
        'contributor/survey': function(){
            return new Template({
                url: './contributor/survey.html'
            });
        },
        'contributor/check': function(){
            return new Template({
                url: './contributor/check-and-submit.html'
            });
        },
        'contributor/summary': function(){
            return new Template({
                url: './contributor/summary.html'
            });
        },
        'contributor/export': function(){
            return new Template({
                url: './contributor/export.html'
            });
        },
        
        /* admin templates  */
        
        'admin/index': function(){
            return new Template({
                url: './admin/index.html'
            });
        },
        'admin/activity-log': function(){
            var t = new Template({
                url: './admin/activity-log.html' 
            });
            t.bind('load', function( el ){
                el.find( "#startDate" ).datepicker();
                el.find( "#endDate" ).datepicker();
            });
            return t;
        },
        'admin/create-users': function(){
            var t = new Template({
                url: './admin/create-users.html'
            });
            t.bind('load', function( el ){
                el.find( "#createBtn" ).click(function(){
                    el.find('#createUserWindow').modal('show');
                });
            });
            return t;
        },
        'admin/export': function(){
            return new Template({
                url: './admin/export.html'
            });
            
        },       
        
        /* reviewer templates */
        
        'reviewer/index': function(){
            return new Template({
                url: './reviewer/index.html'
            });
        },
        'reviewer/activity-log': function(){
            // TODO use template variables
            var t = new Template({
                url: './admin/activity-log.html' 
            });
            t.bind('load', function( el ){
                el.find( "#startDate" ).datepicker();
                el.find( "#endDate" ).datepicker();
            });
            return t;
        },
        'reviewer/surveys': function(){
            // TODO use template vars
            return new Template({
                url: './reviewer/surveys.html'
            });
        },
        'reviewer/export': function(){
            // TODO use template variables
            return new Template({
                url: './admin/export.html'
            });
        },  
        
        build: function(name){
            return this[name].call(this);
        }
    };
 
    this.ContributorPage = Class.create(TabPage, {
        initialize:function( $super ){
            $super( {
                container: Templates.build('contributor/index'),
                tabs:[
                Templates.build('contributor/survey'),
                Templates.build('contributor/check'),
                Templates.build('contributor/summary'),
                Templates.build('contributor/export')       
                ]
            });
        },
        render: function($super){
            $super();
            this.select(0);
        }
    });
    
    
    this.AdminPage = Class.create(TabPage, {
        initialize:function( $super ){
            $super( {
                container: Templates.build('admin/index'),
                tabs:[
                Templates.build('admin/activity-log'),
                Templates.build('admin/create-users'),
                Templates.build('admin/export')       
                ]
            });
        },
        render: function($super){
            $super();
            this.select(0);
            
        } 
    });
    
    this.ReviewerPage = Class.create(TabPage, {
        initialize:function( $super ){
            $super( {
                container: Templates.build('reviewer/index'),
                tabs:[
                Templates.build('reviewer/surveys'),
                Templates.build('reviewer/activity-log'),
                Templates.build('reviewer/export')       
                ]
            });
        },
        render: function($super){
            $super();
            this.select(0);
        } 
    });
    
    this.ErrorPage = Class.create(Page, {
        
        render: function(){
            
            this.el.append( 'error' );
        }
    });
    
}).call(this, jQuery);


// create a global var to store app specific properties
App = new Application;
