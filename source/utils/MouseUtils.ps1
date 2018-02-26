function Get-Cursor{
    #GET CURSOR
    Add-Type -AssemblyName System.Windows.Forms
    $X = [System.Windows.Forms.Cursor]::Position.X
    $Y = [System.Windows.Forms.Cursor]::Position.Y
    Write-Output "X: $X | Y: $Y"
}
#get-cursor

function Click-MouseButton{
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
param(
[int]$mouseX,
[int]$mouseY,
[ValidateSet("left","right","middle")][string]$btn
)

    [system.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | out-null
    [Windows.Forms.Cursor]::Position = "$mouseX,$mouseY"
    Click-MouseButton -Button left
}