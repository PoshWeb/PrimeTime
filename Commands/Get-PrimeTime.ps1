function Get-PrimeTime {
    <#
    .SYNOPSIS
        Gets PrimeTime intervals
    .DESCRIPTION
        Primes rarely overlap.

        This makes primes more performant and vibrant.

        We can animate with prime numbers to make pages feel alive.

        We can schedule with prime numbers to avoid traffic jams.
    .NOTES
        When using prime number intervals, overlaps are rare.

        To determine how rare, we can multiply each distinct prime.

        Let's show how quickly this adds up:
        
        |Timers|Math|Seconds|Timespan|
        |7,11   |`7*11`|77|`00:01:17`|
        |7,11,13|`7*11*13`|1001|`00:16:41`|
        |7,11,13,17|`7*11*13*17`|17017|`04:43:37`|
        |7,11,13,17,19|`7*11*13*17*19`|323323|`3.17:48:43`|
        |7,11,13,17,19,23|`7*11*13*17*19*23`|7436429|`86.01:40:29`|
        
        
    #>    
    param(
    # Gets the Nth prime number
    [Parameter(ValueFromPipeline)]
    [ValidateRange(1,1mb)]
    [Alias('N')]
    [int]
    $Nth = $(
        Get-Random -Min 4 -Max 64
    ),

    # Return the first Nth in the sequence 
    [Parameter(ValueFromPipelineByPropertyName)]
    [int]
    $First,

    # Return the last Nth in the sequence 
    [Parameter(ValueFromPipelineByPropertyName)]
    [int]
    $Last,

    # If set, will invalidate the cached list of primes
    [switch]
    $Force
    )

    begin {
        $rootPath = 
            if ($myInvocation.MyCommand.Module) {
                $myInvocation.MyCommand.Module.Path | Split-path 
            } else {
                $PSScriptRoot | Split-Path 
            }        
        if ($Force) {
            $script:ListOfPrimes = $null
        }
        if (-not $script:ListOfPrimes) {
            $primesPath = Join-Path $rootPath 'Primes'
            $biggestFile =
                Get-ChildItem -Path $primesPath -ErrorAction Ignore -Filter '*1mb*.txt' |
                    Sort-Object Length -Descending |
                    Select-Object -First 1

            $script:ListOfPrimes = ($biggestFile | Get-Content) -as [long[]]
        }        
    }

    process {
        if ($First) {
            foreach ($n in 1..$first) {
                [PSCustomObject]@{
                    PSTypeName = 'PrimeTime'
                    Nth        = $Nth
                    Prime      = $script:ListOfPrimes[$N]
                    Unit       = $unit
                }        
            }
            return
        }

        if ($last) {
            foreach ($n in 1..$last) {
                $negativeN = $n * -1
                [PSCustomObject]@{
                    PSTypeName = 'PrimeTime'
                    Nth        = $script:ListOfPrimes.Count - $n
                    Prime      = $script:ListOfPrimes[$negativeN]
                    Unit = $unit
                }        
            }
        }                

        [PSCustomObject]@{
            PSTypeName = 'PrimeTime'
            Nth        = $Nth
            Prime      = $script:ListOfPrimes[$Nth - 1]
            Unit = $unit
        }
        
    }
}
