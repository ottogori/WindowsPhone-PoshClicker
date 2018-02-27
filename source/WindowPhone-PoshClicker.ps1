. "$PSScriptRoot\utils\WindowUtils.ps1"
. "$PSScriptRoot\utils\MouseUtils.ps1"
. "$PSScriptRoot\utils\setupUtils.ps1"
. "$PSScriptRoot\utils\CoreUtils.ps1"


# Set power shell stream handling preferences
$VerbosePreference = "Continue"
$DebugPreference = "SilentlyContinue"
$ErrorActionPreference = "Stop"

# Define global variables
$global:stepSetup = 1
$global:stepExecCmd = 2
$global:stepValidate = 3
$global:totalSteps = 3


<#

!!!!!!!!

During the beta state os this project, this main session shall be used for play/try purposes, it will change a lot, so don't expect much good writen code in here.

!!!!!!!!

#>


Make-Setup -iniX 0 -iniY 0 -iHeight 1050 -iWidth 550

#Set-Window -X 0 -Y 0 -Passthru -Height 1050 -Width 550 -ProcessName ProjectMyScreenApp

$PhoneWindow = Get-Window ProjectMyScreenApp
$PhoneWindow


Add-Type -AssemblyName System.Windows.Forms
$screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
$screen | Get-Member -MemberType Property
$screen.Width
$screen.Height

get-cursor

Click-OnPosition -mouseX 270 -mouseY 900 -btn left

Start-Sleep -Seconds 3

Click-OnPosition -mouseX 125 -mouseY 380 -btn left #WhatsApp

Start-Sleep -Seconds 3
Click-OnPosition -mouseX 470 -mouseY 835 -btn left #Opt

Start-Sleep -Seconds 3
Click-OnPosition -mouseX 75 -mouseY 575 -btn left #Broadlist

Start-Sleep -Seconds 3
Click-OnPosition -mouseX 275 -mouseY 850 -btn left #NewBtn

