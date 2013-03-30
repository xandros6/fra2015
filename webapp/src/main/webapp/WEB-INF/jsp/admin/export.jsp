<%@ include file="../common/includes/taglibs.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../common/includes/javascript.jsp"%>

<div><div class="container">
<spring:message code="export.selectcountry" /> <input id="countries" style="margin: 0 auto;" type="text" autocomplete="off" />

<hr>  

<h3><spring:message code="export.title" /></h3>
<p>
        
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

<hr>

<h3><spring:message code="import.title" /></h3>

<form:form modelAttribute="uploadItem" action="importXml" method="post" enctype="multipart/form-data">
	<p>
		<form:input path="fileData" type="file" />
	</p>
	<p>
		<input id="import" class="btn" disabled="disabled" type="submit" />
		<form:input id="countryForImport" path="countryForImport" type="hidden" value="" />
	</p>
</form:form>


<br><br>
</div></div>

<script>
	$(function() {
		$("#pdf").tooltip();
		$("#dbdump").tooltip();
		$('#countries').typeahead({
			source : function(query, process) {
				var result = [];
				$.each(countriesArr, function(i, country) {
					result.push(country.name);
				});
				process(result);
			},
			updater : function(item) {
				$('#xml').removeAttr("disabled");
				$('#import').removeAttr("disabled");
				return item;
			}
		});
		$('#countries').keyup(function() {
			if (!getSelectedCountry()) {
				$('#xml').attr("disabled", "disabled");
				$('#import').attr("disabled", "disabled");
			} else {
				$('#xml').removeAttr("disabled");
				$('#import').removeAttr("disabled");
			}
		});
		var getSelectedCountry = function(item) {
			var value = $('#countries').val();
			var selectedCountry = $.grep(countriesArr, function(e) {
				return e.name == value;
			})[0];

			if (!selectedCountry) {
				// country already in list
				// ignore
				return false;
			}
			return selectedCountry;

		}
		$("#xml").click(function() {
			var c = getSelectedCountry();
			if (c != null && c.iso3 != null) {
				window.open('export/' + c.iso3);
			}
		});
		$("#import").click(function() {
			var c = getSelectedCountry();
			if (c != null && c.iso3 != null) {
				$('#countryForImport').val(c.iso3);
			}
		});

	});
</script>