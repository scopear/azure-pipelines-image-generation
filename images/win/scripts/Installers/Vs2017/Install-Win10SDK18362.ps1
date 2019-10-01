################################################################################
##  File:  Install-Win10SDK18362.ps1
##  Team:  CI-Platform
##  Desc:  Install Windows 10 SDK (10.0.18362.0)
################################################################################

Import-Module -Name ImageHelpers -Force

$InstallerURI = 'https://download.microsoft.com/download/4/2/2/42245968-6A79-4DA7-A5FB-08C0AD0AE661/windowssdk/winsdksetup.exe'
$InstallerName = 'winsdksetup.exe'
$ArgumentList = ('/features', '+', '/quiet', '/norestart')

$exitCode = Install-EXE -Url $InstallerURI -Name $InstallerName -ArgumentList $ArgumentList

exit $exitCode
