var countries = [
"AF|Afghanistan","AL|Albania","DZ|Algeria","AS|American Samoa",
"AD|Andorra","AO|Angola","AI|Anguilla","AQ|Antarctica","AG|Antigua And Barbuda",
"AR|Argentina","AM|Armenia","AW|Aruba","AU|Australia","AT|Austria","AZ|Azerbaijan",
"BS|Bahamas","BH|Bahrain","BD|Bangladesh","BB|Barbados","BY|Belarus","BE|Belgium",
"BZ|Belize","BJ|Benin","BM|Bermuda","BT|Bhutan","BO|Bolivia","BA|Bosnia And Herzegovina",
"BW|Botswana","BV|Bouvet Island","BR|Brazil","IO|British Indian Ocean Territory",
"BN|Brunei Darussalam","BG|Bulgaria","BF|Burkina Faso","BI|Burundi","KH|Cambodia",
"CM|Cameroon","CA|Canada","CV|Cape Verde","KY|Cayman Islands","CF|Central African Republic",
"TD|Chad","CL|Chile","CN|China","CX|Christmas Island","CC|Cocos (keeling) Islands","CO|Colombia",
"KM|Comoros","CG|Congo","CD|Congo, The Democratic Republic Of The","CK|Cook Islands","CR|Costa Rica",
"CI|Cote D'ivoire","HR|Croatia","CU|Cuba","CY|Cyprus","CZ|Czech Republic","DK|Denmark","DJ|Djibouti",
"DM|Dominica","DO|Dominican Republic","TP|East Timor","EC|Ecuador","EG|Egypt","SV|El Salvador",
"GQ|Equatorial Guinea","ER|Eritrea","EE|Estonia","ET|Ethiopia","FK|Falkland Islands (malvinas)",
"FO|Faroe Islands","FJ|Fiji","FI|Finland","FR|France","GF|French Guiana","PF|French Polynesia",
"TF|French Southern Territories","GA|Gabon","GM|Gambia","GE|Georgia","DE|Germany","GH|Ghana","GI|Gibraltar",
"GR|Greece","GL|Greenland","GD|Grenada","GP|Guadeloupe","GU|Guam","GT|Guatemala","GN|Guinea","GW|Guinea-bissau",
"GY|Guyana","HT|Haiti","HM|Heard Island And Mcdonald Islands","VA|Holy See (vatican City State)","HN|Honduras",
"HK|Hong Kong","HU|Hungary","IS|Iceland","IN|India","ID|Indonesia","IR|Iran, Islamic Republic Of","IQ|Iraq",
"IE|Ireland","IL|Israel","IT|Italy","JM|Jamaica","JP|Japan","JO|Jordan","KZ|Kazakstan","KE|Kenya","KI|Kiribati",
"KP|Korea, Democratic People's Republic Of","KR|Korea, Republic Of","KV|Kosovo","KW|Kuwait","KG|Kyrgyzstan",
"LA|Lao People's Democratic Republic","LV|Latvia","LB|Lebanon","LS|Lesotho","LR|Liberia","LY|Libyan Arab Jamahiriya", 
"LI|Liechtenstein","LT|Lithuania","LU|Luxembourg","MO|Macau","MK|Macedonia, The Former Yugoslav Republic Of",
"MG|Madagascar","MW|Malawi","MY|Malaysia","MV|Maldives","ML|Mali","MT|Malta","MH|Marshall Islands","MQ|Martinique",
"MR|Mauritania","MU|Mauritius","YT|Mayotte","MX|Mexico","FM|Micronesia, Federated States Of","MD|Moldova, Republic Of",
"MC|Monaco","MN|Mongolia","MS|Montserrat","ME|Montenegro","MA|Morocco","MZ|Mozambique","MM|Myanmar","NA|Namibia",
"NR|Nauru","NP|Nepal","NL|Netherlands","AN|Netherlands Antilles","NC|New Caledonia","NZ|New Zealand","NI|Nicaragua",
"NE|Niger","NG|Nigeria","NU|Niue","NF|Norfolk Island","MP|Northern Mariana Islands","NO|Norway","OM|Oman",
"PK|Pakistan","PW|Palau","PS|Palestinian Territory, Occupied","PA|Panama","PG|Papua New Guinea","PY|Paraguay",
"PE|Peru","PH|Philippines","PN|Pitcairn","PL|Poland","PT|Portugal","PR|Puerto Rico","QA|Qatar","RE|Reunion",
"RO|Romania","RU|Russian Federation","RW|Rwanda","SH|Saint Helena","KN|Saint Kitts And Nevis","LC|Saint Lucia",
"PM|Saint Pierre And Miquelon","VC|Saint Vincent And The Grenadines","WS|Samoa","SM|San Marino",
"ST|Sao Tome And Principe","SA|Saudi Arabia","SN|Senegal","RS|Serbia","SC|Seychelles","SL|Sierra Leone",
"SG|Singapore","SK|Slovakia","SI|Slovenia","SB|Solomon Islands","SO|Somalia","ZA|South Africa",
"GS|South Georgia And The South Sandwich Islands","ES|Spain","LK|Sri Lanka","SD|Sudan","SR|Suriname",
"SJ|Svalbard And Jan Mayen","SZ|Swaziland","SE|Sweden","CH|Switzerland","SY|Syrian Arab Republic",
"TW|Taiwan, Province Of China","TJ|Tajikistan","TZ|Tanzania, United Republic Of","TH|Thailand","TG|Togo",
"TK|Tokelau","TO|Tonga","TT|Trinidad And Tobago","TN|Tunisia","TR|Turkey","TM|Turkmenistan",
"TC|Turks And Caicos Islands","TV|Tuvalu","UG|Uganda","UA|Ukraine","AE|United Arab Emirates",
"GB|United Kingdom","US|United States","UM|United States Minor Outlying Islands","UY|Uruguay",
"UZ|Uzbekistan","VU|Vanuatu","VE|Venezuela","VN|Viet Nam","VG|Virgin Islands, British",
"VI|Virgin Islands, U.s.","WF|Wallis And Futuna","EH|Western Sahara","YE|Yemen","ZM|Zambia","ZW|Zimbabwe" ];


(function($) {
    
    // fake data for login
    var users = {
        'user':'user',
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
                this.role = username;
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
                
                el.find( "#countries" ).autocomplete({
                    source: countries
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
            // TODO use template vars
            var t = new Template({
                url: './reviewer/surveys.html'
            }); 
            t.bind('load', function( el ){
                el.find('#viewBtn').click(function(){
                    // TODO refactor, better paging system
                    el.empty();
                    var model = new Survey;
                    var survey = new SurveyPage({
                        model:model
                    });
                    
                    survey.bind('load', function( ){
                        el.append( survey.el );
                    });
                    survey.render();
                });
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
    
    var TextArea = Class.create(View, {
        initialize:function( $super, options ){
            $super();
            
            this.json = options.json;
            
            this.id =  Math.random().toString(36).substring(7);
            var text = $('<textarea></textarea>');
            text.attr('class', 'texteditor');
            if ( App.user.role != 'user'){
                text.attr('disabled', 'disabled');
                text.attr('value', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
                text.attr('class', 'texteditor span8');
            }
            text.attr('cols', '160');
            text.attr('rows', '10');
            text.attr('id', this.id);
            text.attr('name', this.id);
            this.el.append('<h4>' + options.title + '</h4>');
            if ( options.description ){
                this.el.append( '<p>' + options.description + '</p>');
            }
            var saveBtn = $('<a>Save</a>');
            saveBtn.attr('id', 'saveBtn');
            saveBtn.attr('href', '#');
            saveBtn.attr('class', 'btn btn-mini btn-primary');
            /*saveBtn.click(function(evt){
                alert('Saved!');
                return false;
            });*/
              
            var control = $('<p></p>');
            control.attr('class', 'pull-right');  
            if ( App.user.role == 'user'){
                control.append( saveBtn );     
            }
            
            this.el.append( control );
            this.el.append('<br/><br/>');
            this.el.append(text);
            
            if ( App.user.role == 'reviewer' ){
                var self = this;
                
                var feedInput = $('<textarea></textarea>');
                feedInput.addClass('span8');
                
                this.el.append( feedInput );
                var feedBtn = $('<a>Add Feedback</a>');
                feedBtn.addClass('btn btn-primary btn-small pull-right');
                feedBtn.click( function(){
                    var text = feedInput.val();
                    var feed = $('<div></div>');
                    feed.addClass('alert alert-block');
                    feed.append('<button type="button" class="close" data-dismiss="alert">&times;</button>');
                    feed.append( '<strong>Reviewer</strong> says: "' + text +'"');     
                    self.el.append(feed);
                    feedInput.val('');
                });
                this.el.append( feedBtn );
                this.el.append('<br/><br/>');
            }
            
            // TODO create superclass in commod for tables and textareas
            if ( this.json.feedbacks ){
                var self = this;
                // add feedbacks
                $.each( this.json.feedbacks, function(index, feed){
                    var feedback = $('<div></div>');
                    feedback.addClass('alert alert-block');
                    feedback.append( '<strong>'+feed.reviewer+'</strong>' + ' says: "' + feed.text +'"');
                
                    self.el.append('<br/>');
                    self.el.append(feedback);
                });               
            }
            

        },
        render: function($super){
            $super();
            this.addEvents();
            this.trigger('load');
            return this;
        },
        addEvents: function(){
            this.el.find('#saveBtn').click(function(evt){
                alert('Saved!');
                return false;
            });

        }
    });
    
    var Table = Class.create(View, {
        initialize:function( $super, options ){
            $super();
            
            this.json = options.json;
            
            this.el.append('<h4>' + options.title + '</h4>');
            if ( options.description ){
                this.el.append( '<p>' + options.description + '</p>');
            }  
            
            
            var table = $('<table></table>');
            table.attr('class', 'table table-bordered table-hover table-condensed');
            
            // TODO create two different type of table
            
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
                /*saveBtn.click(function(evt){
                    alert('Saved!');
                    return false;
                });*/
              
                var control = $('<p></p>');
                control.attr('class', 'pull-right');
                
                if ( App.user.role == 'user'){
                    control.append( saveBtn );
                }
                
                
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
                var tbody = $('<tbody></tbody>');
                table.append( tbody );
                
                this.addEmptyRow = function(){
                    var row = $('<tr></tr>');
                    tbody.append( row );
                    row.append( $.map(options.columns, function( column ){
                        var cell = $('<td></td>');
                        if ( App.user.role == 'user'){ 
                            cell.addClass('editable');
                        }
                        
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
                    return row;
                };
                
                // create an empty row
                this.addEmptyRow();
                
                // button to add new row to table
                var addBtn = $('<a>Add row</a>');
                addBtn.attr('id', 'addBtn');
                addBtn.attr('href', '#');
                addBtn.attr('class', 'btn btn-mini');
                
                var saveBtn = $('<a>Save</a>');
                saveBtn.attr('id', 'saveBtn');
                saveBtn.attr('href', '#');
                saveBtn.attr('class', 'btn btn-mini btn-primary');
               
              
                var control = $('<p></p>');
                control.attr('class', 'pull-right');
                
                if ( App.user.role == 'user'){ 
                    control.append( saveBtn );
                } else {
                    addBtn.attr('disabled', 'disabled');
                }
                
                control.append( addBtn );
                
                this.el.append( control );
            }
            
                      
            this.el.append(table);
 
            // TODO refactor: superclass for both textarea and table
 
            if ( App.user.role == 'reviewer' ){
                var self = this;
                
                var feedInput = $('<textarea></textarea>');
                feedInput.addClass('span8');
                
                this.el.append( feedInput );
                var feedBtn = $('<a>Add Feedback</a>');
                feedBtn.addClass('btn btn-primary btn-small pull-right');
                feedBtn.click( function(){
                    var text = feedInput.val();
                    var feed = $('<div></div>');
                    feed.addClass('alert alert-block');
                    feed.append('<button type="button" class="close" data-dismiss="alert">&times;</button>');
                    feed.append( '<strong>Reviewer</strong> says: "' + text +'"');     
                    self.el.append(feed);
                    feedInput.val('');
                });
                this.el.append( feedBtn );
                this.el.append('<br/><br/>');
            }
 
            if ( this.json.feedbacks ){
                var self = this;
                // add feedbacks
                $.each( this.json.feedbacks, function(index, feed){
                    var feedback = $('<div></div>');
                    feedback.addClass('alert alert-block');
                    feedback.append( '<strong>'+feed.reviewer+'</strong>' + ' says: "' + feed.text +'"');
                
                    self.el.append('<br/>');
                    self.el.append(feedback);
                });               
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
            this.el.find('#saveBtn').click(function(evt){
                alert('Saved!');
                return false;
            });
            this.el.find('#addBtn').click(function(evt){
                table.addEmptyRow();
                return false;
            });
            
            this.el.find('.editable').click(function(){
                var cell = $(this);
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
            
        }
    });
    
    var Section = Class.create(View, {
        initialize:function( $super, options ){
            $super();
            this.json = options.json;
            this.options = options;
            this.items = options.items;
            this.el = $('<section></section>');
            this.el.attr('id', options.title.replace(/\s/g, "-").toLowerCase());
            
            var depth = 2; // TOFIX
          
            this.el.append( this.createTitle(this.options.title, depth) );
            if ( this.options.description ){
                this.el.append( this.createDescription(this.options.description, depth));
            }
            
            var count = 0, length = this.options.items.length;
            var el = this.el, section=this;
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
 
    var Question = Class.create(Section, {
        
        initialize:function( $super, options ){
            this.number = options.number;
            $super( options );
            
        },
 
        createTitle: function( title ){
            return html = $('<div class="page-header"><h1> Question #'+ this.number +'</h1></div>');
        },
        createDescription: function(description ){
            var html = $('<p></p>');
            html.attr('class', 'lead');
            html.append( description );
            return html;          
        }    
        
    });
 
    var SurveyView = Class.create( View, {
        
        initialize: function($super, model){
            $super();
        /*var view = this;
            model.bind('load', function(){
                
                view.trigger('load', view.el);
            });*/
        },
        
        getQuestions: function(){
            if ( this.items ){
                var questions = [];
                var proj = function(index, view){
                    switch (view.json.type){
                        case 'section':
                            $.each( view.items, proj);
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
        
        render: function(){
        //this.model.load();
        }
    });
 
    var Survey = Class.create( Model, {
        
        initialize: function($super){
            $super();
        },
        
        isEmpty: function(){
            return this.survey===undefined || this.survey===null;  
        },
        
        load: function(){
            if ( this.isEmpty() ){
                var model = this;
                $.ajax({
                    type:'GET',
                    dataType:'text',
                    url:'./resources/survey.json',
                    success: function(data){
                        try{
                            model.survey = $.parseJSON( data ); 
                        } catch (e){
                            throw 'cannot parse ./resources/survey.json: ' + e;
                        }
                        model.trigger('load');
                    }
                });                
            } else {
                this.trigger('load');
            }

        },
  
        createNavBar: function(){
            
            var ul = $('<ul></ul>');
            ul.attr('class', 'nav nav-list');
            
            
            // TODO create a real view   
            var view = new View;
            view.el = ul;
            
            var fc = 0;
            var qnum = 0;
            var depth = 0;
            var builder = function(index, obj){
                switch( obj.type ){
                    case 'table':
                    case 'textarea':
                        if ( obj.feedbacks ){
                            fc += obj.feedbacks.length;
                        }
                        
                        break;
                    
                    case 'survey':
                        depth++;
                        $.each( obj.items, builder );
                        break;
                    case 'section':
                        if (depth===1){
                            var li = $('<li></li>');
                            ul.append( li );
                            li.addClass('nav-header');
                            li.append( obj.title );  
                        }
                        depth++;
                        $.each( obj.items, builder );
                        depth--;
                        break;
                    case 'question':
                        var li = $('<li></li>');
                        ul.append( li );
   
                        var text = $('<div></div>');
                        text.append( (qnum+1) + '. ' + obj.description );
                        li.append( text );
                        text.addClass('tab');
                        
                        /*li.click(
                            (function(num){
                                return function(){
                                    // ul.find('.active').removeClass('active');
                                    // li.addClass('active');
                                    view.trigger('click', num);
                                }
                            }).call(this, qnum++));*/
                        qnum++;
                        depth++;
                        
                        fc = 0;
                        
                        $.each( obj.items, builder );
                        
                        if (fc>0){
                            text.append( '&nbsp;&nbsp;<span class="badge badge-warning">'+ fc + '</span>' );
                        }
                        
                        depth--;
                        break;
                    default:
                        break;
                                         
                }             
            }
            builder(0, this.survey);
            
                
            return view;
            
        },
        
        createSurvey: function(){
            var num = 0;
            var builder = this;
            return builder.createView( this.survey, {
                'survey': function( obj, handlers){
                    if (!obj.items ){
                        throw 'parsing error: survey has no property "items".';
                    }
                    var survey = new SurveyView;
                    survey.items = $.map( obj.items, function(item){
                        return builder.createView( item, handlers );
                    });
                    return survey;
                },
                'textarea': function(obj, handlers){
                    return new TextArea({
                        title: obj.title,
                        description: obj.description,
                        feedbacks: obj.feedbacks,
                        json:obj
                    });
                },
                'table': function(obj, handlers){
                    return new Table({
                        title: obj.title,
                        description: obj.description,
                        columns: obj.columns,
                        rows: obj.rows,
                        feedbacks: obj.feedbacks,
                        json:obj
                    });
                },
                'question': function(obj, handlers){
                    if (!obj.items){
                        throw 'parsing error: question ' + obj.title + ' has no property "items".';
                    }
                    var items = $.map( obj.items, function(item){
                        return builder.createView( item, handlers );
                    });
                    var view = new Question({
                        title: obj.title,
                        description: obj.description,
                        number: (num+1),
                        items: items,
                        json:obj
                    });
                    num++;
                    return view;
                },   
                'section': function(obj, handlers){
                    if (!obj.items){
                        throw 'parsing error: section ' + obj.title + ' has no property "items".';
                    }
                    var items = $.map( obj.items, function(item){
                        return builder.createView( item, handlers );
                    });
                    var view = new Section({
                        title: obj.title,
                        description: obj.description,
                        items: items,
                        json:obj
                    });
                    return view;
                }            
            });
        },
        
        createView: function( obj, handlers ){
            if ( !obj.type ){
                throw "parsing error: wrong format.";
            }
            var handler = handlers[ obj.type ];
            if ( handler ){
                return handler.call(this, obj, handlers);
            } else {
                throw "no handler for: " + obj.type;
            }
            
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
                    
            var left =  $('<div></div>');
            left.attr('class', 'span4');
            
                    
            var right =  $('<div></div>');
            right.attr('class', 'span8');
            right.attr('id', 'tabContent');
                    
            row.append(left);
            row.append(right);
            container.append( row );
            
            
            this.loading = function(  ){
                
                page.model.unbind('load', page.loading);
                            
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
                var nav = model.createNavBar();
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
                table.addClass('table table-bordered table-hover table-condensed');
                var thead = $('<thead></thead>');
                var trow = $('<tr></tr>');
                thead.append( trow );
                trow.append('<th>Number</th>');
                trow.append('<th>Question</th>');
                trow.append('<th>State</th>');
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
                        case 'table':
                            // TODO count how many are incomplete
                            break;
                        case 'survey':
                            $.each( obj.items, builder );
                            break;
                        case 'section':
                            if (breadcrumbs.length===0){ // top level sections
                                section = obj.title;
                            }
                            breadcrumbs.push( (index+1) );
                            $.each( obj.items, builder );
                            breadcrumbs.pop( );
                            break;
                        case 'question':
                            var row = $('<tr></tr>');
                            row.append('<td>' + parent + '.'+ (index+1) + '</td>');
                            row.append('<td>' + obj.description + '</td>');
                            row.append('<td> '+ Math.floor(Math.random()*101) +'% completed</td>'); // TODO
                            table.append(row);
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
            
            var model = new Survey;
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
