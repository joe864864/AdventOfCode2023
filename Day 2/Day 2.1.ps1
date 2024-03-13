$path = ".\Day 2\Input.txt"
#$path = ".\Day 2\Test.txt"

$data = Get-Content -Path $path

$newData = @()

foreach($line in $data){
    #Write-Host("")

    $game = $line.Substring(5,$line.IndexOf(":")-5)
    $man = $line.Substring($line.IndexOf(":")+2)

    #Write-Host("")

    $rounds = $man -split "; "
    $rCount = 1

    $rTemp = @()
    $gamePossible = $true

    foreach($round in $rounds){
        
        $cubes = $round -split ", "

        $roundPossible = $true
        $red = 0
        $redPossible = $true
        $green = 0
        $greenPossible = $true
        $blue = 0
        $bluePossible = $true

        foreach($cube in $cubes){
            $temp = $cube -split " "
            $num = $temp[0]
            $color = $temp[1]

            if($color -ieq "red"){
                $red += [int]$num
            }
            elseif($color -ieq "green"){
                $green += [int]$num
            }
            elseif($color -ieq "blue"){
                $blue += [int]$num
            }
            #Write-Host("")
        }

        if($red -gt 12){
            $gamePossible = $false
            $roundPossible = $false
            $redPossible = $false
        }
        if($green -gt 13){
            $gamePossible = $false
            $roundPossible = $false
            $greenPossible = $false
        }
        if($blue -gt 14){
            $gamePossible = $false
            $roundPossible = $false
            $bluePossible = $false
        }

        $rTemp += [PSCustomObject]@{
            Round = $rCount
            RoundPossible = $roundPossible
            Red = $red
            RedPossible = $redPossible
            Green = $green
            GreenPossible = $greenPossible
            Blue = $blue
            BluePossible = $bluePossible
        }

        $rCount++
        #Write-Host("")
    }

    $newData += [PSCustomObject]@{
        Game = [int]$game
        Possible = $gamePossible
        Rounds = $rTemp
    }
    #Write-Host("")
}

#Write-Host("")

$answer = 0

foreach ($game in $newData){
    if($game.Possible){
        $answer += $game.Game
    }
}

Write-Host("Answer: $answer")