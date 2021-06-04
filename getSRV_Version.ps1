#GET Server OS version
$SRV = Get-Content -Path "C:\MSSQL\SQL_SRV_Master\SQLSRVMasterList.csv"

Get-CimInstance Win32_OperatingSystem -ComputerName $SRV | Select-Object CSName, Caption, Version | #, ServicePackMajorVersion, OSArchitecture,  WindowsDirectory |
Export-Csv -Path "C:\MSSQL\SQL_SRV_Master\SQLSRVMasterList_OS.csv"

#invoke-sqlcmd -serverInstance "T79TDW171SDB013" -query "SELECT @@VERSION, @@ServerName"