<%@ include file="../common/includes/taglibs.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../common/includes/javascript.jsp"%>

<div><div class="container">
<input id="countries" style="margin: 0 auto;" type="text" autocomplete="off" />
<button class="btn pdf" id="fullPdf" title="Full PDF" disabled="disabled" >Full PDF</button>
<button class="btn pdf" id="cfrqPdf" title="CFRQ PDF" disabled="disabled" >CFRQ PDF</button>
<button class="btn" id="xml" title="XML" disabled="disabled" >XML</button
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


<br/><br/>
</div></div>

<script>
$(function() {
    
    $("#fullPdf").click(function() {
      var countryCode = getSelectedCountry().iso3;
      var url = 'survey/print/pdf/'+countryCode+'/full';
      $.fileDownload(url, {
            preparingMessageHtml: "We are preparing your report, please wait...",
            failMessageHtml: "There was a problem generating your report, please try again."
      });
      return false;
    });
    $("#cfrqPdf").click(function() {
     var countryCode = getSelectedCountry().iso3;
     var url = 'survey/print/pdf/'+countryCode+'/cfrq';
        $.fileDownload(url, {
              preparingMessageHtml: "We are preparing your report, please wait...",
              failMessageHtml: "There was a problem generating your report, please try again."
        });
        return false;
    });
    $('.pdf').tooltip();
    $('#countries').typeahead({
      source : function(query, process) {
        var result = [];
        $.each(countriesArr, function(i, country) {
          result.push(country.name);
        });
        process(result);
      },
      updater : function(item) {
        $('.pdf').removeAttr("disabled");
        $('#xml').removeAttr("disabled");
		    $('#import').removeAttr("disabled");
        return item;
      }
    });
    $('#countries').keyup(function() {
      if (!getSelectedCountry()) {
        $('.pdf').attr("disabled", "disabled");
        $('#xml').attr("disabled", "disabled");
        $('#import').attr("disabled", "disabled");
      } else {
        $('.pdf').removeAttr("disabled");
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