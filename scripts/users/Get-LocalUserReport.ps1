[CmdletBinding()]
param([string]$OutputPath)
$ErrorActionPreference='Stop'
try {
  $results = Get-LocalUser | Select-Object Name,Enabled,PasswordRequired,PasswordExpires,LastLogon,Description
  if($OutputPath){ $results | Export-Csv -Path $OutputPath -NoTypeInformation }
  $results
  exit 0
} catch { Write-Error $_; exit 1 }
