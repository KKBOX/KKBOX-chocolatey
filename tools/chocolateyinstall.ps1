$packageName = 'KKBOX'
$fileType = 'exe'
$url = 'https://download.kkbox.com/files/KKBOX_Setup-7.2.30.exe'

$silentArgs = '/s'
$validExitCodes = @(0)


Install-ChocolateyPackage "$packageName" "$fileType" "$silentArgs" "$url"  -validExitCodes  $validExitCodes  -checksum "b20194db339dc45f73726100f40a9225c7b9caa9212a80404682bb42c385c3fb" -checksumType "sha256"