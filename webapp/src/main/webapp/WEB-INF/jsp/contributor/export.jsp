<%@ include file="../common/includes/taglibs.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../common/includes/javascript.jsp"%>

<div>
	<div class="container">
		<button class="btn pdf" id="fullPdf" title="Full PDF" >Full PDF</button>
		<button class="btn pdf" id="cfrqPdf" title="CFRQ PDF" >CFRQ PDF</button>
		<button class="btn" id="xml" title="XML" >XML</button>
		<hr>	
	</div>
</div>

<script>
$(function() {
	  $("#xml").click(function() {
		  var url = 'export/${country}';
		  window.location = url;
	  });
    $("#fullPdf").click(function() {
      var countryCode = "${country}";
      var url = 'survey/print/pdf';
      $.fileDownload(url, {
          preparingMessageHtml: "We are preparing your report, please wait...",
          httpMethod: "POST",
          data: {printAllQuestions:"true",batchExportCountriesDuallistbox:countryCode},
          failMessageHtml: "There was a problem generating your report, please try again."
      });
      return false;
    });
    $("#cfrqPdf").click(function() {
        var countryCode = "${country}";
        var url = 'survey/print/pdf';
        $.fileDownload(url, {
            preparingMessageHtml: "We are preparing your report, please wait...",
            httpMethod: "POST",
            data: {printAllQuestions:"true",batchExportCountriesDuallistbox:countryCode,onlyCFRQ:"true"},
            failMessageHtml: "There was a problem generating your report, please try again."
        });
        return false;
    });
    $("#feedbackPdf").click(function() {
    	 var countryCode = "${country}";
        var url = 'survey/print/pdf/'+countryCode+'/feedback';
        $.fileDownload(url, {
              preparingMessageHtml: "We are preparing your report, please wait...",
              failMessageHtml: "There was a problem generating your report, please try again."
        });
        return false;
    });
    $('.pdf').tooltip();
  });
  
</script>