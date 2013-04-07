<%@ include file="../common/includes/taglibs.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../common/includes/javascript.jsp"%>

 <br/><br/><br/>
<div><div class="container">
<spring:message code="export.selectcountry" /> <input id="countries" style="margin: 0 auto;" type="text" autocomplete="off" /><button class="btn" id="pdf" title="not yet implemented" disabled="disabled" >pdf</button>

 <br/><br/><br/>




<!--  <button class="btn" id="xml" disabled="disabled" >xml</button>
<button class="btn" id="dbdump" title="not yet implemented" disabled="disabled">dump db</button> -->
</div>



</div>

<script>
	$(function() {
		$('#pdf').tooltip();
		$('#countries').typeahead({
			source : function(query, process) {
				var result = [];
				$.each(countriesArr, function(i, country) {
					result.push(country.name);
				});
				process(result);
			},
			updater : function(item) {
				$('#pdf').removeAttr("disabled");
				$('#pdf').removeAttr("disabled");
				return item;
			}
		});
		$('#countries').keyup(function() {
			if (!getSelectedCountry()) {
				$('#pdf').attr("disabled", "disabled");
				
			} else {
				$('#pdf').removeAttr("disabled");
				
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