$path = ".\Day 1\Input.txt"
#$path = ".\Day 1\Test.txt"

$data = Get-Content -Path $path

$sum = 0

foreach($line in $data){
    $first = $null
    $last = $null
    foreach($char in $line.ToCharArray()){
        if($char -match "^\d$"){
            if($null -eq $first){
                $first = $char
            }
            $last = $char
        }
    }
    $num = $first + $last
    $sum += [int]$num
}

Write-Host("Answer: $sum")