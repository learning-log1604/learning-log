$disk = Get-PSDrive C
$freeGB = [math]::Round($disk.Free / 1GB, 1)
if ($freeGB -lt 500) { "WARNING: low disk space: $freeGB GB" } else { "Disk OK: $freeGB GB free" }