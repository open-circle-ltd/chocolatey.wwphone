$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$urlPackage = 'https://wwcom.ch/downloads/wwphone_4_0_110.exe'
$checksumPackage = '78c2a16b73f4d0c09cce81abeeb2278c3386ba9de27bf1b536f9c90f0bbafda85b739af30a93d8e4f930cb403fddcf2b706568951345fda876456fb4d0a3eff7'

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