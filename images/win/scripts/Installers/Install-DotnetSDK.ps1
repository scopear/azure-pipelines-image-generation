################################################################################
##  File:  Install-DotnetSDK.ps1
##  Team:  CI-Build
##  Desc:  Install all released versions of the dotnet sdk and populate package
##         cache.  Should run after VS and Node
################################################################################

# ensure temp
New-Item -Path C:\Temp -Force -ItemType Directory

[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor "Tls12"

$templates = @(
    'console',
    'mstest',
    'web',
    'mvc',
    'webapi'
)

function InstallSDKVersion (
    $sdkVersion
)
{
    if (!(Test-Path -Path "C:\Program Files\dotnet\sdk\$sdkVersion"))
    {
        Write-Host "Installing dotnet $sdkVersion"
        .\dotnet-install.ps1 -Architecture x64 -Version $sdkVersion -InstallDir $(Join-Path -Path $env:ProgramFiles -ChildPath 'dotnet')
    }
    else
    {
        Write-Host "Sdk version $sdkVersion already installed"
    }

    # warm up dotnet for first time experience
    $templates | ForEach-Object {
        $template = $_
        $projectPath = Join-Path -Path C:\temp -ChildPath $template
        New-Item -Path $projectPath -Force -ItemType Directory
        Push-Location -Path $projectPath
        & $env:ProgramFiles\dotnet\dotnet.exe new globaljson --sdk-version "$sdkVersion"
        & $env:ProgramFiles\dotnet\dotnet.exe new $template
        Pop-Location
        Remove-Item $projectPath -Force -Recurse
    }
}

function InstallAllValidSdks()
{
    Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/dotnet/core/master/release-notes/releases-index.json' -UseBasicParsing -OutFile 'releases-index.json'
    $dotnetChannels = Get-Content -Path 'releases-index.json' | ConvertFrom-Json

    # Consider all channels except preview/eol channels.
    # Sort the channels in ascending order
    $dotnetChannels = $dotnetChannels.'releases-index' | Where-Object { !$_."support-phase".Equals('preview') -and !$_."support-phase".Equals('eol') -and $_."channel-version" -lt "3.0" } | Sort-Object { [Version] $_."channel-version" }

    # Download installation script.
    Invoke-WebRequest -Uri 'https://dot.net/v1/dotnet-install.ps1' -UseBasicParsing -OutFile 'dotnet-install.ps1'

    ForEach ($dotnetChannel in $dotnetChannels)
    {
        $channelVersion = $dotnetChannel.'channel-version';
        Invoke-WebRequest -Uri $dotnetChannel.'releases.json' -UseBasicParsing -OutFile "releases-$channelVersion.json"
        $currentReleases = Get-Content -Path "releases-$channelVersion.json" | ConvertFrom-Json
        # filtering out the preview/rc releases
        $currentReleases = $currentReleases.'releases' | Where-Object { !$_.'release-version'.Contains('-') } | Sort-Object { [Version] $_.'release-version' }
        ForEach ($release in $currentReleases)
        {
            if ($release.'sdks'.Count -gt 0)
            {
                Write-Host 'Found sdks property in release: ' + $release.'release-version' + 'with sdks count: ' + $release.'sdks'.Count


                # Remove duplicate entries & preview/rc version from download list
                # Sort the sdks on version
                $sdks = @($release.'sdk');
                $sdks += $release.'sdks' | Where-Object { !$_.'version'.Contains('-') -and !$_.'version'.Equals($release.'sdk'.'version') }
                $sdks = $sdks | Sort-Object { [Version] $_.'version' }

                $sdks.Contains($release.'sdk')
                ForEach ($sdk in $sdks)
                {
                    InstallSDKVersion -sdkVersion $sdk.'version'
                }
            }
            elseif (!$release.'sdk'.'version'.Contains('-'))
            {
                $sdkVersion = $release.'sdk'.'version'
                InstallSDKVersion -sdkVersion $sdkVersion
            }
        }
    }
}

function RunPostInstallationSteps()
{
    Add-MachinePathItem "C:\Program Files\dotnet"
    # Run script at startup for all users
    $cmdDotNetPath = @"
@echo off
SETX PATH "%USERPROFILE%\.dotnet\tools;%PATH%"
"@

    $cmdPath = "C:\Program Files\dotnet\userpath.bat"
    $cmdDotNetPath | Out-File -Encoding ascii -FilePath $cmdPath

    # Update Run key to run a script at logon
    Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "DOTNETUSERPATH" -Value $cmdPath
}

InstallAllValidSdks
RunPostInstallationSteps
