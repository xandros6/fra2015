(function( window, undefined ) {

    var _ = window._;

    var modules = {};

    var Core = {};

    var Context = function( l, c ){
        

        var listeners = l || {};
        var context = c || null;
        var children = [];

        this.listen = function( events, handler, scope ){
            context = scope;
            _.each( events, function(e){
                if ( handler[e] ){
                    if ( ! listeners[e] ){
                        listeners[e] = [];
                    }
                    listeners[e].push( handler[e] );
                }
            });
            // update children
            _.each( children, function(child){
                child.listen( events, handler, scope);
            });
        };

        this.trigger = function( event ){
            var params = Array.prototype.slice.call(arguments, 1);
            _.each( listeners[event], function(l){
                l.apply( context, params);
            });
        };
        
        // create a new context which inheredits the current context's listerner and context
        this.extend = function(){
            var l = _.clone( listeners );
            var c = _.clone( context );
            var ctx = new Context( l, c );
            children.push( ctx );
            return ctx;
        }
    }

    Core.define = function( name, events, builder ){
        var ctx = new Context;
        ctx.name = 'fake';
        var instance = builder( ctx );
        modules[ name ] = {
            handlers: _.keys( instance ),
            events: events,
            builder: builder
        };
    };


    Core.compose = function( name, m, n){
        var builder = function( context ){
            // var mctx = new Context();
            // var nctx = new Context();
            var mctx = context.extend();
            var nctx = context.extend();
            var minstance = modules[m].builder( mctx );
            var ninstance = modules[n].builder( nctx );
            mctx.listen( _.intersection( modules[m].events, modules[n].handlers), ninstance, ninstance );
            nctx.listen( _.intersection( modules[n].events, modules[m].handlers ), minstance, minstance );
            var obj = {};
            _.each( _.difference(  modules[n].handlers, modules[m].events), function( event){
                if ( obj[event] ){
                    var old = obj[ event ];
                    obj[ event ] = function(){
                        var params = Array.prototype.slice.call(arguments);
                        old.apply(null, params);
                        ninstance[ event ].apply(null, params);
                    };
                } else {
                    obj[ event ] = ninstance[ event ];
                }		
            });
            _.each( _.difference( modules[m].handlers , modules[n].events), function( event){
                if ( obj[event] ){
                    var old = obj[ event ];
                    obj[ event ] = function(){
                        var params = Array.prototype.slice.call(arguments);
                        old.apply(null, params);
                        minstance[ event ].apply(null, params);
                    };
                } else {
                    obj[ event ] = minstance[ event ];
                }
            });
            return obj;
        };
        modules[name] = {
            handlers: _.union( _.difference(  modules[n].handlers, modules[m].events),
                _.difference( modules[m].handlers , modules[n].events) ),
            builder: builder,
            events: _.union( _.difference(modules[m].events, modules[n].handlers ), 
                _.difference(modules[n].events, modules[m].handlers ))
        };
    };

    Core.split = function( name, m, components){
        var builder = function( context ){
            var obj = {};
            // var mctx = new Context();
            var mctx = context.extend();
            var minstance = modules[m].builder( mctx );
            _.each( components, function(n){
                // var nctx = new Context();
                var nctx = context.extend();
                var ninstance = modules[n].builder( nctx );
                mctx.listen( _.intersection( modules[m].events, modules[n].handlers), ninstance, ninstance );
                nctx.listen( _.intersection( modules[n].events, modules[m].handlers ), minstance, minstance );

                _.each( _.difference( modules[m].handlers , modules[n].events), function( event){
                    if ( obj[event] ){
                        // already assigned this handler: do nothing
                    } else {
                        obj[ event ] = minstance[ event ];
                    }
                });


                _.each( _.difference(  modules[n].handlers, modules[m].events), function( event){
                    if ( obj[event] ){
                        var old = obj[ event ];
                        obj[ event ] = function(){
                            var params = Array.prototype.slice.call(arguments);
                            old.apply(null, params);
                            ninstance[ event ].apply(null, params);
                        };
                    } else {
                        obj[ event ] = ninstance[ event ];
                    }
                }); 
            });


            return obj;
        };
        
       
        var handlers = [ ];
        var events = [ ];
        _.each( components, function(n){
            handlers = _.union( handlers, modules[n].handlers);
            events = _.union( events, modules[n].events );
        });
        
        modules[ name ] = {
            handlers: _.union( 
                        _.difference(  handlers, modules[m].events),
                        _.difference( modules[m].handlers , events) ),
            builder: builder,
            events: _.union( 
                        _.difference(modules[m].events, handlers ), 
                        _.difference(events, modules[m].handlers ))
        };
    };

    Core.start = function( name ){
        // console.log( modules );
        return modules[ name ].builder( new Context() );
    };

    window.Core = Core;

})( window );