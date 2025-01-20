#$testString = 'ala ma kota Mruczka'
$testString = 'Lorem ipsum dolor sit amet'
write-host "initial string: $testString"
$splitStrings = $testString -split ' '

$splitStrings = foreach ($string in $splitStrings) {
    "$string length:$($string.Length)"
}

$resultString = $splitStrings -join '     '
$resultString