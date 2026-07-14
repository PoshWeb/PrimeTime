<#
.SYNOPSIS
    README.md.ps1
.DESCRIPTION
    README.md.ps1 makes README.md

    This is a simple and helpful scripting convention for writing READMEs.

    `./README.md.ps1 > ./README.md`

    Feel free to copy and paste this code.
    
    Please document your parameters, and add NOTES.
.NOTES        
    This README.md.ps1 is used to generate help for a module.

    It:

    * Outputs the name and description
    * Provides installation instructions    
.EXAMPLE
    ./README.md.ps1 > ./README.md
.EXAMPLE
    Get-Help ./README.md.ps1
#>
param(
# The name of the module     
[string]$ModuleName = $($PSScriptRoot | Split-Path -Leaf),

# The domains that serve git repositories.
# If the project uri links to this domain, 
# installation instructions will show how to import the module locally.
[string[]]
$GitDomains = @(
    'github.com', 'tangled.org', 'tangled.sh', 'codeberg.org'
),

[switch]
$NoLogo,

# If set, will not display gallery instructions or badges
[switch]
$NotOnGallery
)

Push-Location $PSScriptRoot

# Import the module
$module = Import-Module "./$ModuleName.psd1" -PassThru

$logoFiles = Get-ChildItem -Path "$($module)*.svg"
$logoImage = if (-not $NoLogo) {
    if ($logoFiles -match '-animate') {
        @($logoFiles -match '-animate')[0]
    } else {
        @($logoFiles)[0]
    }
}
if ($logoImage) {
"
<div align='center'>
<img src='$($LogoImage.Name)' style='height:400px' />
</div>
"
}


        

# And output a header
"# $module"
# Show the module description
"## $($module.Description)"

# Show any intro section defined in the manifest
$module.PrivateData.PSData.PSIntro

#region Boilerplate installation instructions
if (-not $NotOnGallery) {
@"

## Installing and Importing

You can install $ModuleName from the [PowerShell gallery](https://powershellgallery.com/)

~~~PowerShell
Install-Module $($ModuleName) -Scope CurrentUser -Force
~~~

Once installed, you can import the module with:

~~~PowerShell
Import-Module $ModuleName -PassThru
~~~

"@
}
#endregion Gallery installation instructions

#region Git installation instructions
$projectUri = $module.PrivateData.PSData.ProjectURI -as [uri]

if ($projectUri.DnsSafeHost -in $GitDomains) {
@"

You can also clone the repo and import the module locally:

~~~PowerShell
git clone $projectUri
cd ./$ModuleName
Import-Module ./ -PassThru
~~~

"@
}
#endregion Git installation instructions
Pop-Location