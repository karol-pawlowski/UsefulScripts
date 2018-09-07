Push-Location
Set-Location "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting"
if (Test-Path -Path ".\LocalDumps")
{
    Set-Location -Path ".\LocalDumps"
    Write-Output "LocalDumps key exists."
}
else
{
    New-Item -Path ".\LocalDumps"
    Write-Output "LocalDumps key created."
    Set-Location -Path ".\LocalDumps"
}
if (Test-Path -Path ".\Fleetmatics.Services.Windows.HosStatusChangeFeededService.exe")
{
    Set-ItemProperty -Path ".\Fleetmatics.Services.Windows.HosStatusChangeFeededService.exe" -Name DumpType -Value "2" -Type DWORD
    Set-ItemProperty -Path ".\Fleetmatics.Services.Windows.HosStatusChangeFeededService.exe" -Name DumpCount -Value "5" -Type DWORD
    Set-ItemProperty -Path ".\Fleetmatics.Services.Windows.HosStatusChangeFeededService.exe" -Name DumpFolder -Value "C:\Temp\CrashDumps\" -Type ExpandString
    Write-Output ""
}
else
{
    New-Item -Path ".\Fleetmatics.Services.Windows.HosStatusChangeFeededService.exe"
    Set-ItemProperty -Path ".\Fleetmatics.Services.Windows.HosStatusChangeFeededService.exe" -Name DumpType -Value "2" -Type DWORD
    Set-ItemProperty -Path ".\Fleetmatics.Services.Windows.HosStatusChangeFeededService.exe" -Name DumpCount -Value "5" -Type DWORD
    Set-ItemProperty -Path ".\Fleetmatics.Services.Windows.HosStatusChangeFeededService.exe" -Name DumpFolder -Value "C:\Temp\CrashDumps\" -Type ExpandString
    Write-Output ""
}
Set-Location C:\Temp\Logs\
if (Test-Path -Path ".\CrashDumps")
{
    Write-Output "CrashDumps folder exists."
}
else
{
    New-Item -Path ".\CrashDumps" -ItemType Directory
    Write-Output "CrashDumps folder created."
}
Pop-Location
