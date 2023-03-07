$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$urlPackage = 'https://wwcom.ch/downloads/wwphone_4_0_27.exe'
$checksumPackage = '69d4dc1e2ec5786847d78d24606dbc7c77abc926f97dc78ed21c748cb6c1cd4a09e1d737bd2f6fe911780c0879b1fb01a4326f25f2ba53c368cc4ed167f25678'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $urlPackage
  softwareName  = 'wwphone*'
  checksum      = $checksumPackage
  checksumType  = 'sha512'
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs 