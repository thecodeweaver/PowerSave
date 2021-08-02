<#
.Synopsis
____                          _____
/ __ \____ _      _____  _____/ ___/____ __   _____
/ /_/ / __ \ | /| / / _ \/ ___/\__ \/ __ `/ | / / _ \
/ ____/ /_/ / |/ |/ /  __/ /   ___/ / /_/ /| |/ /  __/
/_/    \____/|__/|__/\___/_/   /____/\__,_/ |___/\___/

https://github.com/thecodeweaver/PowerSave
PowerSave is a Windows backup tool written in PowerShell.
Syntax: PowerSave.ps1 [backup drive path]
#>

if ($args.count -ne 1)
{
    write-host "Syntax: PowerSave.ps1 [backup drive path]" -ForegroundColor Red
    return
}

$backup_drive = $args[0]

$backup_folders = @(
    ($HOME + '\Documents'),
    ($HOME + '\Videos'),
    ($HOME + '\Pictures')
)

$backup_destination = $backup_drive + "\" + (Get-Date -Format "MM_dd_yyyy") + "_Backup"
write-host "Backing up to $backup_destination..."

New-Item -Path $backup_destination -ItemType Directory

foreach ($i in $backup_folders)
{
    write-host "Backing up $i..."
    Copy-Item -Path $i -Destination $backup_destination -Recurse
}

write-host "Backup Complete!" -ForegroundColor Green
