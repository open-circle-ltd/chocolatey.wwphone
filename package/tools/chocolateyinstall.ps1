$ErrorActionPreference = 'Stop';
$PackageParameters = Get-PackageParameters
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://wwcom.ch/downloads/wwphone_4_2_16.exe'
$url64 = 'https://wwcom.ch/downloads/cti64_4_2_16.exe'
$checksum = '320b8db60e568ad197e09007608a14a9915bdbdf77454043884112a16be739d6c084f7af1d30267caea3e4eb96a93ff3f1df5cea10728667525362067617694b'
$checksum64 = '78c0fa42eaf27a93b5a8d460155752afdb9e61e9666d1ff159888c2a26cf4ba18c78c651976f240f78bae7998543d69df86e74869bc212901b57a2a7248650b4'

# Prep 32bit install
$32bit = $false
if ($PackageParameters) {
  if ($PackageParameters["32bit"]) {
    $32bit = $true
  }
}

# Args for 64bit install
$packageArgs64 = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url64
  softwareName  = 'wwphone*'
  checksum      = $checksum64
  checksumType  = 'sha512'
  silentArgs    = '/MOVEEXISTING /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOCLOSEAPPLICATIONS /SP-' +
  " /Log=`"$env:TEMP\$env:ChocolateyPackageName.$env:ChocolateyPackageVersion.Install.log`""
}

# Args for 32bit install
$packageArgs32 = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'wwphone*'
  checksum      = $checksum
  checksumType  = 'sha512'
  silentArgs    = '/MOVEEXISTING /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOCLOSEAPPLICATIONS /SP-' +
  " /Log=`"$env:TEMP\$env:ChocolateyPackageName.$env:ChocolateyPackageVersion.Install.log`""
}

if ($32bit) {
  Write-Host "Installing 32-bit version"
  Install-ChocolateyPackage @packageArgs32
} else {
  Write-Host "Installing 64-bit version"
  Install-ChocolateyPackage @packageArgs64
}
