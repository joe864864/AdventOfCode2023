$path = ".\Day 1\Input.txt"
#$path = ".\Day 1\Test.txt"

$data = Get-Content -Path $path

#$words = @("one","two","three","four","five","six","seven","eight","nine")

$sum = 0

$newData = @()

foreach($line in $data){
    $newLine = ""
    $buffer = ""
    foreach($char in $line.ToCharArray()){
        if($char -match "^\d$"){
            $newLine += $char
            $buffer = ""
        }
        else{
            $buffer += $char
            if($buffer.ToUpper().Contains("ONE")){
                $newLine += 1
                $buffer = $buffer.Substring($buffer.IndexOf("one")+1)
            }
            elseif($buffer.ToUpper().Contains("TWO")){
                $newLine += 2
                $buffer = $buffer.Substring($buffer.IndexOf("two")+1)
            }
            elseif($buffer.ToUpper().Contains("THREE")){
                $newLine += 3
                $buffer = $buffer.Substring($buffer.IndexOf("three")+1)
            }
            elseif($buffer.ToUpper().Contains("FOUR")){
                $newLine += 4
                $buffer = $buffer.Substring($buffer.IndexOf("four")+1)
            }
            elseif($buffer.ToUpper().Contains("FIVE")){
                $newLine += 5
                $buffer = $buffer.Substring($buffer.IndexOf("five")+1)
            }
            elseif($buffer.ToUpper().Contains("SIX")){
                $newLine += 6
                $buffer = $buffer.Substring($buffer.IndexOf("six")+1)
            }
            elseif($buffer.ToUpper().Contains("SEVEN")){
                $newLine += 7
                $buffer = $buffer.Substring($buffer.IndexOf("seven")+1)
            }
            elseif($buffer.ToUpper().Contains("EIGHT")){
                $newLine += 8
                $buffer = $buffer.Substring($buffer.IndexOf("eight")+1)
            }
            elseif($buffer.ToUpper().Contains("NINE")){
                $newLine += 9
                $buffer = $buffer.Substring($buffer.IndexOf("nine")+1)
            }
        }
    }
    $newData += $newLine
}

#Write-Host("")

foreach($line in $newData){
    $num = $line[0] + $line[($line.Length)-1]
    $sum += [int]$num
}

Write-Host("Answer: $sum")