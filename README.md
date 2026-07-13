# PrimeTime
[![PrimeTime](https://img.shields.io/powershellgallery/dt/PrimeTime)](https://www.powershellgallery.com/packages/PrimeTime/)
## The Power of Primes
### About PrimeTime

PrimeTime is a simple timing toolkit based around the power of primes

PrimeTime defines prime intervals

Primes rarely overlap

This helps animation feel alive

### Using PrimeTime

To use PrimeTime, we can just include the .css

```html
<link rel='stylesheet' href='https://PrimeTime.PoshWeb.org/PrimeTime.css' />
```

### PrimeTime Demos

The PrimeTime logo uses eight primes (`7`,`9`, `11`,`13`, `17`, `19`, `23`, `29`,`31`)

This will repeat every `6685349671` seconds, or _almost 212 years_.

The PrimeTime page background uses 56 primes.

This will repeat every `8.84753141993573E+116` seconds.

That's exponential notation.  This is a mind-boggling large number (so large it overflows the .NET `[TimeSpan]`).

Turn that interval into years and it's _still_ mind-boggling.

**This Animation Will Repeat every 100 Billion Years**
        

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

> © 2026 Start-Automating

> [LICENSE](https://github.com/PoshWeb/PrimeTime/blob/main/LICENSE)