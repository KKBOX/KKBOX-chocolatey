$packageName = 'KKBOX'
$fileType = 'exe'
$url = 'https://download.kkbox.com/files/KKBOX_Setup-7.1.80.exe'

$silentArgs = '/s'
$validExitCodes = @(0)


Install-ChocolateyPackage "$packageName" "$fileType" "$silentArgs" "$url"  -validExitCodes  $validExitCodes  -checksum "8EBA4D118DBDCF024DC1EEE603BA6817CA8B2E3F65B61FC2BBF6589D7BC11DAD" -checksumType "sha256"