param 
(
   [string]$url,
   [string]$ver,
   [string]$key
)

Write-Host "1. check params avaiable"

If([string]::IsNullOrEmpty($url)){
	Write-Error -Message "url is NULL or EMPTY." -ErrorAction Stop
}

If([string]::IsNullOrEmpty($ver)){   
	Write-Error -Message "ver is NULL or EMPTY." -ErrorAction Stop
}

If([string]::IsNullOrEmpty($key)){   
	Write-Error -Message "key is NULL or EMPTY." -ErrorAction Stop
}

$exeFile  = ".\KKBOX_Setup-${ver}.exe";

Write-Host "2. download ${exeFile}"
Invoke-WebRequest $url -OutFile $exeFile

Write-Host "3. get checksum ${exeFile}"
$checkSum = (Get-FileHash $exeFile -Algorithm sha256).hash

Write-Host "4. update version of kkbox.nuspec"
$nuspecFile = ".\kkbox.nuspec";
$nuspecContent = Get-Content $nuspecFile
$nuspecContent = $nuspecContent.replace('xx.xx.xx', $ver)
Set-Content -path $nuspecFile -value $nuspecContent -Encoding UTF8

Write-Host "5. update url and checksum of chocolateyinstall.ps1"
$chocoFile = ".\tools\chocolateyinstall.ps1";
$chocoContent = "Install-ChocolateyPackage 'KKBOX' 'exe' '/s' '${url}' -validExitCodes @(0) -checksum '${checksum}' -checksumType 'sha256'"

echo $chocoContent
Set-Content -path $chocoFile -value $chocoContent -Encoding UTF8

Write-Host "6. pack and upload to choctolatey"
$packFile = "KKBOX.${ver}.nupkg"
choco pack
choco apikey --key $key --source https://push.chocolatey.org/
choco push $packFile --source https://push.chocolatey.org/