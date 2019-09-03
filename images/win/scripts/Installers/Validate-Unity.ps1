################################################################################
##  File:  Validate-Unity.ps1
##  Team:  ScopeAR
##  Desc:  Validate Unity.
################################################################################


if((Get-Command -Name 'Get-UnitySetupInstance'))
{
    Write-Host "Get-UnitySetupInstance on path"
}
else
{
     Write-Host "Start-UnityEditor is not on path"
    exit 1
}

# Adding description of the software to Markdown
$SoftwareName = "Unity"

$version = (Get-UnitySetupInstance | Select-UnitySetupInstance -Latest).Version.ToString()

$Description = @"
_Version:_ $version<br/>
"@

Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description
