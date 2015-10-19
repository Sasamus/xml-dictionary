<?xml version="1.0" encoding="UTF-8"?>

<!-- The root elelment and namespace -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- A template -->
  <xsl:template match="/">

    <!-- Set variables with the file names -->
    <xsl:variable name="File1" select="/Dictionary/Language1" />
    <xsl:variable name="File2" select="/Dictionary/Language2" />

    <!-- Create variables with the languages -->
    <xsl:variable name="Language1"
      select="document($File1)/Dictionary/Language" />
    <xsl:variable name="Language2"
      select="document($File2)/Dictionary/Language" />

    <!-- The html tag -->
    <html>

      <head>
        <!-- Link the stylesheet -->
        <link rel="stylesheet" type="text/css" href="StyleXhtml.css" />

        <!-- The page title -->
        <title>
          <xsl:value-of select="$Language1"/>
          -
          <xsl:value-of select="$Language2"/>
          Dictionary
        </title>
      </head>

      <!-- The body tag -->
      <body>

        <!-- The logo -->
        <p>
          <img src="Logo.svg" height="220" width="400" alt="Open Book"/>
        </p>

        <!-- Show the languages -->
        <p class="Language">
          <xsl:value-of select="$Language1"/>
          -
          <xsl:value-of select="$Language2"/>
          Dictionary
        </p>



      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
