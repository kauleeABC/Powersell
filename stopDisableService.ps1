<#
created by:Kau Lee
Date: 7/7/2021

this script is to stop and disable service

#>



#enter server or list of servers, example: 'TDW171SDB001','TDW171SDB002','TDW171SDB005'
$s= #list of servers
#service name
$service='print spooler'

#stop and disable startup
Get-Service $service -ComputerName $s | Stop-Service -PassThru | Set-Service -StartupType disabled

#checking 
Get-Service $service -ComputerName $s | Select-Object -Property Machinename, Name, StartType, Status



