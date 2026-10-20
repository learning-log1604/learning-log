# Part 1: Disk
$disk = Get-PSDrive C
# Convert free space to GB
$freeGB = [math]::Round($disk.Free / 1GB, 1)
# Decide, and save the answer in diskStatus
if ($freeGB -lt 20) { $diskStatus = 'WARNING' } else { $diskStatus = 'OK' }
# Put everything on the card
$diskInfo = [PSCustomObject]@{
    Drive  = 'C'
    FreeGB = $freeGB
    Status = $diskStatus
}

# Part 2: Services
$stopped = Get-Service | Where-Object { $_.Status -eq 'Stopped' -and $_.StartType -eq 'Automatic' }

# Part 3: Report
$diskHtml = $diskInfo | ConvertTo-Html -Fragment -PreContent '<h2>Disk</h2>'
$servicesHtml = $stopped | Select-Object Name, StartType | ConvertTo-Html -Fragment -PreContent '<h2>Stopped automatic services</h2>'
# Join both tables into one page and save it
ConvertTo-Html -Title 'Health Report' -Body "<h1>Health report - $(Get-Date)</h1> $diskHtml $servicesHtml" | Out-File -FilePath 'C:\learning\health-report.html'