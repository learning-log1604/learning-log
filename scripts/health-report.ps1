# Part 1: Disk
# Part 1: Disks
$drives = Get-PSDrive -PSProvider FileSystem
$diskList = foreach ($d in $drives) {
    $freeGB = [math]::Round($d.Free / 1GB, 1)
    if ($freeGB -lt 20) { $status = 'WARNING' } else { $status = 'OK' }
    [PSCustomObject]@{ Drive = $d.Name; FreeGB = $freeGB; Status = $status }
}

# Part 2: Services
$stopped = Get-Service | Where-Object { $_.Status -eq 'Stopped' -and $_.StartType -eq 'Automatic' }

# Part 3: Report
$style = '<style>body{font-family:Segoe UI} table{border-collapse:collapse} th,td{border:1px solid #999;padding:4px 10px} th{background:#1F4E79;color:white}</style>'
$diskHtml = $diskList | ConvertTo-Html -Fragment -PreContent '<h2>Disk</h2>'
$servicesHtml = $stopped | Select-Object Name, StartType | ConvertTo-Html -Fragment -PreContent '<h2>Stopped automatic services</h2>'
# Join both tables into one page and save it
ConvertTo-Html -Title 'Health Report' -Body "<h1>Health report - $(Get-Date)</h1> $diskHtml $servicesHtml" | Out-File -FilePath 'C:\learning\health-report.html'
ConvertTo-Html -Title 'Health Report' -Head $style -Body "<h1>Health report - $(Get-Date)</h1> $diskHtml $servicesHtml" | Out-File -FilePath 'C:\learning\health-report.html'