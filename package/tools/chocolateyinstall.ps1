$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$urlPackage = 'https://wwcom.ch/downloads/wwphone_4_0_86.exe'
$checksumPackage = '7d4b2724b05d3b9f628bdc7a9e4e1a39303490d15e684429a98d56ee9db8a6557b64db5bb8052a704bf3b8403bab7bcce2a83cef5a0aab3150ada3208092138b'

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