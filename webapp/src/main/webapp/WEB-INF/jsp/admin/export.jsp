<%@ include file="../common/includes/taglibs.jsp"%>
<div><div class="container">
<p>
        <spring:message code="export.selectcountry" /> <input id="countries" style="margin: 0 auto;" type="text" autocomplete="off" />   
     <!--     <select>
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
        </select> -->
    </p>
                
    
<spring:message code="export.selecthow" />
<div class="btn-group">
<button class="btn" id="pdf" title="not yet implemented"  disabled="disabled">pdf</button>
<button class="btn" id="xml" disabled="disabled" >xml</button>
<button class="btn" id="dbdump" title="not yet implemented" disabled="disabled">dump db</button>
</div>
<br><br>
</div></div>
<script>$(function(){
	$("#pdf").tooltip();$("#dbdump").tooltip();
	$('#countries').typeahead({
	    source: function (query, process) {
	    	var result  = [];	 
	        $.each(countriesArr, function (i, country) {
	        	result.push(country.name);
	        });
	        process(result);
	    },
	    updater:function(item){
	    	$('#xml').removeAttr("disabled");
	    	return item;
	    }
	});
	$('#countries').keyup(function(){
		if(!getSelectedCountry()){
			$('#xml').attr("disabled","disabled");
		}else{
			$('#xml').removeAttr("disabled");
		}
	});
	var getSelectedCountry= function(item){
		var value = $('#countries').val();
		var selectedCountry = $.grep(countriesArr, function(e){ return e.name == value; })[0];
		
		if (!selectedCountry) {
			// country already in list
			// ignore
			return false;
		}
		return selectedCountry;
		
	}
	$("#xml").click(function(){
		var c = getSelectedCountry();
		if(c!=null && c.iso3!=null){
			window.open('export/'+c.iso3);
		}
	});
	
	
});</script>