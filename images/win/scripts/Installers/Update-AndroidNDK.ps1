################################################################################
##  File:  Update-AndroidNDK.ps1
##  Team:  ScopeAR
##  Desc:  Install Android NDK 16.2
################################################################################

choco install android-ndk --version 16.2 -y

# Chocolatey installs the android ndk in this location
$ndk_location = "C:\Android\android-ndk-r16b"
setx ANDROID_NDK $ndk_location /M
