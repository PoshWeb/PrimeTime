#requires -Module PSDevOps
Import-BuildStep -SourcePath (
    Join-Path $PSScriptRoot 'GitHub'
) -BuildSystem GitHubWorkflow

Push-Location ($PSScriptRoot | Split-Path)

New-GitHubWorkflow -Name "Build PrimeTime" -On Push, PullRequest, Demand -Job TestPowerShellOnLinux, 
    TagReleaseAndPublish,
    BuildPrimeTime -OutputPath .\.github\workflows\BuildPrimetime.yml

Pop-Location
