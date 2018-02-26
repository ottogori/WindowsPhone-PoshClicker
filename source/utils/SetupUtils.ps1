function Make-Setup{
<#
.SYNOPSIS
    Direct and still hardcoded solution to perform the Project My Screen app setup

.DESCRIPTION
    Execute a left button mouse click in a determined position

.PARAMETER iniX
    Determine the top left X coordinate
    
.PARAMETER iniY
    Determine the top left Y coordinate

.PARAMETER iHeight
    Determine the Heigh dimension of the app

.PARAMETER iWidth
    Determine the Width dimension of the app

.NOTES
    Author: Otto Gori
    Version History - Initial build

.OUTPUT
    System.Automation :: System.Windows.Forms

.EXAMPLE
    Click-MouseButton -Button left
        
#>
param(
[int]$iniX,
[int]$iniY,
[int]$iHeight,
[int]$iWidth
)
    Start-Process -FilePath 'C:\Program Files (x86)\ProjectMyScreenApp\ProjectMyScreenApp.exe'

    Start-Sleep -Seconds 4

    [void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
    [System.Windows.Forms.SendKeys]::SendWait("{ESC}") 

    Set-Window -X $iniX -Y $iniY -Passthru -Height $iHeight -Width $iWidth -ProcessName ProjectMyScreenApp

    [System.Windows.Forms.SendKeys]::SendWait("e")
}