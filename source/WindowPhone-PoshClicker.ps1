. "$PSScriptRoot\utils\WindowUtils.ps1"
. "$PSScriptRoot\utils\MouseUtils.ps1"
. "$PSScriptRoot\utils\setupUtils.ps1"


Make-Setup -iniX 0 -iniY 0 -iHeight 1050 -iWidth 550

#Set-Window -X 0 -Y 0 -Passthru -Height 1050 -Width 550 -ProcessName ProjectMyScreenApp

$size = Get-Window ProjectMyScreenApp


Add-Type -AssemblyName System.Windows.Forms
$screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
$screen | Get-Member -MemberType Property
$screen.Width
$screen.Height

get-cursor

Click-OnPosition