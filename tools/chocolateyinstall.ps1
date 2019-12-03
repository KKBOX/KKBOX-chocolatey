$packageName = 'KKBOX'
$fileType = 'exe'
$url = 'https://download.kkbox.com/files/KKBOX_Setup-7.1.72.exe'

$silentArgs = '/s'
$validExitCodes = @(0)


Install-ChocolateyPackage "$packageName" "$fileType" "$silentArgs" "$url"  -validExitCodes  $validExitCodes  -checksum "BAA343680CF0DA08442FA418EE6B8BAB37FAEFD1A44E3550C35BB985ACD0FF33" -checksumType "sha256"