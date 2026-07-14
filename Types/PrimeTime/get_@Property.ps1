<#
.SYNOPSIS
    Gets a PrimeTime as a @property
.DESCRIPTION
    Gets a prime as a CSS property declaration.

    The property will be a number for maximum flexibility.
#>
param()
"@property --prime-$($this.Nth) {syntax: '<number>'; inherits: true; initial-value: $($this.Prime) }"