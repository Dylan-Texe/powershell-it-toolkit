[CmdletBinding()]
param([int[]]$Id)
$ErrorActionPreference='Stop'
try {
  if($Id){ $events = $Id | ForEach-Object { Get-WinEvent -FilterHashtable @{LogName='System'; Id=$_} -MaxEvents 20 } }
  else { $events = Get-WinEvent -LogName System -MaxEvents 50 }
  $events | Select-Object TimeCreated,Id,LevelDisplayName,ProviderName,Message
  exit 0
} catch { Write-Error "Event collection failed: $($_.Exception.Message)"; exit 1 }
