<#
author: Kau Lee
Date: 3/26/2021

This script is to change services account and password
this can be automate with foreach loop for multiple servers or services

#>

<#
Clear-Host

Get-WmiObject -Class Win32_service |
Get-Member -MemberType Method
#>

<#
These are .Change parameter
$DisplayName,
$PathName,
$ServiceType,
$ErrorControl,
$StartMode,
$DesktopInteract,
$StartName,
$StartPassword,
$LoadOrderGroup,
$LoadOrderGroupDependencies,
$ServiceDependencies

#>

$server = 'server name'
$user='AccountName'
$password= 'Password'

##Change log on as account and password

$Srv = Get-WmiObject Win32_service -computer $server -filter "name='JAMSAgent'"
$Srv.Change($null,$null,$null,$null,$null,$null,$user,$password)

# Change to Local System
# $LocalSrv.Change($null,$null,$null,$null,$null,$null,"LocalSystem",$null)