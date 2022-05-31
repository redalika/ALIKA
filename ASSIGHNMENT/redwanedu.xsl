<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="showEducation">
        <h3 class="qualtype"><xsl:value-of select="//cv/education/qualification"/></h3>
        <div>
        <table border="1" class="education">
            <thead>
                <tr>
                    <th>Degree Name: </th>
                    <th>Degree type:</th>
                    <th>Result: </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><xsl:value-of select="//cv/education/qualification[1]/@establishment"/></td>
                    <td><xsl:value-of select="//cv/education/qualification[1]/@type"/></td>
                    <td><xsl:value-of select="//cv/education/qualification[1]/@details"/></td>
                </tr>
                <tr>
                    <td><xsl:value-of select="//cv/education/qualification[2]/@establishment"/></td>
                    <td><xsl:value-of select="//cv/education/qualification[2]/@type"/></td>
                    <td><xsl:value-of select="//cv/education/qualification[2]/@details"/></td>
                </tr>
                <tr>
                    <td><xsl:value-of select="//cv/education/qualification[3]/@establishment"/></td>
                    <td><xsl:value-of select="//cv/education/qualification[3]/@type"/></td>
                    <td><xsl:value-of select="//cv/education/qualification[3]/@details"/></td>
                </tr>
                <tr>
                    <td><xsl:value-of select="//cv/education/qualification[4]/@establishment"/></td>
                    <td><xsl:value-of select="//cv/education/qualification[4]/@type"/></td>
                    <td><xsl:value-of select="//cv/education/qualification[4]/@details"/></td>
                </tr>
            </tbody>
        </table>
        </div>
    </xsl:template>

</xsl:stylesheet>