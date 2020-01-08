# PowerShell version should be 5.1 or newer
$PSVersionTable

# Module Az and subsequent modules installed?
Get-Module -ListAvailable -Name Az
Get-Module -ListAvailable -Name Az.*

# Install module (or use CloudShell :-)
Find-Module -Name Az | Install-Module -Force

# Authenticate first
Connect-AzAccount
Get-AzContext

# Enumerate resource groups
Get-AzResourceGroup | Format-Table ResourceGroupName,Location,Tags

# Create resource group
$RgName = "Project2-RG"
$Location = "westeurope"
New-AzResourceGroup -Name $RgName -Location $Location

# Modify resource group
Set-AzResourceGroup -Name $RgName -Tag @{Kostenstelle="4711"}
Get-AzResourceGroup -Name $RgName | % Tags

# Delete resouce group
Remove-AzResourceGroup -Name $RgName -Force