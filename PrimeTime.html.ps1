param(
[string]$AnalyticsId = $env:analyticsid
)
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
"<section class='primetime-demo'>"
foreach ($n in 1..64) {
    $prime = $primeTimes[$n].Prime    
    "<article class='number primetime-$n'>
        <button>
            $($primeTimes[$n - 1].TimeSpan.TotalSeconds)s
        </button>
    </article>"
}
"</section>"
"</body>"
"</html>"