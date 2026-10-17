# Week 1 – Day 1 (17 Oct 2026)

## Installed
- PowerShell 7, Python 3.14, VS Code, GitHub account

## Commands I learned
- `Get-Command *service*` – find commands by name
- `Get-Help Get-Service -Examples` – show examples (run `Update-Help` first)
- `Get-Service | Get-Member` – show properties and methods of an object
- `|` (pipe) – passes results to the next command
- `Where-Object` – filters, `Select-Object` – chooses columns

## My commands
- Stopped services:
  `Get-Service | Where-Object Status -eq 'Stopped' | Select-Object Name, StartType`
- Stopped + Automatic services:
  `Get-Service | Where-Object { $_.Status -eq 'Stopped' -and $_.StartType -eq 'Automatic' }`

## What I understood
- PowerShell is not case-sensitive
- Stopped + Manual is normal; stopped + Automatic is worth checking
