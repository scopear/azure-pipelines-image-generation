################################################################################
##  File:  Install-Unity.ps1
##  Team:  ScopeAR
##  Desc:  Install Unity.
################################################################################

Set-PSRepository -InstallationPolicy Trusted -Name PSGallery
Write-Host "Install-Module UnitySetup"
Install-Module -Name UnitySetup -AllowPrerelease -Force

Install-UnitySetupInstance -Installers (Find-UnitySetupInstaller -Version $ENV:UNITY_VERSION -Components Windows,Linux,UWP,UWP_IL2CPP,Android,iOS) -Verbose
