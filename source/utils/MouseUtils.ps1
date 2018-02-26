function Click-MouseButton{
<#
.SYNOPSIS
    Performa mouse click

.DESCRIPTION
    Execute one of the 3 possible mouse clicks directly.

.PARAMETER Button
    Determine the button the robot sould press

.NOTES
    Name: Click-MouuseButton
    Author: Otto Gori
    Version History - Initial build

.OUTPUT
    System.Automation :: mouse_event

.EXAMPLE
    Click-MouseButton -Button left
        
#>
param(
    [string]$Button
)


    if ($help -or (!$Button)){
        write-host $HelpInfo
        return
    }else{
        $signature = @' 
        [DllImport("user32.dll",CharSet=CharSet.Auto, CallingConvention=CallingConvention.StdCall)]
        public static extern void mouse_event(long dwFlags, long dx, long dy, long cButtons, long dwExtraInfo);
'@ 

        $SendMouseClick = Add-Type -memberDefinition $signature -name "Win32MouseEventNew" -namespace Win32Functions -passThru 
        if($Button -eq "left"){
            $SendMouseClick::mouse_event(0x00000002, 0, 0, 0, 0);
            $SendMouseClick::mouse_event(0x00000004, 0, 0, 0, 0);
        }
        if($Button -eq "right"){
            $SendMouseClick::mouse_event(0x00000008, 0, 0, 0, 0);
            $SendMouseClick::mouse_event(0x00000010, 0, 0, 0, 0);
        }
        if($Button -eq "middle"){
            $SendMouseClick::mouse_event(0x00000020, 0, 0, 0, 0);
            $SendMouseClick::mouse_event(0x00000040, 0, 0, 0, 0);
        }
    }
}



function Click-OnPosition{
<#
.SYNOPSIS
    Performa a left button mouse click

.DESCRIPTION
    Execute a left button mouse click in a determined position

.PARAMETER mouseX
    Determine the X coordinate

.PARAMETER mouseY
    Determine the Y coordinate

.NOTES
    Name: Click-OnPosition
    Author: Otto Gori
    Version History - Initial build

.OUTPUT
    System.Automation :: mouse_event

.EXAMPLE
    Click-MouseButton -Button left
        
#>
param(
[int]$mouseX,
[int]$mouseY,
[ValidateSet("left","right","middle")][string]$btn
)

    [system.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | out-null
    [Windows.Forms.Cursor]::Position = "$mouseX,$mouseY"
    Click-MouseButton -Button left
}

#Just a directly solution to determine the cursor position
function Get-Cursor{
    #GET CURSOR
    Add-Type -AssemblyName System.Windows.Forms
    $X = [System.Windows.Forms.Cursor]::Position.X
    $Y = [System.Windows.Forms.Cursor]::Position.Y
    Write-Output "X: $X | Y: $Y"
}
#get-cursor