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

			<!-- The head tag -->
			<head>

				<!-- Link the stylesheet -->
				<link rel="stylesheet" type="text/css" href="DictionaryStyle.css" />

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

				<!-- The first table -->
				<table>

					<!-- Show what language are in what column -->
					<th>
						<xsl:value-of select="$Language1"/>
					</th>
					<th>
						<xsl:value-of select="$Language2"/>
					</th>

					<!-- Iterate throught the words -->
					<xsl:for-each select="$Language1Words/Word">

						<!-- Sort the words alphabetically, A is the "smallest" letter -->
						<xsl:sort order="ascending" />

						<!-- Variable holding the number of the current word -->
						<xsl:variable name="WordNr" select="@nr"/>

						<!-- A table row -->
						<tr>

							<!-- The leftmost word -->
							<td class="Left">

								<!-- The value of the current Word element -->
								<xsl:value-of select="."/>

							</td>

							<!-- The rightmost word -->
							<td class="Right">

								<!-- Iterate through the other words -->
								<xsl:for-each select="$Language2Words/Word">

									<!-- Check if the current Word nr matches with the word
								 		it should be paired with-->
									<xsl:if test="@nr = $WordNr">

										<!-- If there's a match, The value of that Word element -->
										<xsl:value-of select="."/>

									</xsl:if>

								</xsl:for-each>

							</td>
						</tr>
					</xsl:for-each>
				</table>

				<!-- Some extra space -->
				<br/>

				<!-- The second table -->
				<table>

					<!-- Show what language are in what column -->
					<th>
						<xsl:value-of select="$Language2"/>
					</th>
					<th>
						<xsl:value-of select="$Language1"/>
					</th>

					<!-- Iterate throught the words -->
					<xsl:for-each select="$Language2Words/Word">

						<!-- Sort the words alphabetically, A is the "smallest" letter -->
						<xsl:sort order="ascending" />

						<!-- Variable holding the number of the current word -->
						<xsl:variable name="WordNr" select="@nr"/>

						<!-- A table row -->
						<tr>

							<!-- The leftmost word -->
							<td class="Left">

								<!-- The value of the current Word element -->
								<xsl:value-of select="."/>

							</td>

							<!-- The rightmost word -->
							<td class="Right">

								<!-- Iterate through the other words -->
								<xsl:for-each select="$Language1Words/Word">

									<!-- Check if the current Word nr matches with the word
								 		it should be paired with-->
									<xsl:if test="@nr = $WordNr">

										<!-- If there's a match, The value of that Word element -->
										<xsl:value-of select="."/>

									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
