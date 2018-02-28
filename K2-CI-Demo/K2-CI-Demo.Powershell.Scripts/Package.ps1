#
# Script.ps1
#

param([string]$appName, [string]$categoryPath)

if(-not($appName)){ Throw "You must provide the name for your application"}
if(-not($categoryPath)){ Throw "You must provide the path for your application category"}

#01. Create a folder for the output
New-Item -ItemType Directory -Force -Path $PSScriptRoot\PND

#02. Create a package
Import-Module $PSScriptRoot\Assemblies\K2Field.Powershell.Module.dll -Verbose -Force
New-K2Package -Path "$PSScriptRoot\PND\$appName.kspx" -Category $categoryPath

#03. Create a Deployment config file
Add-PSSnapin SourceCode.Deployment.Powershell 
Write-DeploymentConfig "$PSScriptRoot\PND\$appName.kspx" "$PSScriptRoot\PND\$appName.xml"