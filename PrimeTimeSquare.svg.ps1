$primeTimes = @(1..64 | Get-PrimeTime)
$primes = $primeTimes.prime
$Sequence = $primes


"<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 200 200' width='100%' height='100%'>"
$animationLoop = "repeatCount='indefinite'"
foreach ($n in 63..7) {
    $prime = $primeTimes[$n].prime
    $oppositeDur = $primeTimes[70 - $n]

    $percent = [Math]::Round(
        $prime / $primeTimes[-1].Prime, 4
    ) * 100
    "<svg xmlns='http://www.w3.org/2000/svg' class='background' opacity='0.1' width='100%' height='100%'>"    
        "<rect fill='transparent' stroke='currentColor'>"
            "<animate attributeName='width' dur='$prime' values='100%;$($percent)%;100%' $animationLoop />"
            "<animate attributeName='height' dur='$oppositeDur' values='100%;$($percent)%;100%' $animationLoop />"
        "</rect>"
    "</svg>"
}    
"</svg>"