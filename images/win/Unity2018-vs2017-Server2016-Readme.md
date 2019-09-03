# Azure Pipelines Hosted VS2017 image

The following software is installed on machines in the Azure Pipelines **Hosted VS2017** (vdev) pool.

Components marked with **\*** have been upgraded since the previous version of the image.


## Chocolatey

_Version:_ 0.10.15<br/>
_Environment:_
* PATH: contains location for choco.exe

## Visual Studio 2017 Enterprise

_Version:_ VisualStudio/15.9.15+28307.812<br/>
_Location:_ C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise

The following workloads including required and recommended components are installed with Visual Studio 2017:

* Universal Windows Platform development
* .NET desktop development
* Desktop development with C++
* ASP.NET and web development
* Azure development
* Node.js development
* Data storage and processing
* Data science and analytical applications *
* Game development with Unity *
* Linux development with C++ *
* Game development with C++ *
* Mobile development with C++ *
* Office/SharePoint development
* Mobile development with .NET
* .NET Core cross-platform development
* Visual Studio extension development *
* Python development *
* Mobile development with JavaScript *

In addition the following optional components are installed:

* Microsoft.Net.Component.4.6.2.SDK
* Microsoft.Net.Component.4.6.2.TargetingPack
* Microsoft.Net.ComponentGroup.4.6.2.DeveloperTools
* Microsoft.Net.Component.4.7.SDK
* Microsoft.Net.Component.4.7.TargetingPack
* Microsoft.Net.ComponentGroup.4.7.DeveloperTools
* Microsoft.Net.Component.4.7.1.SDK
* Microsoft.Net.Component.4.7.1.TargetingPack
* Microsoft.Net.ComponentGroup.4.7.1.DeveloperTools
* Microsoft.Net.ComponentGroup.4.7.2.DeveloperTools
* Microsoft.Net.Core.Component.SDK.1x
* Microsoft.NetCore.1x.ComponentGroup.Web
* Microsoft.VisualStudio.Component.Azure.Storage.AzCopy
* Microsoft.VisualStudio.Component.PowerShell.Tools
* Microsoft.VisualStudio.Component.VC.140
* Component.Dotfuscator
* Microsoft.VisualStudio.Component.VC.ATL
* Microsoft.VisualStudio.Component.VC.ATL.ARM
* Microsoft.VisualStudio.Component.VC.ATL.ARM64
* Microsoft.VisualStudio.Component.VC.ATLMFC
* Microsoft.VisualStudio.Component.VC.ClangC2
* Microsoft.VisualStudio.Component.VC.CLI.Support
* Microsoft.VisualStudio.Component.VC.Modules.x86.x64
* Microsoft.VisualStudio.Component.Windows10SDK.10240
* Microsoft.VisualStudio.Component.Windows10SDK.10586
* Microsoft.VisualStudio.Component.Windows10SDK.14393
* Microsoft.VisualStudio.Component.Windows10SDK.15063.Desktop
* Component.Unreal
* Component.Unreal.Android
* Component.Android.SDK23
* Microsoft.VisualStudio.Component.TestTools.WebLoadTest
* Microsoft.VisualStudio.Web.Mvc4.ComponentGroup
* Component.Linux.CMake
* Microsoft.Component.PythonTools.UWP
* Microsoft.Component.VC.Runtime.OSSupport
* Microsoft.VisualStudio.Component.VC.Tools.ARM
* Microsoft.VisualStudio.ComponentGroup.UWP.VC
* Microsoft.VisualStudio.Component.VSSDK
* Microsoft.VisualStudio.Component.LinqToSql
* Microsoft.VisualStudio.Component.TestTools.CodedUITest
* Microsoft.VisualStudio.Component.TestTools.Core
* Microsoft.VisualStudio.Component.TypeScript.2.0
* Microsoft.VisualStudio.Component.TypeScript.2.1
* Microsoft.VisualStudio.Component.TypeScript.2.2
* Microsoft.VisualStudio.Component.VC.Tools.ARM64
* Microsoft.VisualStudio.Component.Windows10SDK.16299.Desktop.arm
* Microsoft.VisualStudio.Component.DslTools
* Microsoft.VisualStudio.Component.Windows81SDK
* Microsoft.VisualStudio.Component.WinXP
* Microsoft.VisualStudio.ComponentGroup.NativeDesktop.Win81
* Microsoft.VisualStudio.ComponentGroup.NativeDesktop.WinXP
* Microsoft.VisualStudio.ComponentGroup.ArchitectureTools.Managed
* Microsoft.Component.Blend.SDK.WPF
* Microsoft.Component.VC.Runtime.UCRTSDK
* Microsoft.VisualStudio.Component.VC.ATL.Spectre
* Microsoft.VisualStudio.Component.VC.ATL.ARM.Spectre
* Microsoft.VisualStudio.Component.VC.ATL.ARM64.Spectre
* Microsoft.VisualStudio.Component.VC.ATLMFC.Spectre
* Microsoft.VisualStudio.Component.Windows10SDK.17134
* Microsoft.VisualStudio.Component.Windows10SDK.17763
* Microsoft.VisualStudio.Component.VC.Runtimes.x86.x64.Spectre
* Microsoft.VisualStudio.Component.VC.Runtimes.ARM.Spectre
* Microsoft.VisualStudio.Component.VC.Runtimes.ARM64.Spectre

## Windows Driver Kit

_Version:_ 10.0.17763.0<br/>

## Unity

_Version:_ 2018.4.7f1<br/>

## WinAppDriver

_Version:_ 1.1.1809.18001<br/>

## Android SDK Build Tools

#### 28.0.3

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\28.0.3

#### 28.0.2

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\28.0.2

#### 28.0.1

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\28.0.1

#### 28.0.0

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\28.0.0

#### 27.0.3

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\27.0.3

#### 27.0.2

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\27.0.2

#### 27.0.1

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\27.0.1

#### 27.0.0

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\27.0.0

#### 26.0.3

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\26.0.3

#### 26.0.2

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\26.0.2

#### 26.0.1

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\26.0.1

#### 26.0.0

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\26.0.0

#### 25.0.3

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\25.0.3

#### 25.0.2

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\25.0.2

#### 25.0.1

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\25.0.1

#### 25.0.0

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\25.0.0

#### 24.0.3

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\24.0.3

#### 24.0.2

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\24.0.2

#### 24.0.1

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\24.0.1

#### 24.0.0

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\24.0.0

#### 23.0.3

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\23.0.3

#### 23.0.2

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\23.0.2

#### 23.0.1

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\23.0.1

#### 22.0.1

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\22.0.1

#### 21.1.2

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\21.1.2

#### 20.0.0

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\20.0.0

#### 19.1.0

_Location:_ C:\Program Files (x86)\Android\android-sdk\build-tools\19.1.0


## Android SDK Platforms

#### 10 (API 29)

_Location:_ C:\Program Files (x86)\Android\android-sdk\platforms\android-29

#### 9 (API 28)

_Location:_ C:\Program Files (x86)\Android\android-sdk\platforms\android-28

#### 8.1.0 (API 27)

_Location:_ C:\Program Files (x86)\Android\android-sdk\platforms\android-27

#### 8.0.0 (API 26)

_Location:_ C:\Program Files (x86)\Android\android-sdk\platforms\android-26

#### 7.1.1 (API 25)

_Location:_ C:\Program Files (x86)\Android\android-sdk\platforms\android-25

#### 7.0 (API 24)

_Location:_ C:\Program Files (x86)\Android\android-sdk\platforms\android-24

#### 6.0 (API 23)

_Location:_ C:\Program Files (x86)\Android\android-sdk\platforms\android-23

#### 5.1.1 (API 22)

_Location:_ C:\Program Files (x86)\Android\android-sdk\platforms\android-22

#### 5.0.1 (API 21)

_Location:_ C:\Program Files (x86)\Android\android-sdk\platforms\android-21

#### 4.4.2 (API 19)

_Location:_ C:\Program Files (x86)\Android\android-sdk\platforms\android-19


## TLS12

_Version:_ 1.2<br/>
_Description:_ .NET has been configured to use TLS 1.2 by default

## Java Development Kit

#### 1.8.0_222

_Environment:_
* JAVA_HOME: location of JDK
* PATH: contains bin folder of JDK

#### 1.7.0_232

_Location:_ C:\Program Files\Java\zulu-7-azure-jdk_7.31.0.5-7.0.232-win_x64

#### 11.0.4

_Location:_ C:\Program Files\Java\zulu-11-azure-jdk_11.33.15-11.0.4-win_x64

## Ant

_Version:_ 1.10.5<br/>
_Environment:_
* PATH: contains location of ant.cmd
* ANT_HOME: location of ant.cmd
* COBERTURA_HOME: location of cobertura-2.1.1.jar

## Maven

_Version:_ 3.6.1<br/>
_Environment:_
* PATH: contains location of mvn.bat
* M2_HOME: Maven installation root

## Gradle

_Version:_ 5.6<br/>
_Environment:_
* PATH: contains location of gradle

## 7zip

_Version:_ 19.00<br/>
