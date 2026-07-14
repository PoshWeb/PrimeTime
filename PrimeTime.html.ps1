param(
[string]$AnalyticsId = $env:analyticsid,

[string]
$PaletteName = 'AdventureTime'
)




Set-Alias /_includes/Palette ./_includes/Palette.ps1
Set-Alias /_includes/FeatherIcon ./_includes/FeatherIcon.ps1

"<html>"
    "<head>"    
    if ($AnalyticsId) {
        "<!-- Google tag (gtag.js) -->
        <script async src='https://www.googletagmanager.com/gtag/js?id=$($AnalyticsID)'></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag(){dataLayer.push(arguments);}
            gtag('js', new Date());
            gtag('config', '$($AnalyticsID)');
        </script>"
    }
        "<meta name='viewport' content='width=device-width, initial-scale=1, minimum-scale=1.0' />"
    if ($PaletteName) { 
        "<link rel='stylesheet' href='https://cdn.jsdelivr.net/gh/2bitdesigns/4bitcss@latest/css/$PaletteName.css' id='palette' />"
    }
    "<style>"

        "body {"
            @(
                "max-width: 100vw"
                "height: 100vh"
            ) -join ';'
        "}"

        "@keyframes left-to-right { from { translate: 10% 0 } to { translate: 90% 0 } }"
        "@keyframes fade-in { from { opacity:0.5 } to { opacity: 1 } }"
        ".number { animation-name: left-to-right, fade-in ; animation-iteration-count: infinite; }"
        "article {
            transform-origin: 0 50%;
            width: 100%;            
        }"
        "button:hover { font-size: 2rem; transition: font-size 1s }"
        "button { font-size: 1.5rem }"
        "h1 { text-align: center }"
        "h2 { text-align: center }"
        ".primetime-markdown { margin-left: 10%; margin-right: 10%; }"
        ".primetime-demo { width: 100%; }"
        ".background {
            position: fixed;
            top: 0; left: 0;
            min-width: 100%; height:100%;
            z-index: -1024;
        }"
        $primeTimes = @(1..64 | Get-PrimeTime)
        $primeTimes.'@property'
        $primeTimes.animation
    "</style>"
"</head>"
"<body>"
    "<section>"
        "<svg xmlns='http://www.w3.org/2000/svg' class='background' width='100%' height='100%'>"
        $animationLoop = "repeatCount='indefinite'"
        $colors = 'blue', 'red', 'green', 'yellow', 'purple', 'cyan'
        $min, $max = 4, 63
        foreach ($n in $max..$min) {
            $prime = $primeTimes[$n].prime
            $oppositeDur = $primeTimes[($max + $min) - $n]
            $percent = [Math]::Round(
                $prime / $primeTimes[-1].Prime, 4
            ) * 100        
                "<rect fill='transparent' stroke='currentColor' stroke='$($colors[$n % $colors.Length])' class='ansi$(1 + ($n % 15))-stroke' stroke-width='$(1/7)%' opacity='$(1/7)'>"
                    
                    "<animate attributeName='width' dur='$prime' values='100%;$($percent)%;100%' $animationLoop />"                    
                    "<animate attributeName='height' dur='$oppositeDur' values='100%;$($percent)%;100%' $animationLoop />"
                "</rect>"        
        }
        "</svg>"
    "</section>"

    "<style>"
        ".top-grid { display: grid; grid-template-columns: 1fr 1fr; grid-template-rows: auto; }"
        ".top-left { align-self: left; }"
        ".top-right { justify-self: right; align-self: right;  display: flex; flex-direction: row}"
    "</style>"
    "<section class='top-grid'>"
        "<section class='top-left'>"
            "<a href='/'><button>$(
                /_includes/FeatherIcon -Icon home
            )</button></a>"
            "<a href='https://github.com/PoshWeb/PrimeTime/'><button>$(
                /_includes/FeatherIcon -Icon github
            )</button></a>"
        "</section>"
        "<section class='top-right'>"
            /_includes/Palette -DefaultPalette $PaletteName
        "</section>"
    "</section>"
    
    "<style>.masthead svg { height: 10% }</style>"
    "<section class='masthead'>"
        "$(./PrimeTime.svg.ps1 animated)"    
    "</section>"


    "<section class='primetime-markdown'>"
        (Get-Content "$PSScriptRoot/README.md" -Raw) -replace 
            "<div align='center'>[\s\S]+</div>" | 
            ConvertFrom-Markdown |
            Select-Object -ExpandProperty Html        
    "</section>"
    "<section class='primetime-markdown'>"
        "<h3>Demo</h3>"
        "<p>The remainder of this page is a demo</p>"
        "<p>These are the first 64 primes</p>"
        "<p>Watch how rarely they overlap</p>"
        "<p><b>This will repeat roughly every 100 trillion years</b></p>"
    "</section>"
"<section class='primetime-demo'>"
foreach ($n in 1..64) {
    $prime = $primeTimes[$n - 1].Prime    
    "<article class='number primetime-$n'>
        <button onclick=`"navigator.clipboard.writeText('$prime')`" >            
            $($primeTimes[$n - 1].Prime)
        </button>
    </article>"
}
"</section>"
"</body>"
"</html>"