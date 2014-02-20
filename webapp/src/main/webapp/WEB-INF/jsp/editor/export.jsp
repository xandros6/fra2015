<%@ include file="../common/includes/taglibs.jsp"%>

<div><div class="container">
<input id="countries" style="margin: 0 auto;" type="text" autocomplete="off" />
<button class="btn pdf" id="fullPdf" title="Full PDF" disabled="disabled" >Full PDF</button>
<button class="btn pdf" id="cfrqPdf" title="CFRQ PDF" disabled="disabled" >CFRQ PDF</button>
<button class="btn pdf" id="feedbackPdf" title="Feedback PDF" disabled="disabled" >Feedback PDF</button>

<!--  <button class="btn" id="xml" disabled="disabled" >xml</button>
<button class="btn" id="dbdump" title="not yet implemented" disabled="disabled">dump db</button> -->
</div>



</div>

<script>
  $(function() {

    var countriesArr = [];
    <c:forEach items='${countries}' var='country' varStatus='rowItem'>
      countriesArr.push({"id":"${country.iso3}","name": "<spring:message code='country.${country.iso3}'></spring:message>","iso3": "${country.iso3}"});         
    </c:forEach>
    
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
    $("#feedbackPdf").click(function() {
        var countryCode = getSelectedCountry().iso3;
        var url = 'survey/print/pdf/'+countryCode+'/feedback';
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
        $('.pdf').removeAttr("disabled");
        return item;
      }
    });
    $('#countries').keyup(function() {
      if (!getSelectedCountry()) {
        $('.pdf').attr("disabled", "disabled");
        
      } else {
        $('.pdf').removeAttr("disabled");
        
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