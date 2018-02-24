. "$PSScriptRoot\utils\WindowUtils.ps1"
. "$PSScriptRoot\utils\MouseUtils.ps1"
. "$PSScriptRoot\utils\setupUtils.ps1"


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
Click-OnPosition -mouseX 125 -mouseY 380 -btn left #WhatsApp
Click-OnPosition -mouseX 470 -mouseY 835 -btn left #Opt
Click-OnPosition -mouseX 75 -mouseY 575 -btn left #Broadlist
Click-OnPosition -mouseX 275 -mouseY 850 -btn left #NewBtn


function Calc-WhereToClick{
param(
[int]$iWindowTopLeftX,
[int]$iWindowTopLeftY,
[int]$iAddX,
[int]$iAddY
)

}