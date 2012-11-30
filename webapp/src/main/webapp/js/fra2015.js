
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
            this.events = {
                'load': []  
            };
        },
        render: function(){
            // do nothing  
            return this;
        },
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
            this.container.bind('load', function(elem){
                self.el.append( elem );
                var tabs = self.el.find('.tab');
                for (var i=0; i<tabs.length; i++){
                    var tab = tabs[i];
                    self.el.find(tab).bind('click', selectionHandler( i ));
                }
            });
            this.container.render()
            $super();
            return this;
        },
        select: function( index ){
            // deselect previous selected tab
            this.el.find('.active').attr('class', '');
            // get selected tab
            var tab = this.el.find('.tab')[ index ];
            this.el.find(tab).parent().attr('class', 'active');
            // display tab
            this.el.find('#tabContent').empty();
            var self = this;
            this.tabs[ index ].bind('load', function(elem){
                self.el.find('#tabContent').append( elem );
                self.trigger('load');
            });
            this.tabs[ index ].render();
            
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
    
    var TextArea = Class.create(View, {
        initialize:function( $super, options ){
            $super();
            this.id =  Math.random().toString(36).substring(7);
            var text = $('<textarea></textarea>');
            text.attr('class', 'texteditor');
            text.attr('cols', '80');
            text.attr('rows', '10');
            text.attr('id', this.id);
            text.attr('name', this.id);
            // text.ckeditor();
            this.el.append('<h4>' + options.title + '</h4>');
            if ( options.description ){
                this.el.append( '<p>' + options.description + '</p>');
            }
            var saveBtn = $('<a>Save</a>');
            saveBtn.attr('href', '#');
            saveBtn.attr('class', 'btn btn-mini btn-primary');
            saveBtn.click(function(evt){
                alert('Saved!');
                return false;
            });
              
            var control = $('<p></p>');
            control.attr('class', 'pull-right');  
            control.append( saveBtn );     
            this.el.append( control );
            this.el.append('<br/><br/>');
            this.el.append(text);
        },
        render: function($super){
            $super();
            // CKEDITOR.replace( this.id );
            this.trigger('load');
            return this;
        }
    });
    
    var Table = Class.create(View, {
        initialize:function( $super, options ){
            $super();
            
            this.el.append('<h4>' + options.title + '</h4>');
            if ( options.description ){
                this.el.append( '<p>' + options.description + '</p>');
            }  
            
            
            var table = $('<table></table>');
            table.attr('class', 'table table-bordered table-hover table-condensed');
            
            if ( options.rows && options.rows.length>0){
                var head = $('<thead></thead>').append('<tr></tr>'); //!
                head.append('<th></th>'); // empty cell above row column
                head.append( $.map(options.columns, function( column ){
                    return $('<th></th>').append(column);
                }));
                table.append( head );
                var tbody = $('<tbody></tbody>');
                table.append( tbody );
                
                for ( var i=0; i<options.rows.length; i++){
                    var row = $('<tr></tr>');
                    row.append( '<td>'+ options.rows[i] + '</td>' );
                    row.append( $.map(options.columns, function( column ){
                        var cell = $('<td></td>')
                        cell.addClass('editable');
                        cell.click(function(){
                            if ( cell.hasClass('editable') ){
                                cell.removeClass("editable");
                                cell.addClass("editing");
                                var text = cell.html();
                                cell.html('<input class="celleditor" type="text" value="'+text+'"/>');
                                cell.find('.celleditor').blur( function(){
                                    if ( cell.hasClass('editing') ){
                                        cell.removeClass("editing");
                                        cell.addClass("editable");
                                        var text = cell.find(".celleditor").attr('value');
                                        cell.html( text );
                                    }
                                    return false;  
                                });
                                cell.find('.celleditor').focus();
                            }
                            return false;
                        });
                        cell.append('&nbsp;');
                        return cell;
                    }) );
                    tbody.append( row );
                }
                
                var saveBtn = $('<a>Save</a>');
                saveBtn.attr('href', '#');
                saveBtn.attr('class', 'btn btn-mini btn-primary');
                saveBtn.click(function(evt){
                    alert('Saved!');
                    return false;
                });
              
                var control = $('<p></p>');
                control.attr('class', 'pull-right');
                
                control.append( saveBtn );
                
                this.el.append( control );
                
            } else {
                
                // TODO refactor, clean code
                
                var head = $('<thead></thead>');
                var headRow = $('<tr></tr>');
                head.append( headRow );
                headRow.append( $.map(options.columns, function( column ){
                    return $('<th></th>').append(column);
                }));
                table.append( head );
                // create an empty row
                var tbody = $('<tbody></tbody>');
                var row = $('<tr></tr>');
                tbody.append( row );
                // TODO refactor
                row.append( $.map(options.columns, function( column ){
                    
                    var cell = $('<td></td>')
                    cell.addClass('editable');
                    cell.click(function(){
                        if ( cell.hasClass('editable') ){
                            cell.removeClass("editable");
                            cell.addClass("editing");
                            var text = cell.html();
                            cell.html('<input class="celleditor" type="text" value="'+text+'"/>');
                            cell.find('.celleditor').blur( function(){
                                if ( cell.hasClass('editing') ){
                                    cell.removeClass("editing");
                                    cell.addClass("editable");
                                    var text = cell.find(".celleditor").attr('value');
                                    cell.html( text );
                                }
                                return false;  
                            });
                            cell.find('.celleditor').focus();
                        }
                        return false;
                    });
                    cell.append('&nbsp;');
                    return cell;
                }));
                table.append( tbody );
                
                // button to add new row to table
                var addBtn = $('<a>Add row</a>');
                addBtn.attr('href', '#');
                addBtn.attr('class', 'btn btn-mini');
                addBtn.click(function(evt){
                    var row = $('<tr></tr>');
                    tbody.append( row );
                    row.append( $.map(options.columns, function( column ){
                        var cell = $('<td></td>')
                        cell.addClass('editable');
                        cell.click(function(){
                            if ( cell.hasClass('editable') ){
                                cell.removeClass("editable");
                                cell.addClass("editing");
                                var text = cell.html();
                                cell.html('<input class="celleditor" type="text" value="'+text+'"/>');
                                cell.find('.celleditor').blur( function(){
                                    if ( cell.hasClass('editing') ){
                                        cell.removeClass("editing");
                                        cell.addClass("editable");
                                        var text = cell.find(".celleditor").attr('value');
                                        cell.html( text );
                                    }
                                    return false;  
                                });
                                cell.find('.celleditor').focus();
                            }
                            return false;
                        });
                        cell.append('&nbsp;');
                        return cell;
                    }));
                    return false;
                });
                
                var saveBtn = $('<a>Save</a>');
                saveBtn.attr('href', '#');
                saveBtn.attr('class', 'btn btn-mini btn-primary');
                saveBtn.click(function(evt){
                    alert('Saved!');
                    return false;
                });
              
                var control = $('<p></p>');
                control.attr('class', 'pull-right');
                
                control.append( saveBtn );
                control.append( addBtn );
                
                this.el.append( control );
            }
            
                      
            this.el.append(table);
            
        },
        render: function($super){
            $super();
            this.trigger('load');
            return this;
        }   
    });
    
    var Section = Class.create(View, {
        initialize:function( $super, options ){
            $super();
            this.options = options;
            this.el = $('<section></section>');
            this.el.attr('id', options.title.replace(/\s/g, "-").toLowerCase());
        },
        render: function($super, depth, num){
            $super();
          
            this.el.append( this.createTitle(num + ' ' + this.options.title, depth) );
            if ( this.options.description ){
                this.el.append( this.createDescription(this.options.description, depth));
            }
            
            var count = 0, length = this.options.items.length;
            var el = this.el, section=this;
            if ( this.options.items.length === 0 ){
                section.trigger('load');
            } else {
                $.each( this.options.items, function (index, item){
                    item.bind('load', function(elem){
                        el.append( elem );
                        count++;
                        if (count >= length){
                            section.trigger('load');
                        }
                    });               
                    item.render( depth + 1, num + '.' + (index+1))           
                });          
            }
            
            return this;
        },
        createTitle: function( title, depth ){
            var html;
            switch (depth){
                case 1:
                    html = $('<div class="page-header"><h1>'+ title +'</h1></div>');
                    break;
                case 2:
                    html = $('<h2>'+ title +'</h2>');
                    break;
                case 3:
                    html = $('<h3>'+ title + '</h3>');
                    break;
                case 4:
                    html = $('<h4>'+title+'</h4>');
                    break;
                default:
                    html = $('<h4>'+title+'</h4>');
            }
            return html;
        },
        createDescription: function(description, depth){
            var html;
            switch (depth){
                case 1:
                    html = $('<p></p>');
                    html.attr('class', 'lead');
                    break;
                default:
                    html = $('<p></p>');
            }
            html.append( description );
            return html;          
        }
    });
 
    var Survey = Class.create(View, {
        initialize:function( $super ){
            $super();            
        },
        render: function($super){
            $super(); 
  
            var survey = this;
            
            // TODO avoid to call ajax more than once
            $.ajax({
                type:'GET',
                dataType:'text',
                url:'./resources/survey.json',
                success: function(data){
                    var obj;
                    try{
                        obj = $.parseJSON( data ); 
                    } catch (e){
                        throw 'cannot parse ./resources/survey.json: ' + e;
                    }
                    if (!obj.items ){
                        throw 'parsing error: survey has no property "items".';
                    }
                    var count = 0, length = obj.items.length;
                    survey.build( obj, survey );  
                    survey.el.attr('class', 'container');
                    survey.el.empty();
                    
                    // TODO refactor: externalize this rubbish!
                    var row = $('<div></div>');
                    row.attr('class', 'row');
                    
                    var left =  $('<div></div>');
                    left.attr('class', 'span4 bs-docs-sidebar');
                    var ul = $('<ul></ul>');
                    ul.attr('class', 'nav nav-list bs-docs-sidenav');
                    left.append(ul);
                    
                    var right =  $('<div></div>');
                    right.attr('class', 'span8');
                    
                    row.append(left);
                    row.append(right);
                    survey.el.append( row );
                    
                    $.each( survey.items, function (index, item){
                        item.bind('load', function( elem ){
                            right.append( elem );
                            
                            var li = $('<li></li>');
                            ul.append( li );
                            li.append('<a href="#'+ item.options.title.replace(/\s/g, "-").toLowerCase() +'"><i class="icon-chevron-right"></i>'+ item.options.title +'</a>')
                            
                            count++;
                            if (count >= length){
                                survey.trigger('load');
                            }
                        });
                        item.render(1, index+1);
                    });
                        
                    
                }
            });
            
        },
        build: function( obj, survey ){
            
            var view = null;
            
            if ( !obj.type ){
                throw "parsing error: wrong format.";
            }
            
            switch ( obj.type ){
                case 'survey':
                    if (!obj.items ){
                        throw 'parsing error: survey has no property "items".';
                    }
                    survey.items = $.map( obj.items, function(item){
                        return survey.build( item, survey );
                    });
                    view = survey;
                case 'textarea':
                    view = new TextArea({
                        title: obj.title,
                        description: obj.description
                    });
                    break;
                case 'table':
                    view = new Table({
                        title: obj.title,
                        description: obj.description,
                        columns: obj.columns,
                        rows: obj.rows
                    });
                    break;
                case 'section':
                    if (!obj.items){
                        throw 'parsing error: section ' + obj.title + ' has no property "items".';
                    }
                    var items = $.map( obj.items, function(item){
                        return survey.build( item, survey );
                    });
                    view = new Section({
                        title: obj.title,
                        description: obj.description,
                        items: items
                    });
                    break;
                default:
                    throw "parsing error: " + obj.type + " is not a valid type.";
                 
            }
            
            return view;
        }
    });
 
    this.ContributorPage = Class.create(TabPage, {
        initialize:function( $super ){
            var survey = new Survey;
            $super( {
                container: Templates.build('contributor/index'),
                tabs:[
                survey,
                Templates.build('contributor/check'),
                Templates.build('contributor/summary'),
                Templates.build('contributor/export')       
                ]
            });
        },
        render: function($super){
            $super();
            this.select(0);
        // this.trigger('load');
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
        // this.trigger('load');
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
        // this.trigger('load');
        } 
    });
    
    this.ErrorPage = Class.create(Page, {
        
        render: function(){
            
            this.el.append( 'error' );
            this.trigger('load');
        }
    });
    
}).call(this, jQuery);


// create a global var to store app specific properties
App = new Application;
