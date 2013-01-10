(function($) {
    
    var Uri = Class.create({
        initialize: function( base ){
            this.base = base;
            this.SEPARATOR = '/';
            this.params_ = new Object();
            this.path = '';
            this.isLocal_ = function(uri){
                var pattern=/(.+:\/\/)?([^\/]+)(\/.*)*/i;
                var mHost=pattern.exec( uri );
                return mHost[2] == location.host;
            };
            this.endsWith_ = function(str, suffix) {
                return str.indexOf(suffix, str.length - suffix.length) !== -1;
            }            
        },
        append: function( path ){
            if ( this.endsWith_(this.path, this.SEPARATOR) ){
                this.path = this.path +  path;
            } else {
                this.path = this.path + this.SEPARATOR + path;
            }
            return this;
        },
        
        setProxy: function(proxy){
            this.proxy = proxy;
            return this;
        },
        
        addParam: function(name, value){
            this.params_[name] = value;
        },
        
        toString: function(){
		
            if ( !this.isLocal_(this.base) && ! this.proxy ){
                console.error('You must specify a local proxy to call an external url: ' + this.base);
                return null;
            } else {
                var result = this.base + this.path;
                result += '?';
                for (key in this.params_){
                    result += key + '=' + this.params_[key] + '&';
                }			
                return this.isLocal_(this.base) ? result : this.proxy + encodeURIComponent( result );
            }
		
        }
    });
    
    var Cursor = Class.create({
       
        execute: function(){
        // do nothing
        },
       
        limit: function(first, length){
            this.first = first;
            this.length = length;
        },
       
        onSuccess: function( handler ){
            this.successHandler = handler;
            return this;
        },
       
        onFailure: function( handler ){
            this.failureHandler = handler;
            return this;
        }
       
    });
    
    var marshal = function( type, item ){
        var result = '<' + type + '>';
        for (var key in item){
            result += '<'+ key + '>';
            result += item[key];
            result += '</'+ key + '>';
        }
        result += '</' + type + '>';
        return result;
    };
    
    var Resource = Class.create({
        
        initialize: function( options ){
            this.base = options.base;
            this.endpoint = options.endpoint ;
            this.api = options.api;
            this.type = options.type;
        },
        
        create: function( item ){
            var uri = new Uri( this.base );
            uri.append( this.endpoint );
            uri.append( this.api.create );
            var data = marshal( this.type, item );
            var cursor =  new (Class.create(Cursor, {
                execute: function( $super ){
                    $super();
                    $.ajax({
                        url: uri.toString(),
                        type:'POST',
                        contentType:'text/xml',
                        dataType:'json',
                        data: data,
                        success: function( data ){
                            try{
                                var obj = $.parseJSON(data);
                                cursor.successHandler.call(this, obj);
                            } catch (e){
                                cursor.failureHandler.call(this, 'cannot parse response: ' + e);
                            }
                        },
                        failure: function( data ){
                            cursor.failureHandler.call(this, data);
                        }
                    });
                }
            }));
            return cursor;            
        },
        
        findById: function(id){
            
        },
        
        find: function(){
            var uri = new Uri( this.base );
            uri.append( this.endpoint );
            uri.append( this.api.find );
            var cursor =  new (Class.create(Cursor, {
                execute: function( $super ){
                    $super();
                    $.ajax({
                        url: uri.toString(),
                        dataType:'json',
                        success: function( data ){
                            cursor.successHandler.call(this, data);
                        },
                        failure: function( data ){
                            cursor.failureHandler.call(this, data);
                        }
                    });
                }
            }));
            return cursor;
        },
        
        update: function(id, item){
            var uri = new Uri( this.base );
            uri.append( this.endpoint );
            uri.append( this.api.update );
            uri.append( id );
            var data = marshal( this.type, item );
            var cursor =  new (Class.create(Cursor, {
                execute: function( $super ){
                    $super();
                    $.ajax({
                        url: uri.toString(),
                        type:'PUT',
                        contentType:'text/xml',
                        dataType:'json',
                        data: data,
                        success: function( data ){
                            try{
                                var obj = $.parseJSON(data);
                                cursor.successHandler.call(this, obj);
                            } catch (e){
                                cursor.failureHandler.call(this, 'cannot parse response: ' + e);
                            }
                        },
                        failure: function( data ){
                            cursor.failureHandler.call(this, data);
                        }
                    });
                }
            }));
            return cursor;                   
            
        },
        
        deleteById: function(id){
            
        }
        
    });
    
    this.Resource = Resource;
    
}).call(this, jQuery);
