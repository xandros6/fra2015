<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" encoding="utf-8" indent="yes"  />  
    <xsl:strip-space elements="*"/> 
    <xsl:variable name="basePath" select="//meta[@id='baseUrl']/@content" />
    
    <xsl:template match="/">      
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>    
                 <fo:simple-page-master master-name="Pagina0" 
                    page-height="29.7cm" page-width="21cm" margin-top="1.0cm"
                    margin-bottom="1.0cm" margin-left="1.0cm" margin-right="1.0cm">
                    <fo:region-body margin-top="0.0cm"/>
                    <fo:region-after extent="3.0cm"/>
                </fo:simple-page-master>
                <fo:simple-page-master master-name="Pagina1" 
                    page-height="29.7cm" page-width="21cm" margin-top="1.0cm"
                    margin-bottom="1.0cm" margin-left="1.0cm" margin-right="1.0cm">
                    <fo:region-body margin-top="0.0cm"/>
                </fo:simple-page-master>
                <fo:simple-page-master master-name="PaginaA4" 
                    page-height="29.7cm" page-width="21cm" margin-top="1.0cm"
                    margin-bottom="1.0cm" margin-left="1.0cm" margin-right="1.0cm">
                    <fo:region-body margin-top="1.0cm" margin-bottom="1.0cm"/>
                    <fo:region-before extent="1.3cm"/>
                    <fo:region-after extent="0.5cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>  
             <fo:page-sequence master-reference="Pagina0">
                <fo:title>FRA 2015 – Country Report, <xsl:value-of select='//title' /></fo:title>
                <fo:static-content flow-name="xsl-region-after">                  
                        <fo:block-container margin-left="20pt" margin-right="20pt">
	                        <fo:block>
	                            <fo:leader leader-pattern="rule" leader-length.optimum="100%" rule-thickness="1pt"/>
	                        </fo:block>
	                        <fo:block text-align="start">
	                            Global Forest Resources Assessment 2015 
	                        </fo:block>  
	                        <fo:block text-align="end">
	                            Country Report <xsl:value-of select='//title' />
	                        </fo:block>  
	                        <fo:block text-align="end" margin-bottom="20pt">
	                            Rome, 2014
	                        </fo:block> 
                        </fo:block-container>      
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block-container border="1pt solid black" height="100%">
                      <xsl:call-template name="genFirstPage"/>
                    </fo:block-container>
                </fo:flow>
            </fo:page-sequence>
            <fo:page-sequence master-reference="Pagina1">
                <fo:title>FRA 2015 – Country Report, <xsl:value-of select='//title' /></fo:title>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block-container height="100%">
                      <xsl:call-template name="genSecondPage"/>
                    </fo:block-container>
                </fo:flow>
            </fo:page-sequence>
            <fo:page-sequence master-reference="PaginaA4">
                <fo:title>FRA 2015 – Country Report, <xsl:value-of select='//title' /></fo:title>
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="start" font-size="8pt" font-family="times">
                        FRA 2015 – Country Report, <xsl:value-of select='//title' />
                    </fo:block>  
                    <fo:block>
                        <fo:leader leader-pattern="rule" leader-length.optimum="100%" rule-thickness="1pt"/>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center" font-size="8pt" font-family="times">
                        <fo:page-number/>
                    </fo:block>  
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">                    
                    <xsl:call-template name="genTOC"/>
                    <xsl:apply-templates select='//section[div[@class="page-header"]]'/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    
    <xsl:template name="genFirstPage">
        <fo:block-container break-before='page'>
            <fo:block/>
            <fo:block text-align="center" margin-top="100pt">             
                <fo:external-graphic src="{$basePath}/img/fra2015logo.jpg" width="280pt" height="102pt" content-width="scale-to-fit" content-height="scale-to-fit"/>       
            </fo:block>
            <fo:block text-align="center" font-size="30pt" font-weight="bold" margin-top="150pt"> 
                <xsl:value-of select='//title' />
            </fo:block>
            <fo:block text-align="center" margin-top="100pt"> 
                <fo:external-graphic src="{$basePath}/img/faologo.png" width="50pt" height="50pt" content-width="scale-to-fit" content-height="scale-to-fit"/>
            </fo:block>
            <fo:block text-align="center" font-size="24pt" font-weight="bold"> 
                Forestry Department
            </fo:block>
            <fo:block text-align="center" font-size="16pt">
                Food and Agriculture Organization of the United Nations
            </fo:block>       
        </fo:block-container>
    </xsl:template>
    
    <xsl:template name="genSecondPage">
        <fo:block-container break-before='page'>
            <fo:block/>
            <fo:block text-align="center" margin-top="20pt">             
                <fo:external-graphic src="{$basePath}/img/faologo.png" width="40pt" height="40pt" content-width="scale-to-fit" content-height="scale-to-fit"/>       
            </fo:block>
            <fo:block text-align="center" font-weight="bold" margin-top="20pt"> 
                The Forest Resources Assessment Programme
            </fo:block>
            <fo:block text-align="justify" margin-top="20pt"> 
                Sustainably managed forests provide essential goods and services and thus play a vital part in sustainable development. Reliable and up-to-date information on the state of forest resources is crucial to support decision-making for investment and policy making in forestry and sustainable development. 
            </fo:block>
            <fo:block text-align="justify" margin-top="20pt"> 
                FAO, at the request of its member countries, regularly monitors the world’s forests and their management and uses through the Forest Resources Assessment Programme. This country report forms part of the Global Forest Resources Assessment 2015 (FRA 2015).  More information on the FRA 2015 process, publications and online database of results is available on the FRA web site (www.fao.org/forestry/fra ). 
            </fo:block>
            <fo:block text-align="justify" margin-top="20pt"> 
               The Global Forest Resources Assessment process is coordinated by the Forestry Department at FAO headquarters in Rome. The contact person for matters related to FRA 2015 is:            </fo:block>
            <fo:block  margin-top="20pt">
                Kenneth MacDicken
            </fo:block>    
            <fo:block>
                Senior Forestry Officer
            </fo:block>   
            <fo:block>
               Global Forest Assessment and Reporting
            </fo:block>   
            <fo:block>
               FAO Forestry Department
            </fo:block>   
            <fo:block>
              Viale delle Terme di Caracalla
            </fo:block>   
            <fo:block>
              Rome 00153, Italy 
            </fo:block>  
            <fo:block margin-top="20pt">
              E-mail: Kenneth.MacDicken@fao.org
            </fo:block> 
            <fo:block margin-top="20pt">
              Readers can also use the following e-mail address: fra@fao.org
            </fo:block> 
            <fo:block-container border="1pt solid black" margin-top="20pt" padding-start="10pt" padding-end="10pt" padding-before="10pt" padding-after="10pt">
               <fo:block text-align="center" font-weight="bold">
                  DISCLAIMER
               </fo:block>
	             <fo:block text-align="justify" margin-top="20pt">
	                The designations employed and the presentation of material in this information product do not imply the expression of any opinion whatsoever on the part of the Food and Agriculture Organization of the United Nations concerning the legal status of any country, territory, city or area or of its authorities, or concerning the delimitation of its frontiers or boundaries. 
	             </fo:block>   
	             <fo:block text-align="justify" margin-top="20pt" >
                  The Global Forest Resources Assessment Country Report Series is designed to document and make available the information forming the basis for the FRA reports. The Country Reports have been compiled by officially nominated national correspondents in collaboration with FAO staff. Prior to finalisation, these reports were subject to review and revision by forestry authorities in the respective countries.
              </fo:block> 
            </fo:block-container>
        </fo:block-container>
    </xsl:template>
        
    <xsl:template name="genTOC">
        <fo:block break-before='page'>
            <fo:block font-size="12pt" font-weight="bold">TABLE OF CONTENTS</fo:block>
            <xsl:for-each select='//div[@class="page-header"]'>
                <fo:block font-size="10pt" text-align-last="justify">
                    <fo:basic-link internal-destination="{generate-id(.)}">
                        <!--
                        <xsl:value-of select='count(preceding::*/section) + 1' />
                        <xsl:text> </xsl:text>
                        -->
                        <xsl:value-of select='h1' />
                        <fo:leader leader-pattern="dots" />
                        <fo:page-number-citation ref-id="{generate-id(.)}" />
                    </fo:basic-link>
                </fo:block>
            </xsl:for-each>
        </fo:block>
    </xsl:template>
    
    <xsl:template match='//section[div[@class="page-header"]]'>
        <fo:block break-before="page" text-align="start" font-size="10pt" font-family="times"  id='{generate-id(div[@class="page-header"])}'>            
            <xsl:apply-templates />
        </fo:block>
    </xsl:template>
    
   
    <xsl:template match='div[@class="page-header"]/h1'>
        <fo:block text-align="start" font-size="14pt" font-weight="bold">
            <xsl:value-of select='normalize-space(.)'/>
        </fo:block>
    </xsl:template>
    
    <!--
    <xsl:template match='section/p[@class="lead"]'>
        <fo:block text-align="start" font-size="12pt">
            <xsl:value-of select='normalize-space(.)'/>
        </fo:block>
    </xsl:template>
    -->
    
    <xsl:template match='section/h2'>
        <fo:block text-align="start" font-size="12pt" font-weight="bold"  margin-top="10pt">
            <xsl:value-of select='normalize-space(.)'/>
        </fo:block>
    </xsl:template>

    <xsl:template match='section/div/h4'>
        <fo:block text-align="start" font-size="12pt">
            <xsl:value-of select='normalize-space(.)'/>
        </fo:block>
    </xsl:template>

    
    <xsl:template match='div[@class="entry"]/div/text()'>
        <fo:block text-align="justify" border="1pt solid black" background-color="ghostwhite" margin-top="10pt" margin-bottom="10pt">
            <fo:block space-before="5pt" start-indent="5pt"
                space-after="5pt" end-indent="5pt">
           <xsl:value-of select='normalize-space(.)'/>
            </fo:block>
        </fo:block>
    </xsl:template>
    
    
    <xsl:template match="table">
        <fo:table table-layout="fixed" width="100%" border-collapse="collapse" border-spacing="2px" border="1px solid black" margin-bottom="10pt" keep-together.within-page="always">
            <xsl:choose>
                <xsl:when test="@cols">
                    <xsl:call-template name="build-columns">
                        <xsl:with-param name="cols" 
                            select="concat(@cols, ' ')"/>
                    </xsl:call-template>
                </xsl:when>
            </xsl:choose>
            <fo:table-body>
                <xsl:apply-templates select="*"/>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    <xsl:template match="tr">
        <fo:table-row>
            <xsl:apply-templates select="td | text()"/>
        </fo:table-row>
    </xsl:template>
    
    <xsl:template match="th | td[@rownumber='0'] | td[ancestor::tr[@class='defhead']]">
        <fo:table-cell
            min-height="20pt"
            padding-start="3pt" padding-end="3pt"
            padding-before="3pt" padding-after="3pt"
            border="1px solid black"
            text-align="center"
            background-color="LightGreen"
            display-align="center">
            <xsl:if test="@colspan">
                <xsl:attribute name="number-columns-spanned">
                    <xsl:value-of select="@colspan"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@rowspan">
                <xsl:attribute name="number-rows-spanned">
                    <xsl:value-of select="@rowspan"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@border='1' or 
                ancestor::tr[@border='1'] or
                ancestor::table[@border='1']">
                <xsl:attribute name="border-style">
                    <xsl:text>solid</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="border-color">
                    <xsl:text>black</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="border-width">
                    <xsl:text>1pt</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <fo:block font-weight="bold" text-align="center">
                <xsl:apply-templates select="*|text()"/>
            </fo:block>
        </fo:table-cell>
    </xsl:template>
    
    <xsl:template match="td">
        <fo:table-cell 
            min-height="20pt"
            padding-start="3pt" padding-end="3pt"
            padding-before="3pt" padding-after="3pt"
            border="1px solid black">
            <xsl:if test="img">
                <xsl:attribute name="display-align">center</xsl:attribute>
            </xsl:if>
            <xsl:if test="@colspan">
                <xsl:attribute name="number-columns-spanned">
                    <xsl:value-of select="@colspan"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@rowspan">
                <xsl:attribute name="number-rows-spanned">
                    <xsl:value-of select="@rowspan"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@border='1' or 
                ancestor::tr[@border='1'] or
                ancestor::thead[@border='1'] or
                ancestor::table[@border='1']">
                <xsl:attribute name="border-style">
                    <xsl:text>solid</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="border-color">
                    <xsl:text>black</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="border-width">
                    <xsl:text>1pt</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:variable name="align">
                <xsl:choose>
                    <xsl:when test="@align">
                        <xsl:choose>
                            <xsl:when test="@align='center'">
                                <xsl:text>center</xsl:text>
                            </xsl:when>
                            <xsl:when test="@align='right'">
                                <xsl:text>end</xsl:text>
                            </xsl:when>
                            <xsl:when test="@align='justify'">
                                <xsl:text>justify</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>start</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="ancestor::tr[@align]">
                        <xsl:choose>
                            <xsl:when test="ancestor::tr/@align='center'">
                                <xsl:text>center</xsl:text>
                            </xsl:when>
                            <xsl:when test="ancestor::tr/@align='right'">
                                <xsl:text>end</xsl:text>
                            </xsl:when>
                            <xsl:when test="ancestor::tr/@align='justify'">
                                <xsl:text>justify</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>start</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="ancestor::thead">
                        <xsl:text>center</xsl:text>
                    </xsl:when>
                    <xsl:when test="ancestor::table[@align]">
                        <xsl:choose>
                            <xsl:when test="ancestor::table/@align='center'">
                                <xsl:text>center</xsl:text>
                            </xsl:when>
                            <xsl:when test="ancestor::table/@align='right'">
                                <xsl:text>end</xsl:text>
                            </xsl:when>
                            <xsl:when test="ancestor::table/@align='justify'">
                                <xsl:text>justify</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>start</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>start</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <fo:block text-align="{$align}">
                <xsl:apply-templates select="*|text()"/>
            </fo:block>
        </fo:table-cell>
    </xsl:template>
    
    <xsl:template name="build-columns">
        <xsl:param name="cols"/>
        
        <xsl:if test="string-length(normalize-space($cols))">
            <xsl:variable name="next-col">
                <xsl:value-of select="substring-before($cols, ' ')"/>
            </xsl:variable>
            <xsl:variable name="remaining-cols">
                <xsl:value-of select="substring-after($cols, ' ')"/>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="contains($next-col, 'pt')">
                    <fo:table-column column-width="{$next-col}"/>
                </xsl:when>
                <xsl:when test="number($next-col) > 0">
                    <fo:table-column column-width="{concat($next-col, 'pt')}"/>
                </xsl:when>
                <xsl:otherwise>
                    <fo:table-column column-width="proportional-column-width(1)"/>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:call-template name="build-columns">
                <xsl:with-param name="cols" select="concat($remaining-cols, ' ')"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="img">
        <fo:block space-after="12pt" text-align="center">
            <fo:external-graphic src="{@src}">
                <xsl:if test="@width">
                    <xsl:attribute name="width">
                        <xsl:choose>
                            <xsl:when test="contains(@width, 'px')">
                                <xsl:value-of select="@width"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat(@width, 'px')"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </xsl:if>
                <xsl:if test="@height">
                    <xsl:attribute name="height">
                        <xsl:choose>
                            <xsl:when test="contains(@height, 'px')">
                                <xsl:value-of select="@height"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat(@height, 'px')"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </xsl:if>
            </fo:external-graphic>
        </fo:block>
    </xsl:template>
  
    <xsl:template match="i">
		  <fo:inline font-style="italic">
		    <xsl:apply-templates select="*|text()"/>
		  </fo:inline>
    </xsl:template>
    
    <xsl:template match="sup">
		  <fo:inline vertical-align="super"
		        font-size="75%">
		    <xsl:apply-templates select="*|text()"/>
		  </fo:inline>
		</xsl:template>
		
		<xsl:template match="b">
		  <fo:inline font-weight="bold">
		    <xsl:apply-templates select="*|text()"/>
		  </fo:inline>
		</xsl:template>
		
		<xsl:template match="br">
		  <fo:block> </fo:block>
		</xsl:template>
		
		<xsl:template match="p">
		  <fo:block font-size="12pt" line-height="15pt"
		    space-after="12pt">
		    <xsl:apply-templates select="*|text()"/>
		  </fo:block>
		</xsl:template>
    <!-- suppress default with this template
    <xsl:template match="text()"/>
     -->
      <xsl:template match="//td/text() | //th/text() | //div[@id='cell-content']">
        <xsl:value-of select="replace(., '\{\{.*\}\}', '')" />
      </xsl:template>
</xsl:stylesheet>