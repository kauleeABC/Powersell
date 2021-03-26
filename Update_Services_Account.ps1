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
# Enter your input to these parameters
$server = 'server name'
$service= 'service name'
$user='service account'
$password= 'Pass$$'

#Get current user on the service
$C_user = (Get-WmiObject Win32_Service -Filter "Name='$service'" -ComputerName $server).StartName

##Change log on as account and password
# check to make sure the current service account is same before update the password
if($user -eq $C_user)
{
    $Srv = Get-WmiObject Win32_service -computer $server -filter "name='$service'"
    $Srv.Change($null,$null,$null,$null,$null,$null,$user,$password)
}

else
{
 Write-Output 'Service account not match'
}
# Change to Local System
# $LocalSrv.Change($null,$null,$null,$null,$null,$null,"LocalSystem",$null)
