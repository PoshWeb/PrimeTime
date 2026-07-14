#requires -Module PrimeTime
<#
.SYNOPSIS
    PrimeTime CSS
.DESCRIPTION
    Generates `PrimeTime.css`
#>
param(
# The Nth Primes to get.  By default, 64
[long]
$Nth = 64
)

$primeTime = 1..$Nth | Get-PrimeTime

# Output all CSS properties first
$primeTime.'@property'
# Then Output all CSS animations
$primeTime.animation