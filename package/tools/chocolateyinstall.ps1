$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$urlPackage = 'https://wwcom.ch/downloads/wwphone_4_0_50.exe'
$checksumPackage = 'ec4a7dc7bd097efa204ccb598b18289b837ac55ec8c2cb4b71a9f32f046c5e8eae469c7bbff074f8f6bb01fc4cdc5dfabe16d7a925851c52cf7a28eea0b3d146'

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