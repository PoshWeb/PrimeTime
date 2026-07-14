
<div align='center'>
<img src='PrimeTime-Animated.svg' style='height:400px' />
</div>

# PrimeTime
## The Power of Primes
### About PrimeTime

PrimeTime is a simple animation framework

PrimeTime uses The Power of Primes

PrimeTime defines prime intervals for animation

Primes rarely overlap

This helps animation feel alive

### PrimeTime Pages

We can use PrimeTime in any webpage

Just link to the stylesheet

```html
<link rel='stylesheet' href='https://PrimeTime.PoshWeb.org/PrimeTime.css' />
```

### PrimeTime Demos

The PrimeTime logo animates eight primes:

```PowerShell
7 * 11 * 13 * 17 * 19 * 23 * 29 * 31
```

The logo will repeat every `6685349671` seconds, or _almost 212 years_.

The [PrimeTime page](https://primetime.poshweb.org/) background uses 56 primes.

This background will repeat every `8.84753141993573E+116` seconds.

That's exponential notation.

This is a mind-boggling large number (so large it overflows the .NET `[TimeSpan]`).

Turn that interval into years and it's _still_ mind-boggling.

**The Background Will Repeat every 100 Billion Years**

## Installing and Importing

You can install PrimeTime from the [PowerShell gallery](https://powershellgallery.com/)

~~~PowerShell
Install-Module PrimeTime -Scope CurrentUser -Force
~~~

Once installed, you can import the module with:

~~~PowerShell
Import-Module PrimeTime -PassThru
~~~


You can also clone the repo and import the module locally:

~~~PowerShell
git clone https://github.com/PoshWeb/PrimeTime
cd ./PrimeTime
Import-Module ./ -PassThru
~~~
