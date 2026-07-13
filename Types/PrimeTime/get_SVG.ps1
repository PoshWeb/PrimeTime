<#
.SYNOPSIS
    Gets a PrimeTime in SVG
.DESCRIPTION
    Gets a PrimeTime in an SVG `<animate>` element.
#>
param()
"<animate dur='$($this.Prime)s' />" -as [xml]