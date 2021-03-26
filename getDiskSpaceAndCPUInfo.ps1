<#
Get disk spce from list of server

#>

Get-CimInstance -Class Win32_LogicalDisk -ComputerName (Get-Content -Path 'C:\Temp\Servers.txt') | Select-Object @{Name="Size(GB)";Expression={$_.size/1gb}}, @{Name="Free Space(GB)";Expression={$_.freespace/1gb}}, @{Name="Free (%)";Expression={"{0,6:P0}" -f(($_.freespace/1gb) / ($_.size/1gb))}}, DeviceID, DriveType, SystemName | Where-Object DriveType -EQ '3' | Out-GridView

<#
Get CPU information and number of cores

#>
Get-WmiObject -Class Win32_Processor | Select-Object -Property Name, Number*