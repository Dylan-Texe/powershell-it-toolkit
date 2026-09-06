[CmdletBinding()]
param([string[]]$ComputerName=@('localhost'))
$ErrorActionPreference='Stop'
foreach($computer in $ComputerName){
  try {
    $os=Get-CimInstance Win32_OperatingSystem -ComputerName $computer
    $disk=Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'" -ComputerName $computer
    $uptime=(Get-Date)-$os.LastBootUpTime
    $freePct=if($disk.Size){[math]::Round(($disk.FreeSpace/$disk.Size)*100,1)}else{$null}
    [pscustomobject]@{ComputerName=$computer;Reachable=$true;UptimeHours=[math]::Round($uptime.TotalHours,1);MemoryFreeGB=[math]::Round($os.FreePhysicalMemory/1MB,2);SystemDriveFreePercent=$freePct;Status=if($freePct -lt 10){'CHECK'}else{'PASS'}}
  } catch {[pscustomobject]@{ComputerName=$computer;Reachable=$false;Status='FAIL';Error=$_.Exception.Message}}
}
