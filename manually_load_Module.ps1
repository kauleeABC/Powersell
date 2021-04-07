<#
Author: Kau Lee
Date: 4/7/2021

Manually download Powershell Module

Step:
1. download module
2. optional zip the module for easy transfer
3. move module to the destication server
4. unzip module
5. copy module to powershell module folder

Instruction

replace the server name on $desti_srv

#>
$path= "C:\Temp"
$module="SQLSERVER"
$Module_folder=$path +'\'+ $module
$desti_srv="\\serverName\"
$desti_path= $desti_srv + "c$\temp"
$zip_path=$Module_folder + ".zip"
$zip_Des=$desti_path + '\' + $module + ".zip"
$Desti_module=$desti_path + '\' + $module
$Desti_P_module=$desti_srv + "c$\Program Files\WindowsPowerShell\Modules\"

# step 1 -name is name of module you which to download

Save-Module -Name $module -Path $path


# step 2 -zipping module

Compress-Archive -LiteralPath "$Module_folder" -destinationPath $Module_folder

# step 3 -move module to destination folder

Copy-Item $zip_path -Destination $desti_path

# step 4 -unzip module
Expand-Archive -LiteralPath $zip_Des -DestinationPath $desti_path

# step 5 move module to powershell module folder
# to check module path: $env:PSModulePath

Copy-Item $Desti_module -Destination $Desti_P_module


#Remove-Item -path $desti_path\SQLSERVER*









