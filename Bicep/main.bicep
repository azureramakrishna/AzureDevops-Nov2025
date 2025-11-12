param storage_account_name string
param location_name string = resourceGroup().location
param virtual_machine_name string
param virtual_machine_size string
param adminUser string 
@secure()
param adminPassword string

// variables 
var virtual_network_name string = 'saanvikit-vnet'
var virtual_network_address array = ['192.168.0.0/24']
var subnet_name string = 'saanvikit-snet'
var subnet_address string = '192.168.0.0/24'
var network_security_group_name string = 'saanvikit-nsg'
var public_ip_name string = 'saanvikit-pip'
var network_interface_name = 'saanvikit-nic'

// Create a Storageaccount
resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storage_account_name
  location: location_name
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

// Create a Virtual Network
resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: virtual_network_name
  location: location_name
  properties: {
    addressSpace: {
      addressPrefixes: virtual_network_address
    }
    subnets: [
      {
        name: subnet_name
        properties: {
          addressPrefix: subnet_address
          networkSecurityGroup: {
            id: networkSecurityGroup.id
          }
        }
      }
    ]
  }
}


resource networkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2019-11-01' = {
  name: network_security_group_name
  location: location_name
  properties: {
    securityRules: [
      {
        name: 'RDP'
        properties: {
          description: 'RDP_Allow'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
        }
      }
      {
        name: 'HTTP'
        properties: {
          description: 'HTTP_Allow'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '80'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 200
          direction: 'Inbound'
        }
      }
    ]
  }
}

resource publicIPAddress 'Microsoft.Network/publicIPAddresses@2019-11-01' = {
  name: public_ip_name
  location: location_name
  properties: {
    publicIPAllocationMethod: 'Dynamic'
  }
}

resource networkInterface 'Microsoft.Network/networkInterfaces@2020-11-01' = {
  name: network_interface_name
  location: location_name
  properties: {
    ipConfigurations: [
      {
        name: network_interface_name
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: '${virtualNetwork.id}/subnets/${subnet_name}'
          }
          publicIPAddress: {
            id: publicIPAddress.id
          }
        }
      }
    ]
  }
}

resource windowsVM 'Microsoft.Compute/virtualMachines@2020-12-01' = {
  name: virtual_machine_name
  location: location_name
  properties: {
    hardwareProfile: {
      vmSize: virtual_machine_size
    }
    osProfile: {
      computerName: virtual_machine_name
      adminUsername: adminUser
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2019-Datacenter'
        version: 'latest'
      }
      osDisk: {
        name: '${virtual_machine_name}-osdisk' // saanvikit-vm-osdisk
        caching: 'ReadWrite'
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterface.id
        }
      ]
    }
  }
}


