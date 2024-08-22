#!/bin/bash

# Usage: ./hdhr_get_m3u.sh <ipaddress> [outfile]

# Check if the IP address is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <ipaddress> [outfile]"
  exit 1
fi

IPADDRESS=$1
OUTFILE=$2

# Define the XSLT transformation
XSLT='<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/">
    <xsl:text>#EXTM3U&#10;</xsl:text>
    <xsl:apply-templates select="Lineup/Program"/>
  </xsl:template>
  <xsl:template match="Program">
    <xsl:text>#EXTINF:-1 tvg-id="</xsl:text>
    <xsl:value-of select="GuideNumber"/>
    <xsl:text>" tvg-chno="</xsl:text>
    <xsl:value-of select="GuideNumber"/>
    <xsl:text>" tvg-name="</xsl:text>
    <xsl:value-of select="GuideName"/>
    <xsl:text>" group-title="</xsl:text>
    <xsl:choose>
      <xsl:when test="Favorite='1'">
        <xsl:text>Favorites</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>Other</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>" tvg-type="live",</xsl:text>
    <xsl:value-of select="GuideName"/>
    <xsl:text>&#10;</xsl:text>
    <xsl:value-of select="URL"/>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>
</xsl:stylesheet>'

# Fetch the lineup XML from the HDHomeRun tuner
LINEUP_XML=$(curl -s "http://$IPADDRESS/lineup.xml")

# Transform the XML to M3U using the XSLT
M3U_CONTENT=$(echo "$LINEUP_XML" | xsltproc <(echo "$XSLT") -)

# Output the M3U content
if [ -z "$OUTFILE" ]; then
  echo "$M3U_CONTENT"
else
  echo "$M3U_CONTENT" > "$OUTFILE"
fi