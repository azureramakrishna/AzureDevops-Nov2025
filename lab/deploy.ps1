# Set variables
$resourceGroup = "arm"
$location = "centralindia"
$templateFile = "/Users/saanvikit/Downloads/AzureDevops-Oct2025/lab/main.bicep"
$adminPassword = ConvertTo-SecureString "Azuredevops@12345" -AsPlainText -Force

# Connect to Azure
#Connect-AzAccount

# Create Resource Group
#New-AzResourceGroup -Name $resourceGroup -Location $location

# Deploy the Bicep template
New-AzResourceGroupDeployment `
  -ResourceGroupName $resourceGroup `
  -TemplateFile $templateFile `
  -resourcePrefix "saanvikit" `
  -location1 "centralindia" `
  -location2 "uksouth" `
  -vmSize "Standard_Ds1_v2" `
  -adminUsername "azureuser" `
  -adminPassword $adminPassword `
  -Verbose

# Get deployment status
Get-AzResourceGroupDeployment -ResourceGroupName $resourceGroup

# Get the public IP of VM01
Get-AzPublicIpAddress `
  -ResourceGroupName $resourceGroup `
  -Name "saanvikit-pip-vm01" | Select-Object IpAddress