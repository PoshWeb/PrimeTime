<#
.SYNOPSIS
    PrimeTime logo
.DESCRIPTION
    PrimeTime logo.

    Resembles the PoshWeb logo, but uses more prime numbers
.NOTES
    
#>

param(
[string]
$Variant = '',

[int]
$First
)

$psChevron = '<symbol id="psChevron" viewBox="0 0 100 100">
    <polygon points="40,20 45,20 60,50 35,80 32.5,80 55,50"/>
</symbol>'

$stroke = @(
    "stroke='#4488ff'"
    "class='foreground-stroke'"
    "stroke-width='0.5%'"
)
$transparentFill = "fill='transparent'"
$animationLoop = "repeatCount='indefinite'"
    $centered = "cx='50%'", "cy='50%'"

$primeTimes = 4..12 | Get-PrimeTime
$primes = $primeTimes.prime
$Sequence = $primes
"<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 200 200' width='100%' height='100%'>"
    $psChevron
    for ($index = 0; $index -lt ($sequence.Length - 1); $index++) {
        $n = 50
        $duration = "dur='$($primes[$primes.Length - 1 - $index])s'"
        if (-not $index) {
            "<circle $centered $transparentFill $stroke r='$n%' />"
        }
        else {
            if ($variant -match 'animate') {
                $values = " values='$(                                
                    "$n%", "5%", "$n%" -join ';'
                )'"
            }
            $opacity = 1 - (.07 * $index)
                        
            "<ellipse $centered $transparentFill $stroke $(
                if ($Variant -match 'animate') {
                    "rx='$n%' ry='$n%'"
                } else {
                    "rx='$($sequence[$index])%' ry='$n%'"
                }
            ) opacity='$opacity'>"
            if ($variant -match 'animate') {                
                "<animate attributeName='rx' $animationLoop $duration $values />"
                "<animate attributeName='opacity' $animationLoop $duration values='$(
                    $opacity,($opacity/2),$opacity -join ';'
                )' />"
            }
            "</ellipse>"
            "<ellipse $centered $transparentFill $stroke $(
                if ($Variant -match 'animate') {
                    "rx='$n%' ry='$n%'"
                } else {
                    "rx='$n%' ry='$($sequence[$index])%'"
                }
            ) opacity='$opacity'>"
            if ($variant -match 'animate') {
                "<animate attributeName='ry' $animationLoop $duration $values />"
            }
            if ($variant -match 'animate') {
                "<animate attributeName='opacity' $animationLoop $duration values='$(
                    $opacity,($opacity/2),$opacity -join ';'
                )' />"
            }
            "</ellipse>"
        }
        if ($First -and ($index + 1) -gt $First) {
            break
        }
    }    
    "<use href='#psChevron' y='42%' height='16%' fill='#4488ff' class='foreground-fill' />"
"</svg>"
