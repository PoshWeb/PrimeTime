filter Get-Prime {
    <#
    .SYNOPSIS
        Gets Primes
    .DESCRIPTION
        Calculate primes reasonably quickly with the Sieve of Eratosthenes

        Pipe in any positive whole number to see if it is prime
    .LINK
        https://MrPowerShell.com/Tricks/The-Power-Of-Primes/
    #>
    [Alias('prime')]
    param()
    if ($args) {
        $args | . $MyInvocation.MyCommand
        return
    }
    $in = $_
    $in = $in -as [long]
    if (-not $in) { return }
    if ($in -eq 1) { return $in }
    if ($in -lt 1) { return}    
    if (-not $script:PrimeSieve.Count) {
        $script:PrimeSieve = [Collections.Generic.Dictionary[long, bool]]::new()
        $script:PrimeSieve[2] = $true
        if ($in -gt 2) {
            $null = 2..(($in / 2) -as [long[]]) | 
                . $MyInvocation.MyCommand
        }        
    }

    if ($script:PrimeSieve.ContainsKey($in)) { return $in }
    foreach ($n in $script:PrimeSieve.Keys) {
        if (($n * 2) -gt $in) { break }
        if (-not ($in % $n)) { return }
    }
    $script:PrimeSieve[$in] = $true
    $in
}
