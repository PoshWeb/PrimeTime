<#
.SYNOPSIS
    Gets a PrimeTime as ISO standard interval
.DESCRIPTION
    Gets a PrimeTime in ISO-8601 standard interval format.
.LINK
    https://en.wikipedia.org/wiki/ISO_8601#Durations
#>
[xml.convert]::ToString($this.TimeSpan)