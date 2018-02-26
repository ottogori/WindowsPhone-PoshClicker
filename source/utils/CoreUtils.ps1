#Since I cant assume the window position, this small feature should calc the difference among the desired click (starting from 0x0y) and the ral position to make perform the click
function Calc-WhereToClick{
param(
[string]$sApplicationName,
[int]$iAddX,
[int]$iAddY
)

    $ApplicationWindow = Get-Window $sApplicationName

    $TopLeftX = $ApplicationWindow.TopLeft.X
    $TopLetfY = $ApplicationWindow.TopLeft.Y

    $CoordinateObject = [pscustomobject]@{
                    Xcordinate = $TopLeftX + $iAddX
                    ycordinate = $TopLeftY + $iAddY
                }
    return $CoordinateObject
}
#Calc-WhereToClick -sApplicationName powershell -iAddX 1 -iAddY 10