<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="//cv/me/@name"/></title>
                <link rel="stylesheet" type="text/css" href="cv.css" />
            </head>
            <body>
                <div id="container">
                    <div id="me">
                        <h1><xsl:value-of select="//cv/me/@subject"/></h1>
                        <ul id="contactdetails">
                            <li>Address: <xsl:value-of select="//cv/me/@address"/></li>
                            <li>Mobile: <xsl:value-of select="//cv/me/@mobile"/></li>
                            <li>Email: <xsl:value-of select="//cv/me/@email"/></li>
                            <li>Nationality: <xsl:value-of select="//cv/me/@nationality"/></li>
                            <li>Religion: <xsl:value-of select="//cv/me/@religion"/></li>
                            <li>Maritial status: <xsl:value-of select="//cv/me/@maritial"/></li>
                            <li>Gender: <xsl:value-of select="//cv/me/@gender"/></li>
                        </ul>
                    </div>
                    <div id="content">
                        <div id="statement">
                                <p><xsl:copy-of select="//cv/me/attributes[1]"/></p>
                                <p><xsl:copy-of select="//cv/me/attributes[2]"/></p>
                                <p><xsl:copy-of select="//cv/me/attributes[3]"/></p>

                        </div>
                        <div id="sxscontainer">
                            <div id="education">
                                <h2>Education</h2>
                                <xsl:call-template name="showEducation"/>
                            </div>
                            <div id="employment">
                                <h2>Employment</h2>
                                <h4>Compnay name: <xsl:value-of select="//cv/employment/experience/@establishment"/> (Internship) </h4>
                                <ul>
                                    <li><xsl:value-of select="//cv/employment/experience/achievement[1]"/> </li>
                                    <li><xsl:value-of select="//cv/employment/experience/achievement[2]"/> </li>
                                    <li><xsl:value-of select="//cv/employment/experience/achievement[3]"/> </li>
                                    <li><xsl:value-of select="//cv/employment/experience/achievement[4]"/> </li>
                                </ul>
                            </div>
                        </div>
                        <div class="page-break"/>
                
                        <div id="references">
                            <h2>References</h2>
                            <xsl:call-template name="showReferences"/>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>


    <xsl:template name="showEducation">
        <h3 class="qualtype"><xsl:value-of select="//cv/education/qualification"/></h3>
        <div >
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


    <xsl:template name="showReferences">
        <xsl:choose>
            <xsl:when test="not(//cv/references)"><p>References are available</p></xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="//cv/references/contact">
                    <div class="contact">
                        <h3><xsl:value-of select="."/></h3>
                        <ul>
                            <li><xsl:value-of select="@relationship"/></li>
                            <li><xsl:value-of select="@email"/></li>
                            <li><xsl:value-of select="@telephone"/></li>
                        </ul>
                    </div>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>