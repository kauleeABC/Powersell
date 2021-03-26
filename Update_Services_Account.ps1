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

$server = 't79tdw171sdb003'
$service= 'JAMSAgent'
$user='AD\SRVSQLServiceDEV'
$password= '9w!X{Eb8Yj6*i4-T'

#Get current user on the service
$C_user = (Get-WmiObject Win32_Service -Filter "Name='$service'" -ComputerName $server).StartName

##Change/update log on as account and password
if($user -eq $C_user)
{
    $Srv = Get-WmiObject Win32_service -computer $server -filter "name='$service'"
    $Srv.Change($null,$null,$null,$null,$null,$null,$user,$password)
    # Change to Local System
    # $LocalSrv.Change($null,$null,$null,$null,$null,$null,"LocalSystem",$null)
}

else
{
 Write-Output 'Service account not match'
}


#End change and update

    # Restart the service
    Invoke-Command -Computer $server -ScriptBlock {
    Get-Service -Name $Using:service -ErrorAction SilentlyContinue |
        Restart-Service
    }

