<#
Author: Kau Lee
Date:4/1/2021
Note: Replace sqlps with the module you want to search
#>
#Check from list of module
if (Get-Module -ListAvailable -Name sqlps) {
    Write-Host "Module exists"
} 
else {
    Write-Host "Module does not exist"
}