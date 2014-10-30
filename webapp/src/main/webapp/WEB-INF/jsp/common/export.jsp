<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../common/includes/taglibs.jsp"%>
<%@ include file="../common/includes/javascript.jsp"%>

<h3><spring:message code="export.title" /></h3>

<h4><spring:message code="export.country" /></h4>
<form:form modelAttribute="batchExportConfiguration" action="batchExport" method="post" enctype="multipart/form-data" class="exportForm" id="batchExportConfiguration">
<select multiple="multiple" size="10" name="batchExportCountriesDuallistbox">
</select>
<h4><spring:message code="export.question" /></h4>
<select multiple="multiple" size="5" name="batchExportQuestionsDuallistbox">
</select>
<div class="row-fluid">
    <div class="span6 expSection">
      <div class="checkbox"><label><input type="checkbox" id="excludeUnedited" name="excludeUnedited"><spring:message code="export.excludeUnedited" /></label></div>
      
      <c:if test="${sessionUser.role=='reviewer' || sessionUser.role=='editor' }">
        <div class="checkbox"><label><input type="checkbox" id="includeComments" name="includeComments"><spring:message code="export.includeComments" /></label></div>
      </c:if>
      
      <div class="checkbox"><label><input type="checkbox" id="onlyCFRQ" name="onlyCFRQ"><spring:message code="export.onlyCFRQ" /></label></div>
      <button class="btn" id="batchPdf" title="Export" disabled="disabled" >Export PDF</button>
    </div>
    <div class="span6 expSection">
      <button class="btn" id="batchCSV" title="Export">Export CSV</button>
    </div>
</div>
</form:form>

<c:if test="${not empty uploadItem}">
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
</c:if>

<script>
$(function() {
	  $("#batchCSV").click(function() {
	      var url = 'survey/print/csv';
	      $.fileDownload(url, {
	            preparingMessageHtml: "We are preparing your report, please wait...",
	            httpMethod: "POST",
	            data: $('#batchExportConfiguration').serialize(),
	            failMessageHtml: "There was a problem generating your report, please try again."
	      });
	      return false;
	  });
    $("#batchPdf").click(function() {
      var url = 'survey/print/pdf';
      $.fileDownload(url, {
            preparingMessageHtml: "We are preparing your report, please wait...",
            httpMethod: "POST",
            data: $('#batchExportConfiguration').serialize(),
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

    checkEnableControls();
    
    var batchExportCountriesDuallistbox = $('select[name="batchExportCountriesDuallistbox"]').bootstrapDualListbox({
    	  nonSelectedListLabel: '<spring:message code="export.available"></spring:message>',
    	  selectedListLabel: '<spring:message code="export.selected"></spring:message>'
    });
    $.each(countriesArr, function(i, country) {
      batchExportCountriesDuallistbox.append('<option value="' + country.iso3 + '">' + country.name + '</option>');
    });
    batchExportCountriesDuallistbox.bootstrapDualListbox('refresh');
    batchExportCountriesDuallistbox.change(function(e) {
    	  checkEnableControls();
    }); 

    
    var batchExportQuestionsDuallistbox = $('select[name="batchExportQuestionsDuallistbox"]').bootstrapDualListbox({
        nonSelectedListLabel: '<spring:message code="export.available"></spring:message>',
        selectedListLabel: '<spring:message code="export.selected"></spring:message>'
    }); 
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q01')}">
       batchExportQuestionsDuallistbox.append('<option value="0" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref1'></spring:message></option>');
    </c:if>   
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q02')}">
       batchExportQuestionsDuallistbox.append('<option value="1" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref89'></spring:message></option>');
    </c:if>   
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q03')}">
       batchExportQuestionsDuallistbox.append('<option value="2" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref130'></spring:message></option>');
    </c:if> 
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q04')}">
       batchExportQuestionsDuallistbox.append('<option value="3" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref215'></spring:message></option>');
    </c:if> 
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q05')}">
       batchExportQuestionsDuallistbox.append('<option value="4" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref259'></spring:message></option>');
    </c:if> 
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q06')}">
       batchExportQuestionsDuallistbox.append('<option value="5" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref310'></spring:message></option>');
    </c:if> 
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q07')}">
       batchExportQuestionsDuallistbox.append('<option value="6" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref319'></spring:message></option>');
    </c:if> 
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q08')}">
       batchExportQuestionsDuallistbox.append('<option value="7" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref334'></spring:message></option>');
    </c:if> 
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q09')}">
       batchExportQuestionsDuallistbox.append('<option value="8" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref371'></spring:message></option>');
    </c:if> 
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q10')}">
       batchExportQuestionsDuallistbox.append('<option value="9" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref377'></spring:message></option>');
    </c:if>
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q11')}">
       batchExportQuestionsDuallistbox.append('<option value="10" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref392'></spring:message></option>');
    </c:if>  
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q12')}">
       batchExportQuestionsDuallistbox.append('<option value="11" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref397'></spring:message></option>');
    </c:if>  
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q13')}">
       batchExportQuestionsDuallistbox.append('<option value="12" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref407'></spring:message></option>');
    </c:if>  
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q14')}">
       batchExportQuestionsDuallistbox.append('<option value="13" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref435'></spring:message></option>');
    </c:if>  
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q15')}">
       batchExportQuestionsDuallistbox.append('<option value="14" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref457'></spring:message></option>');
    </c:if>  
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q16')}">
       batchExportQuestionsDuallistbox.append('<option value="15" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref467'></spring:message></option>');
    </c:if> 
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q17')}">
       batchExportQuestionsDuallistbox.append('<option value="16" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref487'></spring:message></option>');
    </c:if> 
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q18')}">
       batchExportQuestionsDuallistbox.append('<option value="17" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref495'></spring:message></option>');
    </c:if> 
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q19')}">
       batchExportQuestionsDuallistbox.append('<option value="18" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref536'></spring:message></option>');
    </c:if>
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q20')}">
       batchExportQuestionsDuallistbox.append('<option value="19" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref545'></spring:message></option>');
    </c:if>
    <c:if test="${sessionUser.role!='reviewer' || fn:contains(allowedQuestions, 'q21')}">
       batchExportQuestionsDuallistbox.append('<option value="20" selected="selected"><spring:message htmlEscape='true' javaScriptEscape='true' code='ref554'></spring:message></option>');
    </c:if>
    batchExportQuestionsDuallistbox.bootstrapDualListbox('refresh');
    batchExportQuestionsDuallistbox.change(function(e) {
        checkEnableControls();
    }); 
  });
  
  function checkEnableControls() {
	  var countriesSelected = $('select[name="batchExportCountriesDuallistbox"]').val();
	  var questionsSelected = $('select[name="batchExportQuestionsDuallistbox"]').val();
	  var enablePdf = (countriesSelected && countriesSelected.length > 0) && (questionsSelected && questionsSelected.length > 0);
	  $("#excludeUnedited").prop('disabled', !enablePdf);
	  $("#includeComments").prop('disabled', !enablePdf);
	  $("#onlyCFRQ").prop('disabled', !enablePdf);
	  $("#batchPdf").prop('disabled', !enablePdf);
	  $("#batchCSV").prop('disabled', !enablePdf);
  }
  
</script>