Import-Module ./PrimeTime.psd1 -Force -PassThru | Out-Host

$files = @(
    # Build markdown first (since HTML may depend on it)
    Get-ChildItem -Path *.ps1 -File |
        Where-Object Name -match '\.md\.ps1$'

    Get-ChildItem -Path *.ps1 -File |
        Where-Object Name -match '\.(?>css|html|svg)\.ps1$'
)
$files |
    Foreach-Object {
        $in = $_
        $output = @(. $in.FullName)
        $command = Get-Command $in.FullName -CommandType ExternalScript
        $file = 
            New-Item -ItemType File -Value (
                $output -join [Environment]::NewLine
            ) -Force -Path (
                $in.FullName -replace '\.ps1$'
            )
        $file | Out-Host
        if ($env:GITHUB_REPOSITORY) {
            git add $file.FullName
        }
        if ($command.Parameters.Variant) {
            $output = @(. $in.FullName animated)
            $file = 
                New-Item -ItemType File -Value (
                    $output -join [Environment]::NewLine
                ) -Force -Path (
                    $in.FullName -replace '\.ps1$' -replace 
                        '\.(?<ext>[^\.]+)', '-Animated.${ext}'
                )
            $file | Out-Host
            if ($env:GITHUB_REPOSITORY) {
                git add $file.FullName
            }            
        }
        
    }

if (-not $env:GITHUB_REPOSITORY) { return }
git config user.name "StartAutomating"
git config user.email "1043665+StartAutomating@users.noreply.github.com"
git commit -m "Updating Static Content"
git push
$lastExitCode = 0  