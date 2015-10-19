<?xml version="1.0" encoding="UTF-8"?>

<!-- The root elelment and namespace -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- A template -->
  <xsl:template match="/">

    <!-- The html tag -->
    <html>

      <head>
        <!-- Link the stylesheet -->
        <link rel="stylesheet" type="text/css" href="StyleXhtml.css" />

        <!-- The page title -->
        <title><xsl:value-of select="/Dictionary/Language" /> Dictionary</title>
      </head>

      <!-- The body tag -->
      <body>

        <!-- The logo -->
        <p>
          <img src="Logo.svg" height="220" width="400" alt="Open Book"/>
        </p>

        <!-- Show the language -->
        <p class="Language">
          <xsl:value-of select="//Language"/>
        </p>

        <!-- Show the author -->
        <p class="Author">
          <xsl:value-of select="//Author"/>
        </p>

        <!-- Show the words -->
        <ol>
          <li> <xsl:value-of select="//Word[@nr = '1']"/> </li>
          <li> <xsl:value-of select="//Word[@nr = '2']"/> </li>
          <li> <xsl:value-of select="//Word[@nr = '3']"/> </li>
          <li> <xsl:value-of select="//Word[@nr = '4']"/> </li>
          <li> <xsl:value-of select="//Word[@nr = '5']"/> </li>
          <li> <xsl:value-of select="//Word[@nr = '6']"/> </li>
          <li> <xsl:value-of select="//Word[@nr = '7']"/> </li>
          <li> <xsl:value-of select="//Word[@nr = '8']"/> </li>
          <li> <xsl:value-of select="//Word[@nr = '9']"/> </li>
          <li> <xsl:value-of select="//Word[@nr = '10']"/> </li>
        </ol>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
