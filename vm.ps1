# Login to your Azure account
Connect-AzAccount

# Variables
$location = "EastUS"
$resourceGroup = "MyResourceGroup"
$vmName = "MyWindowsVM"
$vnetName = "MyVnet"
$subnetName = "MySubnet"
$publicIPName = "MyPublicIP"
$nsgName = "MyNetworkSecurityGroup"
$nicName = "MyNIC"

# Step 1: Create a Resource Group
New-AzResourceGroup -Name $resourceGroup -Location $location

# Step 2: Create a Virtual Network and Subnet
$subnetConfig = New-AzVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix "10.0.0.0/24"
$vnet = New-AzVirtualNetwork -ResourceGroupName $resourceGroup `
    -Location $location -Name $vnetName `
    -AddressPrefix "10.0.0.0/16" -Subnet $subnetConfig

# Step 3: Create a Public IP Address
$publicIP = New-AzPublicIpAddress -Name $publicIPName `
    -ResourceGroupName $resourceGroup -Location $location `
    -AllocationMethod Dynamic

# Step 4: Create a Network Security Group (NSG) with RDP and HTTP open
$nsgRuleRDP = New-AzNetworkSecurityRuleConfig -Name "Allow-RDP" `
    -Protocol "Tcp" -Direction "Inbound" -Priority 1000 -SourceAddressPrefix "*" `
    -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange 3389 -Access "Allow"

$nsgRuleHTTP = New-AzNetworkSecurityRuleConfig -Name "Allow-HTTP" `
    -Protocol "Tcp" -Direction "Inbound" -Priority 1010 -SourceAddressPrefix "*" `
    -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange 80 -Access "Allow"

$nsg = New-AzNetworkSecurityGroup -ResourceGroupName $resourceGroup `
    -Location $location -Name $nsgName -SecurityRules $nsgRuleRDP,$nsgRuleHTTP

# Step 5: Create a Network Interface Card (NIC)
$nic = New-AzNetworkInterface -Name $nicName `
    -ResourceGroupName $resourceGroup -Location $location `
    -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $publicIP.Id `
    -NetworkSecurityGroupId $nsg.Id

# Step 6: Define the VM credentials
$cred = Get-Credential -Message "Enter credentials for the Windows VM administrator"

# Step 7: Create the Virtual Machine
New-AzVM `
    -ResourceGroupName $resourceGroup `
    -Name $vmName `
    -Location $location `
    -VirtualNetworkName $vnetName `
    -SubnetName $subnetName `
    -SecurityGroupName $nsgName `
    -PublicIpAddressName $publicIPName `
    -Image "MicrosoftWindowsServer:WindowsServer:2022-datacenter-azure-edition:latest" `
    -Credential $cred `
    -OpenPorts 3389,80

# Step 8: (Optional) Install IIS Web Server
Invoke-AzVMRunCommand -ResourceGroupName $resourceGroup -VMName $vmName `
    -CommandId 'RunPowerShellScript' `
    -ScriptString 'Install-WindowsFeature -Name Web-Server -IncludeManagementTools'
