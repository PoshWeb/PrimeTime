<#
.SYNOPSIS
    Gets a PrimeTime timer
.DESCRIPTION
    Gets a PrimeTime timer
    
    This returns a `[Timers.Timer]` for this interval
.LINK
    Register-ObjectEvent
#>
$timer = [Timers.Timer]::new()
$timer.Interval = $this.Prime * 1000
$timer