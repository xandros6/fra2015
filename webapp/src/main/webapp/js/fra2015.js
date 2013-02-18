


(function($) {


    var User = Class.create({

        initialize: function(username, role, token, countries){
            this.username = username;
            this.token = token;
            this.role = role;
            this.countries = countries;
            
            this.actions = {
                'canAddFeedback': function(user){
                    return user.role === 'reviewer';
                },
                'canEdit': function( user ){
                    return user.role === 'contributor';
                },
                'canSave': function( user ){
                    return user.role === 'contributor';
                }
            }
            
        },

        isGuest: function(){
            return (this.token === null);
        }, 
        
        check: function( action ){
            return this.actions[action].apply( null, [this] ) || false;
        }
    });


    this.Application = Class.create({

        initialize: function(){
            this.user = new User;
        },
        
        setUser: function(username, role, token, countries){
            this.user = new User(username, role, token, countries);
        }


    });

    // TODO abstract Observable class
    var Model = Class.create({
        initialize:function(){
            this.events = {
                'load': []
            };
        },
        trigger: function( event ){
            var handlers = this.events[event];
            for (var i=0; i<handlers.length; i++){
                var handler = handlers[i];
                handler.call( this, this );
            }
        },
        bind: function(event, handler){
            this.events[event].push( handler );
        },
        unbind: function(event, handler){
            var index = this.events[event].indexOf(handler);
            this.events[event].splice(index, 1);
        }
    });

    var View = Class.create({
        initialize:function(){
            this.el = $('<div></div>');
            this.events = {
                'load': [],
                'click':[],
                'change':[]
            };
        },
        render: function(){
            // do nothing
            return this;
        },
        trigger: function( event, params ){
            // console.log('trigger event ' + event);
            var handlers = this.events[event];
            for (var i=0; i<handlers.length; i++){
                var handler = handlers[i];
                // console.log( handler);
                handler.call( this, this.el, params );
            }
        },
        bind: function(event, handler){
            this.events[event].push( handler );
        },
        unbind: function(event, handler){
            var index = this.events[event].indexOf(handler);
            this.events[event].splice(index, 1);
        }
    });


    var Page = Class.create(View, {
        render:function( $super ){
            $super();
            this.el.find('.logout').bind('click', function(){
                // App.notify('logout');
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

    this.View = View;
    this.Page = Page;

    var TabPage = Class.create(Page, {

        initialize:function( $super, options ){
            $super();
            this.container = options.container;
            this.tabs = options.tabs;

            var self = this;
            $.each( this.tabs, function(index, tab){
                tab.bind('load', function(elem){
                    self.el.find('#tabContent').empty();
                    self.el.find('#tabContent').append( elem );
                    self.trigger('change', elem);




                });
            });
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
                self.trigger('load', self.el);

            });
            this.container.render();
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
            // this.el.find('#tabContent').empty();
            // var self = this;
            /*this.tabs[ index ].bind('load', function(elem){
                self.el.find('#tabContent').append( elem );
                self.trigger('change', elem);
            });*/
            this.tabs[ index ].render();

        }
    });

    var Templates = {

        /* contributor templates */

        'contributor/index': function(){
            var t = new Template({
                url: './contributor/index.html'
            });
            /* t.bind('load', function(el){
                el.find('#languageSelector')
                .change( function(){
                    var lang = '';
                    el.find("select option:selected").each(function () {
                        lang += $(this).attr('value');
                    });
                    App.setLanguage( lang );
                });
               el.find('#userField').text( App.user.username + ' (' + App.user.role +')');
            });*/
            return t;
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
            var t = new Template({
                url: './admin/index.html'
            });
            /*t.bind('load', function(el){
                el.find('#languageSelector')
                .change( function(){
                    var lang = '';
                    el.find("select option:selected").each(function () {
                        lang += $(this).attr('value');
                    });
                    App.setLanguage( lang );
                });
                el.find('#userField').text( App.user.username + ' (' + App.user.role +')');
            });*/
            return t;
        },
        'admin/activity-log': function(){



            var users = [
            'user1', 'user2', 'user3', 'user4'
            ];

            var t = new Template({
                url: './admin/activity-log.html'
            });
            t.bind('load', function( el ){
                el.find( "#startTime" ).timepicker();
                el.find( "#startDate" ).datepicker();
                el.find( "#endDate" ).datepicker();
                el.find( "#endTime" ).timepicker();
                el.find( "#countries" ).autocomplete({
                    source: countries
                });
                el.find( "#users" ).autocomplete({
                    source: users
                });
                el.find('#userField').val( App.user.username + ' (' + App.user.role +')' );
            });
            return t;
        },
        'admin/create-users': function(){

            var resource = new Resource({
                base: baseUrl + '/rest', // TODO externalise
                // base:'/fra2015/rest',
                endpoint:'users',
                type:'User',
                api:{
                    find:'',
                    create:'',
                    update:'user'
                }
            });


          
            var t = new Template({
                url: './admin/create-users.html'
            });
            t.bind('load', function( el ){
                      
                /*
                 *  open filter window
                 */
                el.find('#filterBtn').click(function(){
                    var win = el.find('#filterWindow');
                    var filter = {};
                    filter.name = win.find('name');
                    filter.username = win.find('username');
                    filter.country= win.find('countries');
                    filter.email= win.find('email');
                    filter.role= win.find('role');
                // TODO
                });
                
                /*
                 * open create/edit user window
                 */ 
                el.find( "#createBtn" ).click(function(){
                    var win = EditUserWindow.instance();
                    win.reset();
                    win.open();
                });
          
                /*
                 * Error panel   
                 *        
                 */                
                var ErrorPanel = {
                    instance: function(){
                        var panel = el.find('#errorPanel');
                        return {
                            
                            display: function( msg ){
                                panel.empty();
                                panel.append( '<div class="alert alert-error">' + msg + '</div>' );
                            }
                            
                        };
                    }
                };
                
             
                var EditUserWindow = {
                    
                    instance: function(){
                        /*
                         * defines country label appearance
                         */
                        function createCountryLabel( name ){
                            var label = $('<span class="label label-info"></span>');
                            label.append(name);
                            return label;
                        };
                        /*
                         *  this handler add a country to the list of selected countries
                         */
                        var addCountryHandler = function(){
                            var value = el.find("#selectedCountry").val();
                            el.find("#selectedCountry").empty();
                            el.find( "#countries" ).empty();  
                            
                            // check if this country is already selected
                            var countries = el.find('#ccountries').val();
                            
                            if ( countries.indexOf( value ) !== -1 ){
                                // country already in list
                                // ignore
                                return false;
                            }
                            
                            el.find( "#selectedCountries" )
                            .append( createCountryLabel(value))
                            .append( '&nbsp;&nbsp;');
                      
                              
                            if ( countries.length>0){
                                countries += ', ' + value;
                            } else {
                                countries = value;
                            }
                            el.find('#ccountries').val( countries );
                    
                    
                            var role = el.find('#roleComboBox').val();
                            if ( role !== 'reviewer' && role !== 'editor'){
                                el.find( "#addCountryBtn" ).off('click');
                                el.find( "#addCountryBtn" ).addClass('disabled');
                            }
                    
                            return false;
                        };
                        var win = el.find('#createUserWindow');
                        
                        win.find( "#addCountryBtn" ).off('click').click( addCountryHandler );
                        el.find('form :input').off('change').change(function() {
                            if ( $("#createUserForm").valid() ){
                                el.find( "#saveBtn" ).removeClass('disabled');
                                el.find( "#saveBtn" ).off('click').on('click', function(){
 
                                    if ( $("#createUserForm").valid()  ){
                                
                                        var role = el.find('#roleComboBox').val();
                                        var countries = el.find('#ccountries').val();  
                                        if ( countries.split(', ').length > 1 && role != 'reviewer' && role !='editor'){
                                            ErrorPanel.instance()
                                            .display( 'Users with role ' + role + ' cannot have more than one country' );
                                            return;
                                        }
                                
                                        var obj = {};
                                        obj.name = el.find('#cname').val();
                                        obj.newPassword = el.find('#cpassword').val();
                                        obj.role = el.find('#roleComboBox').val();
                                        obj.username = el.find('#cusername').val();
                                        obj.email = el.find('#cemail').val();
                                        obj.countries = countries; 

                                        var id = el.find('#cid').val();
                                

                                        if ( ! id ){ // create
                                            resource.create( obj )
                                            .onSuccess(function(){
                                                loadItems();
                                            })
                                            .onFailure(function( response ){
                                                console.error( response );
                                                ErrorPanel.instance().display( 'Cannot save user. Username ' + obj.username + ' already in use.' );   
                                            }).execute();
                                        } else { // update
                                    
                                            if ( obj.role !== 'reviewer' && obj.role !== 'editor'){
                                                delete obj.countries;
                                            }
                                            
                                            // console.log( obj );
                                    
                                            resource.update( id, obj )
                                            .onSuccess(function(){
                                                loadItems();
                                                el.find( "#saveBtn" ).text('Save');
                                            })
                                            .onFailure(function( response ){
                                                console.error( response );
                                                ErrorPanel.instance().display( 'Cannot update user. ' + response.statusText ); 
                                            }).execute();
                                        }
                                

                                        // close window
                                        el.find('#createUserWindow').modal('hide');
                                    } else {
                                        console.error('invalid form.');
                                    }

                                });
                            } else {
                                el.find( "#saveBtn" ).addClass('disabled');
                                el.find( "#saveBtn" ).off('click');
                        
                                el.find( "#addCountryBtn" ).off('click').on('click', addCountryHandler);
                                el.find( "#addCountryBtn" ).removeClass('disabled');
                            }
                        });
                        
                        return {
                            /*
                             * clean the content in user window
                             * 
                             * @param user, object to fill the window, if null, user will be created
                             * 
                             */
                            reset: function( user ){
                                
                                
                                // fill in fields
                                win.find('#cid').val( user? user.id : null);
                                win.find('#cname').val( user? user.name : '');
                                win.find('#roleComboBox').val( user? user.role : '' );
                                win.find('#cpassword').val( '');
                                win.find('#cusername').val( user? user.username : '');
                                win.find('#cemail').val( user? user.email : '');
                                
                                el.find( "#selectedCountries" ).empty();
                                win.find( "#ccountries" ).val( user? user.countries: '');
                                win.find( "#countries" ).val('');
               
                                if (user){
                                    
                                    if ( user.countries && user.countries.length > 0 ){
                                        var array = user.countries.split(', ');
                                        $.each( array, function(id, country){
                                            el.find( "#selectedCountries" )
                                            .append( createCountryLabel(country))
                                            .append( '&nbsp;&nbsp;');
                      
                                        });        
                            
                                        if ( user.role !== 'reviewer' && user.role !== 'editor'){
                                            el.find( "#addCountryBtn" ).off('click');
                                            el.find( "#addCountryBtn" ).addClass('disabled');
                                        }
                                    }
                                    
                                    // user role cannot be modified
                                    win.find('#roleComboBox').prop('disabled', 'disabled');
                                } else {
                                    
                                    win.find('#roleComboBox').prop('disabled', false);
                                }
                                
                                win.find( "#saveBtn" ).text(user ? 'Update' : 'Save');
                                win.find( "#saveBtn" ).removeClass('disabled');
                        
  
                        
                            },
                            /*
                             * open this window
                             */
                            open: function(){
                                win.modal('show');
                            }
                           
                        };
                    }
                  
                };
                

                // TODO create an object UserTable
                /*
                 *  add a row to the user table
                 */
                var addRow = function( index, user ){
    
                    var link = $('<a>Edit</a>');
                    link.addClass('btn');
                    link.click( function editBtnHandler(){
                        var win = EditUserWindow.instance();
                        win.reset(user);
                        win.open();
                    });
                    
                    var row = $('<tr class="rowItem"></tr>');
                    row.append('<td>'+ user.name +'</td>');
                    row.append('<td>'+ user.username +'</td>');
                    row.append('<td>'+ user.role +'</td>');
                    row.append('<td>'+ user.countries +'</td>');
                    row.append( $('<td></td>').append(link) );
                    el.find('#userTable')
                    .append( row );
                };

                /*
                 * add items to table
                 */
                var loadItems = function(){
                    resource.find()
                    .onSuccess( function( result ){
                        // remove existing rows
                        el.find('.rowItem').remove();

                        if ( result.User ){
                            $.each( result.User, addRow );
                        }

                    })
                    .onFailure( function( response ){
                        ErrorPanel.instance().display( 'Cannot load users' );     
                    }).execute();
                };

                // load items
                loadItems();


                /*
                 * binds the textfield to autocomplete jquery plugin
                 */
                el.find( "#countries" ).autocomplete({
                    source: countries,
                    select: function(event, ui) {
                        var field = $(this);
                        el.find("#selectedCountry").val(ui.item.value);
                    /* setTimeout(
                            function(){
                                field.val('');
                            },1000);*/ // 1 sec
                    // return false;
                    }
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
            var t = new Template({
                url: './reviewer/index.html'
            });
            t.bind('load', function(el){
                el.find('#languageSelector')
                .change( function(){
                    var lang = '';
                    el.find("select option:selected").each(function () {
                        lang += $(this).attr('value');
                    });
                    App.setLanguage( lang );
                });
                el.find('#userField').text( App.user.username + ' (' + App.user.role +')');
            });
            return t;
            return t;
        },
        'reviewer/activity-log': function(){

            var users = [
            'user1', 'user2', 'user3', 'user4'
            ];

            // TODO use template variables
            var t = new Template({
                url: './admin/activity-log.html'
            });
            t.bind('load', function( el ){
                el.find( "#startTime" ).timepicker();
                el.find( "#startDate" ).datepicker();
                el.find( "#endDate" ).datepicker();
                el.find( "#endTime" ).timepicker();
                el.find( "#countries" ).autocomplete({
                    source: countries
                });
                el.find( "#users" ).autocomplete({
                    source: users
                });
            });
            return t;
        },
        'reviewer/surveys': function(){
            
            var t = new Template({
                url: './reviewer/surveys.html'
            });
            t.bind('load', function( el ){
                
                
                var countries = App.user.countries.split(',');
                if ( countries ){
                    var table = el.find('#surveyListTable').find('tbody');
                    $.each( countries, function(index, country){
                        var model = new Survey({
                            country: country
                        });
                        var survey = new SurveyPage({
                            model:model
                        });
                        
                        var link = $('<a href="#" class="btn">View</a>');
                        link.click( function(){
                            el.empty();
                            survey.bind('load', function( ){
                                el.append( survey.el );
                            });
                            survey.render();
                        });
                        
                        var row = $('<tr></tr>');
                        row.append('<td>'+ country +'</td>');
                        row.append('<td></td>');
                        row.append('<td></td>');
                        row.append( $('<td></td>').append( link ));
                        table.append( row );
                    });
                } else {
                    throw 'Cannot create surveys page: no country associated to this user';
                }
                    
                
            });
            return t;
        },
        'reviewer/export': function(){
            // TODO use template variables
            return new Template({
                url: './reviewer/export.html'
            });
        },

        build: function(name){
            return this[name].call(this);
        }
    };
    
    
    
    var SubmitFeedback = Class.create(View, {
        initialize: function($super, feedbacks){
            $super();
            
            var feedInput = $('<textarea></textarea>');
            feedInput.addClass('span8');

            this.el.append( feedInput );
            var feedBtn = $('<a>'+ $.t('add_feedback') +'</a>');
            feedBtn.addClass('btn btn-small');
            feedBtn.click( function(){
                var text = feedInput.val();
                var feed = $('<div></div>');
                feed.addClass('alert alert-block');
                feed.append('<button type="button" class="close" data-dismiss="alert">&times;</button>');
                feed.append( '<strong>Reviewer</strong> '+ $.t('says') +': "' + text +'"');
                feedbacks.append( feed );
                feedInput.val('');
            });
            // this.el.append( feedBtn );


            var approveBtn = $('<a>'+ $.t('approve') +'</a>');
            approveBtn.addClass('btn btn-primary btn-small');
            approveBtn.attr('data-toggle', 'button');
            approveBtn.click( function(){
                switch ( approveBtn.text() ){
                    case $.t('approve'):
                        approveBtn.text( $.t('cancel') );
                        break;
                    case $.t('cancel'):
                        approveBtn.text( $.t('approve') );
                        break;
                    default:
                        break
                }
            });

            var feedControl = $('<div></div>');
            feedControl.addClass('pull-right btn-group');
            feedControl.append( approveBtn );
            feedControl.append( feedBtn );


            this.el.append( feedControl );
        }
    });
    
    var Feedbacks = Class.create(View, {
        initialize: function($super, json){
            $super();
            this.json = json;
            
           
            var el = this.el;
            if ( App.user.check('canAddFeedback')){
                var addFeedback = new SubmitFeedback( this );
                this.el.append( addFeedback );
            }
            
            
            if ( json ){
                // create list of previous feedbacks
                $.each( json, function(index, feed){
                    var feedback = $('<div></div>');
                    feedback.addClass('alert alert-block');
                    feedback.append( '<strong>'+feed.reviewer+'</strong>' + ' says: "' + feed.text +'"');
                    el.append(feedback);
                }); 
            }
            
        }
    });
    
    var Entry = Class.create(View, {
        initialize: function($super, options){
            $super();
            
            this.options = options;
 
            if ( options.title ){
                this.el.append('<h4>' + L(options.title) + '</h4>');
            }
            

            if (options.tooltip){
                this.el.append('<div class="alert alert-info">'+ L(options.tooltip) +'</div>');
            }
            if ( options.description ){
                this.el.append( '<p>' + L(options.description) + '</p>');
            }
            
            // feedback list
            var feedbacks = new Feedbacks( options.feedbacks );
            this.el.append( feedbacks.el );
           

            var control = $('<div class="control"></div>');
            control.addClass( 'pull-right');
            /*if ( App.user.check('canSave')){
                var saveBtn = $('<a>'+ $.t('save') +'</a>');
                saveBtn.attr('href', '#');
                saveBtn.addClass( 'btn btn-mini btn-primary btn-save-survey');
                control.append( saveBtn ); 
            }*/
            
            this.el.append( '<div class="entry"></div>');
            this.el.append( control );
            this.el.append('<br/><br/>');
        }
    });
    
    /*
     * simple non editable html text
     */
    var Text = Class.create(Entry, {
        initialize:function( $super, options ){
            $super( options );
            this.type = 'text';
            var text = $('<p></p>');
            text.append( L(options.template) )
            this.el.find('.btn-save-survey').remove();
            this.el.find('.entry').append( text );
        },
        render: function($super){
            $super();
            this.trigger('load');
            return this;
        }
    });

    /*
     * a ckeditor text area
     */
    var TextArea = Class.create(Entry, {
        initialize:function( $super, options ){
            $super( options );
            this.type = 'textarea';
            this.json = options.json;

            this.id =  Math.random().toString(36).substring(7);
            var text = $('<textarea></textarea>');
            text.addClass('texteditor');
            text.attr('entry-item-id', 0);
            
            if ( ! App.user.check('canEdit') ){
                text.attr('disabled', 'disabled');
                text.attr('value', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
                text.addClass('span8');
            }
            
            text.attr('cols', '160');
            text.attr('rows', '10');
            text.attr('id', this.id);
            text.attr('name', this.id);
            text.addClass('entry-item');
            text.attr('rowNumber', 0);
            text.attr('columnNumber', 0);
            
            var value = options.context[ options.variable +',0,0'  ];
            if ( value ){
                text.val( value.content.replace("<![CDATA[", "").replace("]]>", "") );  
            }
            
            this.el.find('.entry').append( text );
            
        },
        render: function($super){
            $super();
            this.addEvents();
            this.trigger('load');
            return this;
        },
        addEvents: function(){
            this.el.find('.entry-item')
            .attr('entry-id', this.options.variable); // ?
            
            var self = this;
            $.each( this.el.find('.entry-item'), function(index, entry){
                var cell = $(this);
                var value = self.options.context[ 
                self.options.variable + ',' 
                + cell.attr('rowNumber') + ','
                + cell.attr('columnNumber')];
                if ( value ){
                    cell.empty().append( value.content );  
                } else {
                    cell.empty().append('&nbsp;');
                }
            });

        }
    });

    var Table = Class.create(Entry, {
        initialize:function( $super, options ){
            $super( options );
            this.type = 'table';
            
            var template = options.template;
            if ( template ){
                
                var table = $( template.replace("<![CDATA[", "").replace("]]>", "") );
                table.addClass('table table-bordered table-hover table-condensed table-striped');
                
                if ( App.user.check('canEdit') && table.hasClass("extensible")){   
                    // button to add new row to table
                    var addBtn = $('<a>'+ $.t('add_row') +'</a>');
                    addBtn.attr('id', 'addBtn');
                    addBtn.attr('href', '#');
                    addBtn.attr('class', 'btn btn-mini');
                    this.el.find('.control').append( addBtn );
                    // add button to remove row
                    // add extra column
                    var c = table.find('tr:first td').length;
                    table.find('tr:first').append('<td class="action-column" width="80px"></td>');
                    table.find('tr:gt(0)').append('<td class="action-column" width="80px"><a href="#" class="btn delete-btn">Delete</a></td>');
                }
                
                if ( !table.hasClass("editable") ){
                    this.el.find('.btn-save-survey').remove();
                }
                
                this.addEmptyRow = function(){
                    var last = this.el.find('table').find('tr:last');
                    var row = last.clone(); 
                    
                    $.each(row.find('td'), function(index, item){
                        var cell = $(this);
                        cell.attr('rowNumber', parseInt(cell.attr('rowNumber'))+1);
                    });
                    
                    row.find('.entry-item')
                    // .addClass('editable entry-item')
                    .attr('entry-id', this.options.variable) // ?
                    // .off('click')
                    .click(function(){
                        var cell = $(this); 
                        if ( cell.hasClass('editable') ){
                            cell.removeClass("editable"); 
                            cell.addClass("editing");
                            var text = cell.html();
                            cell.html('<input style="width:80%"  class="celleditor" type="text" value="'+text+'"/>');
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
                    }
                    )
                    .empty().append('&nbsp;');
                    row.appendTo(table); 

                    row.find('.delete-btn').click(function(e){
                        var result = window.confirm('Are you sure you want to delete these data?');
                        if ( result ){
                            alert('Delete! Mock up method.');  
                        }
               
                        return false;
                    });

                    return row;
                };
                
                
                this.el.find('.entry').append( table );
            }
        },
        render: function($super){
            $super();
            this.addEvents();
            this.trigger('load');
            return this;
        },

        addEvents: function(){

            var table = this;
            
            // bind events to buttons
            this.el.find('#addBtn').click(function(evt){
                table.addEmptyRow();
                return false;
            });
            
            this.el.find('.delete-btn').click(function(e){
                var result = window.confirm('Are you sure you want to delete these data?');
                if ( result ){
                    alert('Delete! Mock up method.');  
                }
               
                return false;
            });
            
            // replace labels with translated text
            this.el.find('label').each( function(i, l){
                var label = $(l);
                var cell = label.parent();
                cell.empty().append( L( label ) );
            });
            
            // replace placemarks with tooltips
            this.el.find('td').each( function(index, entry){
                var cell = $(this);
                
                
                if ( cell.hasClass('action-column')){
                    return;
                }
                
                var value = cell.html();
		
                // etj startDate
                var re = /{{([^}])*}}/g;
                var matchArr = value.match( re );
                value = value.replace( re, '<i class="icon-question-sign"></i>');
                cell.empty().append( value );
		

                if(matchArr) {
                    // console.log( "value " + value );
		
                    cell.find('i').each( function(index2, entry2){
                        // console.log( "entry " + matchArr[index2] + " #"+index2 );
                        var labelId = matchArr[index2].substr(2,matchArr[index2].length-4)
                        // console.log( "labelid ->" + labelId + "<-" );
                        var tooltip = Lref( labelId );
		      
                        if (tooltip) {
                            $(entry2).popover({
                                title: 'Note',
                                html: true,
                                content: tooltip
                            });
                        } else {
                            alert("Bad tooltip # " + labelId);
                        }
		      
                    });
                }
		
            //etj end
		
                
            // create tooltip
            //                var re = /{{(.*)}}/;
            //                var match = value.match( re );
            //                value = value.replace( re, '<i class="icon-question-sign"></i>');
                
            //                cell.empty().append( value );

		
		
            //                if ( match ){
            //                    console.log( match );
            // enable tooltips
            //                    cell.find('i').popover({
            //                        title: 'Note',
            //                        html: true,
            //                        content: match[1]
            //                    }); 
            //                }
                
                
            });
         
            var self = this;
            
            // create entry item cells
            this.el.find('.entry-item').each( function(index, entry){
                var cell = $(this);
                cell.empty();
                
                // get previous value from context
                var value = self.options.context[ 
                self.options.variable + ',' 
                + cell.attr('rowNumber') + ','
                + cell.attr('columnNumber')];
        
                // remember value
                var hidden = $('<input class="entry-item-value" type="hidden">');
                // add visible content
                var div = $('<div></div>');
                div.attr('id', 'cell-content');
                if ( value ){
                    div.append( value.content );
                    hidden.val(value.content);
                } else {
                    div.append( '&nbsp;');
                }
                
                cell.append( hidden );
                cell.append(div);
                
                if ( App.user.check('canEdit') ){
                    
                    cell.css('backgroundColor', '#F2F5A9')
                    .attr('entry-id', self.options.variable) 
                    .click(function(){
                        var cell = $(this);
                        if ( cell.hasClass('editable') ){
                            cell.removeClass("editable");
                            cell.addClass("editing");
                            var text = cell.find('#cell-content').html();
                            cell.find('#cell-content').html('<input style="width:80%" class="celleditor" type="text" value="'+text+'"/>');
                            cell.find('.celleditor').blur( function(){
                                if ( cell.hasClass('editing') ){
                                    cell.removeClass("editing");
                                    cell.addClass("editable");
                                    var text = cell.find(".celleditor").attr('value');
                                    cell.find('#cell-content').html( text );
                                    hidden.val( text ).trigger('change');
                                }
                                return false;
                            });
                            cell.find('.celleditor').focus();
                        }
                        return false;
                    });
                         
                } 
                
            }); 
            
            // create mutually exclusive checkboxes
            this.el.find('.boolean').each( function(index, entry){
                var cell = $(this);
                cell.attr('entry-id', self.options.id);
                cell.off('click');
                
                var yesBtn = $('<input name="yes" class="radio-boolean" type="checkbox">');
                var noBtn = $('<input name="no" class="radio-boolean" type="checkbox">');
                var radio=$('<div></div>');
                radio.append( yesBtn ).append( 'Yes<br/>');
                radio.append( noBtn ).append( 'No');
                
                var value = cell.find('.entry-item-value').val();
                radio.find('.radio-boolean').each( function(index, item){
                    var checkbox = $(this);
                    if ( checkbox.attr('name') === value ){
                        checkbox.attr('checked', true);
                    } 
                });
                
                radio.find('.radio-boolean').off('click').click(function () {
                    var checkedState = $(this).attr('checked');
                    radio.find('.radio-boolean:checked').each(function () {
                        $(this).attr('checked', false);
                    });
                    $(this).attr('checked', checkedState);
                    // hidden does not trigger automatically
                    // http://stackoverflow.com/questions/6533087/jquery-detect-value-change-on-hidden-input-field
                    cell.find('.entry-item-value')
                    .val( $(this).attr('name') )
                    .trigger('change');
                    ;
                    return true;
                });
           
                // cell.empty();
                cell.find('#cell-content').empty().append( radio );
                if ( ! App.user.check('canEdit') ){
                    radio.find('input').prop('disabled', 'disabled');
                }
            });
            
            // create tier
            this.el.find('.tier').each( function(index, entry){
                var cell = $(this);
                cell.empty();
                
                var value = self.options.context[ 
                self.options.variable + ',' 
                + cell.attr('rowNumber') + ','
                + cell.attr('columnNumber')];
        
                // remember value
                var hidden = $('<input class="entry-item-value" type="hidden">');
                // add visible content
                var div = $('<div></div>');
                div.attr('id', 'cell-content');
                if ( value ){
                    hidden.val(value.content);
                } 
                
                cell.append( hidden );
                cell.append(div);
                
                var content = value? value.content: false;
                
                cell.addClass('entry-item');
                cell.attr('entry-id', self.options.variable)
                
                var s = $("<select />");
                // s.addClass('celleditor');
                s.attr('rowNumber', cell.attr('rowNumber'));
                s.attr('cellNumber', cell.attr('cellNumber'));
                $("<option />", {
                    value: null, 
                    text: '---'
                }).attr('selected', value ? false : true).appendTo(s);
                $("<option />", {
                    value: 'Tier 1', 
                    text: 'Tier 1'
                }).attr('selected', content === 'Tier 1'? true : false).appendTo(s);
                $("<option />", {
                    value: 'Tier 2', 
                    text: 'Tier 2'
                }).attr('selected', content === 'Tier 2'? true : false).appendTo(s);
                $("<option />", {
                    value: 'Tier 3', 
                    text: 'Tier 3'
                }).attr('selected', content === 'Tier 3'? true : false).appendTo(s);
                // cell.empty();
                
                s.change( function(){
                    hidden.val( s.val() ).trigger('change');
                });
                
                div.append( s );
                if ( ! App.user.check('canEdit') ){
                    s.prop('disabled', 'disabled');
                }
            });

        }
    });

    var Section = Class.create(View, {
        initialize:function( $super, options ){
            $super();
            this.type = 'section';
            this.options = options;
            
            this.el = $('<section></section>');
            // this.el.attr('id', options.title.replace(/\s/g, "-").toLowerCase());

            var depth = 2; // TOFIX

            this.el.append( this.createTitle( L(this.options.title), depth) );
            if ( this.options.description ){
                this.el.append( this.createDescription(L(this.options.description), depth));
            }

            var count = 0, length = this.options.items.length;
            var el = this.el;
            if ( this.options.items.length > 0 ){
                $.each( this.options.items, function (index, item){
                    item.bind('load', function(elem){
                        el.append( elem );
                        count++;
                        if (count >= length){
                        // section.trigger('load');
                        }
                    });

                });
            }
        },
        render: function($super, depth, num){
            $super();
            if ( this.options.items.length > 0 ){
                $.each( this.options.items, function (index, item){
                    item.render( depth + 1, num + '.' + (index+1));
                });
            }
            this.trigger('load');


            return this;
        },
        createTitle: function( title, depth ){
            var html;
            var num = this.options.parent + '.' +(this.options.number+1) + ' ';
            switch (this.options.depth){
                case 1:
                    html = $('<h2>'+ num + title +'</h2>');
                    break;
                case 2:
                    html = $('<h3>'+ num + title + '</h3>');
                    break;
                case 3:
                    html = $('<h4>'+ num + title+'</h4>');
                    break;
                default:
                    html = $('<h4>'+ num + title+'</h4>');
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

    var Question = Class.create(Section, {

        initialize:function( $super, options ){
            $super( options );
            this.type = 'question';

        },

        createTitle: function( title ){
            var html = null;
            if ( this.options.number ){
                html = $('<div class="page-header"><h1>'+ this.options.number+'.'+ L(this.options.title) + '</h1></div>');
            } else {
                html = $('<div class="page-header"><h1>'+ L(this.options.title) + '</h1></div>');
            }
            if ( this.options.link ){
                html.append('<div class="well"><p> Click the button to download question documentation. </p> <a href="#" class="btn btn-large btn-primary">Download Documentation</a></div>');
            }
            return html;
        },
        createDescription: function(description ){
            var html = $('<p></p>');
            html.attr('class', 'lead');
            html.append( description );
            return html;
            return html;
        }

    });

    /*
     * html representation of the navbar
     */
    var NavbarView = Class.create( View, {
        
        initialize: function($super){
            $super();
            
            this.el.attr('id', 'navbar-accordion');
            this.el.addClass('accordion');
            this.group = null;
            
        },
        
        addSection: function( section ){
            
            var group = $('<div></div>');
            group.addClass('accordion-group');
            
            
            var id = 'groupid_' + Math.random().toString(36).substring(7);
            
            var title = $('<a></a>');
            title.addClass('accordion-toggle');
            title.attr('href', '#' + id);
            title.attr('data-parent', '#navbar-accordion');
            title.attr('data-toggle', 'collapse');
            title.append( L(section.options.title).toUpperCase() );
            
            var header = $('<div></div>');
            header.addClass('accordion-heading');
            header.append( title );
            
            var collapsable = $('<div></div>');
            collapsable.attr('id', id);
            collapsable.addClass('accordion-body collapse');
            collapsable.append( '<div class="accordion-inner"></div>' );
  
           
            // TOFIX 
            // in theory bootstrap should work also without these lines
            // for some reason it does not
            // for the moment I use this temporary trick
            title.click(function(){
                
                if ( !collapsable.hasClass('in')){
                    collapsable.addClass('in');
                    collapsable.css('display', 'block');
                } else {
                    collapsable.removeClass('in');
                    collapsable.css('display', 'none');
                }
                return false;
            });
            
  
            group.append(header).append(collapsable);
  
            this.group = group;
            this.el.append( group );
        },
        
        addQuestion: function( question ){
            
            if ( this.group ){
                
                var p = $('<p></p>');
                var a = $('<a></a>');
                a.attr('href', '#');
                a.addClass('tab');
                p.append( a );
                var text = $('<div></div>');
                if ( question.options.number ){
                    text.append(question.options.number +'. ');
                }
                text.append(L(question.options.title));
                a.append( text );

                
                
                this.group.find('.accordion-inner').append( p );
                
            } else {
                console.error('Questions must be within a section.');
            }
            
           

    
        }
     
        
    });

    /*
     *  html representation of a survey
     */
    var SurveyView = Class.create( View, {

        initialize: function($super){
            $super();
            this.type = 'survey';
        },

        /*
         *  get the list of question-views (a subset of all views)
         */
        getQuestions: function(){
            if ( this.items ){
                var questions = [];
                var proj = function(index, view){
                    switch (view.type){
                        case 'section':
                            $.each( view.options.items, proj);
                            break;
                        case 'textarea':
                        case 'table':
                            break;
                        case 'question':
                            questions.push(view);
                        default:
                            break;

                    }
                };
                $.each( this.items, proj);

                return questions;
            } else {
                throw "survey does not have items.";
            }
        },

        getNavbar: function(){
            if ( this.items ){
                var navbar = new NavbarView;


                var fc = 0;
                var qnum = 0;
                var depth = 0;
                var builder = function(index, obj){
                    switch( obj.type ){
                        case 'survey':
                            depth++;
                            $.each( obj.items, builder );
                            depth--;
                            break;
                        case 'table':
                        case 'textarea':
                            if ( obj.feedbacks ){
                                fc += obj.feedbacks.length;
                            }

                            break;

                        case 'section':
                            if (depth===1){
                                navbar.addSection( obj );
                            }
                            depth++;
                            $.each( obj.options.items, builder );
                            depth--;
                            break;
                        case 'question':
                            navbar.addQuestion( obj );
                            depth++;

                            fc = 0;

                            $.each( obj.options.items, builder );

                            /* if (fc>0){
                                text.append( '&nbsp;&nbsp;<span class="badge badge-warning">'+ fc + '</span>' );
                            }*/

                            depth--;            
                            break;
                        default:
                            break;

                    }
                }
                builder(0, this);
                return navbar;
            } else {
                throw "survey does not have items.";
            }
        },
        render: function(){
        }
    });

    /*
     *  model for a survey
     */
    var Survey = Class.create( Model, {

        // entry_item_id -> entry_item_value
        values:{},

        initialize: function($super, options){
            $super();
            this.country = options.country;
        },

        isEmpty: function(){
            return this.survey===undefined || this.survey===null;
        },
        
        /*
         * stores locally an answer to the survey
         */
        set: function(variable, row, col, value){     
            this.values[ variable+',' + row + ',' + col ] = {
                variable: variable,
                row: row,
                col: col,
                value: value
            };
        },

        /*
         * sends stored answers to remote db
         *
         */
        save: function(){
            
            
            var req = '<Updates>';
            for (var key in this.values){
                var value = this.values[key];
                var content = value.value;
                if ( content && content.length > 0 ){              
                    req += '<update>';
                    req += '<country>'+ this.country +'</country>';
                    req += '<variable>'+ value.variable +'</variable>';
                    req += '<row>'+ value.row +'</row>';
                    req += '<column>'+ value.col +'</column>'; 
                    req += '<value>'+ value.value +'</value>'; 
                    req += '</update>'; 
                }
            }
            
            req += '</Updates>';
            req = '<BatchUpdate>'+ req +'</BatchUpdate>'
            
            // save confirm dialog
            $("#saveSurveyDialog").on("show", function() {  
                
                
                
                $("#saveSurveyDialog").find('#saveBtn').on("click", function(e) {
                    
                    $.ajax({
                        type:'POST',
                        contentType:'text/xml',
                        cache: false,
                        data: req,
                        // TODO externalize
                        url:baseUrl + '/rest/survey/updateValues',
                        // url:'/fra2015/rest/survey/updateValues',
                        //crossDomain: false,
                        success: function(data){
                            $("#saveSurveyDialog").find('#messageBox')
                            .empty()
                            .addClass('alert alert-info')
                            .append('Data saved successfully');
                            $("#saveSurveyDialog").find('#saveBtn')
                            .addClass('disabled')
                            .off("click");
                        },
                        error: function(data){
                            console.error( data );
                            $("#saveSurveyDialog").find('#messageBox')
                            .empty()
                            .addClass('alert alert-error')
                            .append('Cannot save data. Unknown error.');
                            $("#saveSurveyDialog").find('#saveBtn')
                            .addClass('disabled')
                            .off("click");
                        }
                    });
                    
                         
                });
            });
            
            $("#saveSurveyDialog").on("shown", function() {  
                // reset position of the dialog box
                $("#saveSurveyDialog").css("top", 400);
            });
 
            $("#saveSurveyDialog").on("hide", function() {    
                $("#saveSurveyDialog").find('#saveBtn')
                .removeClass('disabled')
                .off("click");
                
                $("#saveSurveyDialog").find('#messageBox')
                .empty()
                .removeClass('alert alert-info')
                .append('All changes will be saved. Are you sure?');
            });
    
            $("#saveSurveyDialog").on("hidden", function() {  
                // do nothing
                });
    
            $("#saveSurveyDialog").modal({                   
                // "backdrop"  : "static",
                "keyboard"  : true,
                "show"      : true                     
            });
       
        },
       
        /*
         * load a survey from remote db
         */
        load: function(  ){
            
            // empty previous environment
            this.values = {};
            
            if (! this.country ){
                throw 'Survey model is not correctly initialized: missing country.';
            }
            
            if ( this.isEmpty() ){
                var model = this;
                $.ajax({
                    type:'GET',
                    dataType:'json',
                    cache: false,
                    // url:'http://localhost:9191/fra2015/rest/survey/FRA2015',
                    url: baseUrl+'/rest/survey/?country=' + model.country,
                    // url:'/fra2015/rest/survey/?country=IT&name=FRA2015',
                    // crossDomain: false,
                    // url:'./resources/'+ $.i18n.lng() +'/survey.json',
                    success: function(data){
                        model.survey = data.ExtendedSurvey;
                        model.initContext( [].concat( data.ExtendedSurvey.Values.value || []) );
                        model.trigger('load');
                    }
                });
            } else {
                this.trigger('load');
            }

        },

        /*
         * a context is a mapping between entry items and stored values
         */
        initContext: function( values ){
            var context = {};
            if ( values ){
                $.each( values, function(index, value){
                    context[ value.variable + ',' + value.rowNumber + ','+ value.columnNumber] = value;
                });
            }
            console.log( context );
            this.context = context;
        },

        /*
         *  create an html representation of the model
         */
        createSurvey: function(){
            var context = this.context;
            var builder = this;
            var questionNumber = 0;
            var sectionDepth = 0;
            var parent = '';
            return builder.createView( this.survey, {
                'survey': function( obj, handlers){
                    var survey = new SurveyView;
                    survey.items =  builder.createView(  obj.survey, handlers );
                    return survey;
                },
                'textarea': function(obj, handlers){
                    return new TextArea({
                        variable: obj.variable,
                        title: obj.title,
                        description: obj.description,
                        context: context
                    });
                },
                'table': function(obj, handlers){
                    var template = obj.template || '';
                    return new Table({
                        variable: obj.variable,
                        title: obj.title,
                        description: obj.description,
                        template: template.trim(),
                        context: context
                    });
                },
                'text': function(obj, handlers){
                    var template = obj.template || '';
                    return new Text({
                        variable: obj.variable,
                        title: obj.title,
                        description: obj.description,
                        template: template.trim()
                    });
                },
                'question': function(obj, handlers){
                    
                    var elements = [].concat( obj.Elements.question );
                    
                    return $.map( elements, function( question ){
                        sectionDepth = 1;
                        parent = questionNumber+1;
                        var items = builder.createView( question, handlers );
                        sectionDepth = 1;
                        
                        var view = new Question({
                            type: 'question',
                            title: question.title,
                            description: question.description,
                            helpLink: question.helpLink,
                            tooltip: question.tooltip,
                            number: question.noCount ? null: ++questionNumber,
                            items: items
                        });
                        return view;
                    });
                },
                'section': function(obj, handlers){
                    
                    var elements = [].concat( obj.Elements.session );
                    
                    return $.map( elements , function( session, index){
                        var sectionParent = parent;
                        sectionDepth += 1;
                        parent = sectionParent + '.' + (index+1);
                        var items = builder.createView( session, handlers );
                        parent = sectionParent;
                        sectionDepth -= 1;
                        var view = new Section({
                            type:'section',
                            title: session.title,
                            description: session.description,
                            helpLink: session.helpLink,
                            tooltip: session.tooltip,
                            noCount: session.noCount,
                            items: items,
                            depth: sectionDepth,
                            number: index,
                            parent: sectionParent
                        });
                        return view;
                    });   
                },
                'entry': function(obj, handlers){
                    var elements = [].concat(obj.Elements.entry);
                    return $.map( elements , function( entry ){
                        var view = builder.createView( entry, handlers );
                        return view;
                    });   
                }
            });
        },

        createView: function( obj, handlers ){
            
            var handler;
            
            if ( obj.survey ){
                handler = handlers['survey'];
            } else if ( obj.Elements ){
                
                if (obj.Elements.session){
                    handler = handlers['section'];
                } else if ( obj.Elements.question ){
                    handler = handlers['question'];
                } else if ( obj.Elements.entry ){
                    handler = handlers[ 'entry' ];
                }
                
            } else if ( obj.type === 'table' || obj.type === 'textarea' || obj.type === 'text'){
                handler = handlers[ obj.type ];
            }
            
            if ( ! handler ){
                console.log( obj );
                throw 'wrong format in json file';
            }
            
            return handler.call(this, obj, handlers);
 

        }

    });

    var SurveyPage = Class.create(Page, {
        initialize:function( $super, options ){
            $super();

            var page = this;
            var model = options.model;
            // var view = new SurveyView( model );

            var container = $('<div></div>');
            container.attr('class', 'container');
            container.empty();

            var row = $('<div></div>');
            row.attr('class', 'row');
            
            var control = $('<div></div>');
            control.attr('data-spy', 'affix');
            control.attr('data-offset-top', '500');
            control.addClass('control-panel span3');
            var button = $('<a href="#" class="btn btn-primary btn-large btn-save-survey">Save all</a>');
            control.append( button );
            control.affix();
            
            var hide = $('<a>Hide menu</a>');
            hide.attr('href', '#');
 
            var outerLeft = $('<div class="span4"></div>');
            // outerLeft.append( control );
            outerLeft.append( hide );

            var left =  $('<div></div>');
            left.addClass('in');
            outerLeft.append( left );

            var right =  $('<div></div>');
            right.attr('class', 'span8');
            right.attr('id', 'tabContent');

           hide.click(function(){
                if ( !left.hasClass('in')){
                    left.addClass('in');
                    left.css('display', 'block');
                    right.removeClass('span12').addClass('span8');
                    hide.text('Hide menu');
                } else {
                    left.removeClass('in');
                    left.css('display', 'none');
                    right.removeClass('span8').addClass('span12');
                    hide.text('Show menu');
                }
            });         

            row.append( outerLeft );
            row.append(right);
            container.append( row );
            container.append( control );

            this.loading = function(  ){

                // page.model.unbind('load', page.loading);

                var cView = new View;
                cView.el = container;


                var s = model.createSurvey();
                s.render();
                var questions = s.getQuestions();

                var tabPage = new TabPage({
                    container: cView,
                    tabs: questions
                });

                // add nav bar to tab page
                var nav = s.getNavbar();
                left.empty();
                
                
                
                left.append( nav.el );
                nav.bind('click', function( el, index ){
                    tabPage.select( index );
                });

                tabPage.bind('load', function( el){
                    page.el = el;
                    page.trigger('load', el);
                });
                tabPage.bind('change', function(el){
                    el.find('.entry-item-value').change(function(){
                        var hidden = $(this);
                        var cell = hidden.parent();
                        // var value = cell.find('.celleditor').val();
                        var value = hidden.val();
                        var entryId = cell.attr('entry-id');
                        var rowNo  = cell.attr('rowNumber');
                        var cellNo = cell.attr('columnNumber');
                        model.set( entryId, rowNo, cellNo, value);
             
                    });
                     el.find('.btn-save-survey').click( function(e){
                        e.preventDefault();
                        // TOFIX 
                        // It seems hard to bind a change event to CKEDITOR
                        // I need to use this temporary trick
                        $('textarea.texteditor').each( function() {                       
                            var id = $(this).attr('id'); 
                            var entryId = $(this).attr('entry-id'); 
                            var editor = CKEDITOR.instances[ id ];
                            var content = editor.getData();
                            if ( content && content.length > 0 ){ 
                                model.set( entryId, 0, 0, '<![CDATA[' + content + ']]>');
                            } else {
                                model.set( entryId, 0, 0, '');
                            }
                        });
                        
                        // save model
                        model.save();
                    });
                    page.trigger('change');
                });
                tabPage.render();
                cView.trigger('load', cView.el);
                tabPage.select(0);


            };


            this.model = model;

        },
        render: function($super){
            $super();
            this.model.bind('load', this.loading);
            this.model.load();
        }
    });


    var Summary = Class.create(View, {
        initialize:function( $super, options){
            $super();
            this.model = options.model;
            var self = this;
            this.loading = function(){

                self.model.unbind('load', self.loading);

                var table = $('<table></table>');
                table.addClass('table table-bordered table-hover table-condensed table-striped');
                var thead = $('<thead></thead>');
                var trow = $('<tr></tr>');
                thead.append( trow );
                trow.append('<th></th>');
                trow.append('<th>Variables / TOPIC</th>');
                trow.append('<th>Unit</th>');
                trow.append('<th>1990</th>');
                trow.append('<th>2000</th>');
                trow.append('<th>2005</th>');
                trow.append('<th>2010</th>');
                trow.append('<th>2015</th>');
                table.append( thead );
                var breadcrumbs = new Array;
                var section = null;

                var builder = function(index, obj){

                    var parent = '';
                    $.each( breadcrumbs, function(id, item){
                        if (id>0){
                            parent += '.';
                        }
                        parent += item;
                    });

                    switch( obj.type ){
                        case 'textarea':
                            break;
                        case 'table':
                            if ( obj.rows && obj.rowIds ){



                                $.each( obj.rows, function(id, title ){
                                    var row = $('<tr></tr>');
                                    if (id===0){
                                        row.append('<td rowspan="' + obj.rows.length +'">'+ obj.id +'</td>');
                                    }

                                    row.append( $('<td>'+ obj.rowIds[id] + '. ' + title +'</td>') );
                                    row.append( $('<td>'+ obj.unit +'</td>') );
                                    row.append('<td></td>');
                                    row.append('<td></td>');
                                    row.append('<td></td>');
                                    row.append('<td></td>');
                                    row.append('<td></td>');

                                    table.append(row);
                                });



                            }

                            break;
                        case 'survey':
                            $.each( obj.items, builder );
                            break;
                        case 'section':
                            if (breadcrumbs.length===0 && index > 0){ // top level sections and skip intro
                                section = obj.title;
                                table.append('<tr><td></td><td colspan="7"><strong>' + obj.title +'</strong></td></tr>');
                            }
                            breadcrumbs.push( (index+1) );
                            $.each( obj.items, builder );
                            breadcrumbs.pop( );
                            break;
                        case 'question':
                            /*var row = $('<tr></tr>');
                            row.append('<td>' + parent + '.'+ (index+1) + '</td>');
                            row.append('<td>' + obj.description + '</td>');
                            row.append('<td> '+ Math.floor(Math.random()*101) +'% completed</td>'); // TODO
                            table.append(row);*/
                            $.each( obj.items, builder );
                            break;
                        default:
                            throw "parsing error: " + obj.type + " is not a valid type.";
                    }

                };

                builder(0, self.model.survey);

                self.el.attr('class', 'container');
                self.el.empty();
                self.el.append(table);

                self.trigger('load');
            };

        },
        render: function($super){
            $super();
            this.model.bind('load', this.loading);
            this.model.load();
        }
    });

    this.ContributorPage = Class.create(TabPage, {
        initialize:function( $super ){

            var countries = App.user.countries.split(',');
            if ( countries.length > 1){
                console.log( countries );
                throw 'Cannot create contributor page: too many countries associated to the current user ' + App.user.username;
            } else if ( countries.length === 0 ){
                console.log( countries );
                throw 'Cannot create contributor page: no country associated to the current user ' + App.user.username;                
            }

            var model = new Survey({
                country: countries[0]
            });
            var page = this;
            var survey = new SurveyPage({
                model:model
            });
            survey.bind('change', function(){
                page.trigger('change');
            });

            var summary = new Summary({
                model:model
            });
            $super( {
                container: Templates.build('contributor/index'),
                tabs:[
                survey,
                Templates.build('contributor/check'),
                summary,
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
