$ErrorActionPreference = 'Stop';
$PackageParameters = Get-PackageParameters
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://wwcom.ch/downloads/wwphone_4_3_3.exe'
$url64 = 'https://wwcom.ch/downloads/wwphone64_4_3_3.exe'
$checksum = '1d6354fdb514bd3cf3b910184a1cf44f83d519cc432d816d6511a86f2d704e5d4860b8766abed070ef64e3454cfcbb5cafccddd49ebc87c97ab6e692d23259e7'
$checksum64 = '8e97c15235aa3e0aa5ef17c3e1a819d0cd24e085250ccb41fa51fc0e980c60add837842f927097648c0dddba302eeaf110841604cb10da335792a7ece9f94e6b'

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
