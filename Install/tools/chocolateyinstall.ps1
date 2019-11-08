$packageName = 'KKBOX'
$fileType = 'exe'
$url = 'https://download.kkbox.com/files/KKBOX_Setup-7.1.60.exe'

$silentArgs = '/s'
$validExitCodes = @(0)


Install-ChocolateyPackage "$packageName" "$fileType" "$silentArgs" "$url"  -validExitCodes  $validExitCodes  -checksum "EABC2E751A015FEF9C0346F140F5283E5AC0E1F809227874EC16350C4D38BE24" -checksumType "sha256"