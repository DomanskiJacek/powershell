$numberOfFiles = 2
$subfolder = ".\ptests"
$logFile = "scripts.log"

write-host "Enter a name for files to be created"
[string]$filex = read-host "filex"

function Log-Message
{
    param (
        [string]$message,
		[int]$iserror = 0
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
	if ($iserror -ne 0){
		Add-Content -Path $logFile -Value "ERROR"
	}
    Add-Content -Path $logFile -Value "$timestamp $message"
}

# begin the script
$currentFolder = Get-Location
$dividend = 10
$divisor = 0


if (-not (Test-Path -Path $subfolder)) {
    New-Item -ItemType Directory -Path $subfolder | Out-Null
    Log-Message "folder: $subfolder created"
}
else {
    Log-Message "folder: $subfolder exists"
}

Set-Location -Path $subfolder

try{
    $result = $dividend / $divisor
    Log-Message "The result of dividing $dividend by $divisor is $result"
}catch{
    Log-Message "Exception dividing $dividend by $divisor"
}



for ($i=1;$i -le $numberOfFiles; $i++) {
    $filename = "$filex$i.txt"
    
    if (-not (Test-Path -Path $filename)) {
        New-Item -Name $filename -ItemType File  | Out-Null
        $filecontent="Line1 in file $filename"
        Add-Content -Value $filecontent -Path .\$filename
        Log-Message "$filename created"
        }
        else {
            Log-Message "$filename exists"
        }
}

Set-Location -Path $currentFolder
