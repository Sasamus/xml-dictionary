<?xml version="1.0" encoding="UTF-8"?>

<!-- The root elelment and namespace -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- A template -->
  <xsl:template match="/">

    <!-- Variables with the file names -->
    <xsl:variable name="File1" select="/Dictionary/Language1" />
    <xsl:variable name="File2" select="/Dictionary/Language2" />

    <!-- Variables with the languages -->
    <xsl:variable name="Language1"
      select="document($File1)/Dictionary/Language" />
    <xsl:variable name="Language2"
      select="document($File2)/Dictionary/Language" />

    <!-- Variables for the list of words -->
    <xsl:variable name="Language1Words"
      select="document($File1)/Dictionary/Words" />
    <xsl:variable name="Language2Words"
      select="document($File2)/Dictionary/Words" />

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

        <xsl:for-each select="$Language1Words/Word">

          <xsl:sort order="ascending" />

          <xsl:variable name="WordNr" select="@nr"/>

          <p>
             <xsl:value-of select="."/>
            -  
             <xsl:for-each select="$Language2Words/Word">

               <xsl:if test="@nr = $WordNr">
                 <xsl:value-of select="."/>
               </xsl:if>

             </xsl:for-each>

          </p>

        </xsl:for-each>







      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
