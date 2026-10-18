$stopped = Get-Service | Where-Object { $_.Status -eq 'Stopped' -and $_.StartType -eq 'Automatic' }
"Stopped automatic services: $($stopped.Count)"
$stopped | select-object Name, starttype | convertTo-html | out-file c:\learning\stopped-services.html