<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="utf-8" indent="yes"  />  
  <xsl:strip-space elements="*"/> 

	<xsl:template match="/">
		<html>
		  <head>
		  <xsl:copy-of select="//title" />
			<xsl:copy-of select="//meta" />
			</head>
			<body>
				<!-- <xsl:apply-templates select='//body/div' /> -->
				<xsl:apply-templates
					select='//section[ div[@class="page-header"] and descendant::img[contains(@src,"CFRQ")]]' />
			</body>
		</html>
	</xsl:template>

	<xsl:template
		match='//section[ div[@class="page-header"] and ../descendant::img[contains(@src,"CFRQ")]]'>
		<section>
			<xsl:apply-templates />
		</section>
	</xsl:template>

	<xsl:template
		match='div[@class="page-header" and ../descendant::img[contains(@src,"CFRQ")]]'>
		<xsl:copy-of select="." />
	</xsl:template>

	<xsl:template match='div[@class="entry"] ' />
	<xsl:template match='div[@class="entry"][descendant::img[contains(@src,"CFRQ")]]'>
		<xsl:copy-of select="." />
	</xsl:template>

	<xsl:template match='h1' />
	<xsl:template match='h2' />
	<xsl:template match='h3' />
	<xsl:template match='h4' />
	<xsl:template match='p' />

	<xsl:template
		match='h1[ancestor::section[descendant::img[contains(@src,"CFRQ")]]]'>
		<xsl:copy-of select="." />
	</xsl:template>

	<xsl:template match='h2[../descendant::img[contains(@src,"CFRQ")]]'>
		<xsl:copy-of select="." />
	</xsl:template>

	<xsl:template match='h3[../../descendant::img[contains(@src,"CFRQ")]]'>
		<xsl:copy-of select="." />
	</xsl:template>

	<xsl:template match='h4[../descendant::img[contains(@src,"CFRQ")]]'>
		<xsl:copy-of select="." />
	</xsl:template>

	<xsl:template match='p[../descendant::img[contains(@src,"CFRQ")]]'>
		<xsl:copy-of select="." />
	</xsl:template>

	<xsl:template match="table" />

	<xsl:template match='//body/div[1]'>
		<xsl:copy-of select="." />
	</xsl:template>

</xsl:stylesheet>