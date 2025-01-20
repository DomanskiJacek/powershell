$startTime = Get-Date

$maxiter = 50000
$outputsize = 10
$output1 = ""

for ($i = 1; $i -le $maxiter; $i++) {
	$rNum = Get-Random -Minimum 0 -Maximum 100
		if (($i % [math]::Round($maxiter / $outputsize)) -eq 1 ) {
			$output1 += (', ' + $rNum.ToString())
		}
}

$endTime=Get-Date
$miliSeconds1 = ($endTime-$startTime).TotalMilliseconds

Write-Host "1) using Get-Random"
Write-Host "interations: $maxiter; output: $output1"
Write-Host "time in miliseconds: $miliSeconds1"

# the same iteration using system.random
$obrandom = [System.Random]::new()
$startTime = Get-Date
for($i = 1; $i -le $maxiter; $i++){
    $rNum = $obRandom.Next(0, 100)
    if (($i % [Math]::Round($maxiter / $outputsize)) -eq 1 ){
        $output2 += (", " + $rNum.ToString())
    }
}
$endTime = Get-Date
$miliSeconds2 = ($endTime-$startTime).TotalMilliseconds

Write-Host "2) using obRandom = New-Object -TypeName System.Random"
Write-Host "interations: $maxiter; output: $output2"
Write-Host "time in miliseconds: $miliSeconds2"
Write-Host "the ratio: $([math]::Round($miliSeconds1 / $miliSeconds2, 3))"
