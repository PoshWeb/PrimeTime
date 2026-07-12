<#
.SYNOPSIS
    Stringifies a interval
.DESCRIPTION
    Stringifies an interval.
    
    By default, this outputs a CSS duration.

    If the names of any properties are passed in, they will be output instead.

    Multiple properties will be joined with a newline
#>
if ($args) {
    return @(foreach ($arg in $args) {
        $thisArg = $this.$arg
        if ($thisArg -is [string]) {
            $thisArg
        } elseif ($thisArg -is [xml]) {
            $thisArg.OuterXml
        } elseif ($thisArg) {
            $thisArg -as [string]
        }
    }) -join [Environment]::NewLine
} else {
    return $this.CSS
}
