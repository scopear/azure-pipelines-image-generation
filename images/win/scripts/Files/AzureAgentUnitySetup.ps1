##########################################################################
# This is used to download and setup the azure devops agent service
# and to also
##########################################################################

<#

.SYNOPSIS
This is used to download and setup the azure devops agent service

.DESCRIPTION
This Powershell script will download the azure devops agent package and install
it as as a service with the parameters you have provided

.PARAMETER AzureURL
The Azure DevOps Project URL
.PARAMETER AzureToken
The Azure DevOps PAT
.PARAMETER AzurePool
The Azure DevOps Agent Pool Name
.PARAMETER UnityUser
The Unity account name to use for licensing
.PARAMETER UnityPassword
The Unity account password to use for licensing
.PARAMETER UnitySerial
The Unity Serial Key associated with the username
.PARAMETER ServiceAccount
The Windows Account to use when running the Azure Agent
.PARAMETER ServicePassword
The password for the Windows Service Account

#>

[CmdletBinding()]
Param(
    [Parameter(Mandatory = $True)]
    [string]$AzureURL,
    [Parameter(Mandatory = $True)]
    [string]$AzureToken,
    [Parameter(Mandatory = $True)]
    [string]$AzurePool,
    [Parameter(Mandatory = $True)]
    [string]$ServiceAccount,
    [Parameter(Mandatory = $True)]
    [string]$ServicePassword,
    [Parameter(Mandatory = $True)]
    [string]$UnityUser,
    [Parameter(Mandatory = $True)]
    [string]$UnityPassword,
    [Parameter(Mandatory = $True)]
    [string]$UnitySerial
)

Write-Host "1. Setting Unity Credentials" -ForegroundColor Cyan

setx UNITY_USER $UnityUser /M
setx UNITY_PASSWORD $UnityPassword /M
setx UNITY_SERIAL $UnitySerial /M

Write-Host "2. Determining matching Azure Pipelines agent..." -ForegroundColor Cyan

$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$(${AzureToken})"))
$package = Invoke-RestMethod -Headers @{Authorization=("Basic $base64AuthInfo")} "$(${AzureURL})/_apis/distributedtask/packages/agent?platform=win-x64&`$top=1"
$packageUrl = $package[0].Value.downloadUrl

Write-Host "3. Downloading and installing Azure Pipelines agent..." -ForegroundColor Cyan

Invoke-WebRequest $packageUrl -Outfile "C:\azp\agent.zip"

Expand-Archive -Path "C:\azp\agent.zip" -DestinationPath "C:\azp"

Write-Host "4. Configuring Azure Pipelines agent..." -ForegroundColor Cyan

C:\azp\config.cmd --unattended `
    --agent "$(${Env:computername})" `
    --url "$(${AzureURL})" `
    --auth PAT `
    --token "$(${AzureToken})" `
    --pool "$(${AzurePool})" `
    --replace `
    --runAsService `
    --windowsLogonAccount ".\$(${ServiceAccount})" `
    --windowsLogonPassword "$(${ServicePassword})"

Write-Host "5. Setting up Unity Licensing Task" -ForegroundColor Cyan

$secSerial = ConvertTo-SecureString $UnitySerial -AsPlainText -Force
$secPasswd = ConvertTo-SecureString $UnityPassword -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ($UnityUser, $secPasswd)
Start-UnityEditor -Credential $mycreds -Serial $secSerial -Wait

schtasks /create /SC DAILY /TN 'Unity Licensing' /TR 'powershell.exe -file C:/azp/ActivateUnityLicense.ps1' /RU SYSTEM

# We need to restart for the "setx" commands to propagate to powershell
# ...I thought that an environment refresh would be enough, but that didn't work.
Write-Host "Computer will restart in 10 seconds" -ForegroundColor Cyan
Start-Sleep -Seconds 10
Restart-Computer -Force