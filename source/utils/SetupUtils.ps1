function Make-Setup{
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