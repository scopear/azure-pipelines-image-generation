<#
    .SYNOPSIS
        A helper function to help generate an image.

    .DESCRIPTION
        Creates Azure resources and kicks off a packer image generation for the selected image type.

    .PARAMETER SubscriptionId
        The Azure subscription Id where resources will be created.

    .PARAMETER ResourceGroupName
        The Azure resource group name where the Azure resources will be created.

    .PARAMETER ImageGenerationRepositoryRoot
        The root path of the image generation repository source.

    .PARAMETER ImageType
        The type of the image being generated. Valid options are: {"VS2017", "VS2019", "Ubuntu164", "WinCon", "Unity"}.

    .PARAMETER AzureLocation
        The location of the resources being created in Azure. For example "East US".

    .PARAMETER Force
        Delete the resource group if it exists without user confirmation.

    .EXAMPLE
        GenerateResourcesAndImage -SubscriptionId {YourSubscriptionId} -ResourceGroupName "shsamytest1" -ImageGenerationRepositoryRoot "C:\azure-pipelines-image-generation" -AzureLocation "East US"
#>
param (
    [Parameter(Mandatory = $True)]
    [string] $SubscriptionId,
    [Parameter(Mandatory = $True)]
    [string] $ResourceGroupName,
    [Parameter(Mandatory = $True)]
    [string] $ImageGenerationRepositoryRoot,
    [Parameter(Mandatory = $True)]
    [string] $AzureLocation,
    [Parameter(Mandatory = $False)]
    [int] $SecondsToWaitForServicePrincipalSetup = 30,
    [Parameter(Mandatory = $False)]
    [Switch] $Force
)

$ErrorActionPreference = 'Stop'

$relativePath = "\images\win\Unity2018-VS2017.json"

$builderScriptPath = $ImageGenerationRepositoryRoot + $relativePath;

$ServicePrincipalClientSecret = $env:UserName + [System.GUID]::NewGuid().ToString().ToUpper();
$InstallPassword = $env:UserName + [System.GUID]::NewGuid().ToString().ToUpper();

try
{
    Get-AzureRmContext -ErrorAction Continue
}
catch [System.Management.Automation.PSInvalidOperationException]
{
    Login-AzureRmAccount
}

Set-AzureRmContext -SubscriptionId $SubscriptionId

$spDisplayName = [System.GUID]::NewGuid().ToString().ToUpper()
$sp = New-AzureRmADServicePrincipal -DisplayName $spDisplayName -Password (ConvertTo-SecureString $ServicePrincipalClientSecret -AsPlainText -Force)

$spAppId = $sp.ApplicationId
$spClientId = $sp.ApplicationId
$spObjectId = $sp.Id
Start-Sleep -Seconds $SecondsToWaitForServicePrincipalSetup

New-AzureRmRoleAssignment -RoleDefinitionName Contributor -ServicePrincipalName $spAppId
Start-Sleep -Seconds $SecondsToWaitForServicePrincipalSetup
$sub = Get-AzureRmSubscription -SubscriptionId $SubscriptionId
$tenantId = $sub.TenantId
# "", "Note this variable-setting script for running Packer with these Azure resources in the future:", "==============================================================================================", "`$spClientId = `"$spClientId`"", "`$ServicePrincipalClientSecret = `"$ServicePrincipalClientSecret`"", "`$SubscriptionId = `"$SubscriptionId`"", "`$tenantId = `"$tenantId`"", "`$spObjectId = `"$spObjectId`"", "`$AzureLocation = `"$AzureLocation`"", "`$ResourceGroupName = `"$ResourceGroupName`"", "`$storageAccountName = `"$storageAccountName`"", "`$install_password = `"$install_password`"", ""

packer.exe build -on-error=ask -var "client_id=$($spClientId)" -var "client_secret=$($ServicePrincipalClientSecret)" -var "subscription_id=$($SubscriptionId)" -var "tenant_id=$($tenantId)" -var "object_id=$($spObjectId)" -var "location=$($AzureLocation)" -var "resource_group=$($ResourceGroupName)" -var "install_password=$($InstallPassword)" $builderScriptPath
