$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$urlPackage = 'https://wwcom.ch/downloads/wwphone_4_0_59.exe'
$checksumPackage = '4f7ce47166c6e4d317bf37d1e904130fc190abe6a3dc50716a5af40b9927f4903fd0cbcd54a84cc74eedff6914a3f596ef2e7bebd94b87fd0d7f6079fbfdf7d2'

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