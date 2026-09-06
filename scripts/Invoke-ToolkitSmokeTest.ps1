Describe 'PowerShell IT Toolkit' - $PSVersionTable.PSVersion
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
$logDir=Join-Path $root 'logs'
New-Item -ItemType Directory -Path $logDir -Force | Out-Null
Start-Transcript -Path (Join-Path $logDir 'toolkit.log') -Append
try {
  & (Join-Path $root 'scripts/system/Get-SystemInventory.ps1')
  & (Join-Path $root 'scripts/services/Get-ServiceHealth.ps1')
  & (Join-Path $root 'scripts/networking/Test-NetworkHealth.ps1')
  Write-Host 'Toolkit smoke test completed.'
} finally { Stop-Transcript }
