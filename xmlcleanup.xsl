<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:gco="http://www.isotc211.org/2005/gco"
      >

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match ="gco:*">
    <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>
