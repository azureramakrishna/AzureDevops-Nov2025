param resourcePrefix string = 'saanvikit'
param location1 string = 'centralindia'
param location2 string = 'uksouth'
param vmSize string = 'Standard_Ds1_v2'
param adminUsername string = 'azureuser'

@secure()
param adminPassword string

// Resource Group is assumed to exist

// Network Security Group for VNET-01
resource nsg01 'Microsoft.Network/networkSecurityGroups@2023-04-01' = {
  name: '${resourcePrefix}-nsg-01'
  location: location1
  properties: {
    securityRules: [
      {
        name: 'AllowSSH'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
        }
      }
      {
        name: 'AllowRDP'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 110
          direction: 'Inbound'
        }
      }
    ]
  }
}

// Network Security Group for VNET-02
resource nsg02 'Microsoft.Network/networkSecurityGroups@2023-04-01' = {
  name: '${resourcePrefix}-nsg-02'
  location: location2
  properties: {
    securityRules: [
      {
        name: 'AllowSSH'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
        }
      }
      {
        name: 'AllowRDP'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 110
          direction: 'Inbound'
        }
      }
    ]
  }
}

// VNET-01 and resources in Central India
resource vnet01 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: '${resourcePrefix}-vnet-01'
  location: location1
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/24'
      ]
    }
    subnets: [
      {
        name: '${resourcePrefix}-snet-01'
        properties: {
          addressPrefix: '10.0.0.0/24'
          networkSecurityGroup: {
            id: nsg01.id
          }
        }
      }
    ]
  }
}

// Public IP for VM01
resource publicIp01 'Microsoft.Network/publicIPAddresses@2023-04-01' = {
  name: '${resourcePrefix}-pip-vm01'
  location: location1
  properties: {
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
  }
  sku: {
    name: 'Standard'
  }
}

// Network Interface for VM01
resource nic01 'Microsoft.Network/networkInterfaces@2023-04-01' = {
  name: '${resourcePrefix}-nic-vm01'
  location: location1
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: '${vnet01.id}/subnets/${resourcePrefix}-snet-01'
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIp01.id
          }
        }
      }
    ]
  }
}

// Key Vault
resource keyVault 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: '${resourcePrefix}-kv-01'
  location: location1
  properties: {
    enabledForDeployment: true
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: false
    tenantId: subscription().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: []
  }
}

// Key Vault Secret - DB Password
resource dbPasswordSecret 'Microsoft.KeyVault/vaults/secrets@2023-07-01' = {
  parent: keyVault
  name: 'db-password'
  properties: {
    value: 'Azuredevops@12345'
  }
}

// System-Assigned Managed Identity for VM01
resource vm01 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: '${resourcePrefix}-vm01'
  location: location1
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: 'VM01'
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: '0001-com-ubuntu-server-focal'
        sku: '20_04-lts-gen2'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Standard_LRS'
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic01.id
        }
      ]
    }
  }
}

// VNET-02 and resources in UK South
resource vnet02 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: '${resourcePrefix}-vnet-02'
  location: location2
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.1.0/24'
      ]
    }
    subnets: [
      {
        name: '${resourcePrefix}-snet-02'
        properties: {
          addressPrefix: '10.0.1.0/24'
          networkSecurityGroup: {
            id: nsg02.id
          }
        }
      }
    ]
  }
}

// Network Interface for VM02
resource nic02 'Microsoft.Network/networkInterfaces@2023-04-01' = {
  name: '${resourcePrefix}-nic-vm02'
  location: location2
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: '${vnet02.id}/subnets/${resourcePrefix}-snet-02'
          }
          privateIPAllocationMethod: 'Dynamic'
        }
      }
    ]
  }
}

// VM02
resource vm02 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: '${resourcePrefix}-vm02'
  location: location2
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: 'VM02'
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: '0001-com-ubuntu-server-focal'
        sku: '20_04-lts-gen2'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Standard_LRS'
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic02.id
        }
      ]
    }
  }
}

// RBAC Role Assignment - Key Vault Secrets User role for VM01
resource keyVaultSecretsUserRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: keyVault
  name: guid(keyVault.id, vm01.id, 'Key Vault Secrets User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '4633458b-17de-408a-b874-0445c86b69e6')
    principalId: vm01.identity.principalId
    principalType: 'ServicePrincipal'
  }
}

// Optional: RBAC Role Assignment - Key Vault Administrator role (if needed for more permissions)
// resource keyVaultAdminRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
//   scope: keyVault
//   name: guid(keyVault.id, vm01.id, 'Key Vault Administrator')
//   properties: {
//     roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '00482a5a-887f-4fb3-b363-3b7fe8e74483')
//     principalId: vm01.identity.principalId
//     principalType: 'ServicePrincipal'
//   }
// }

// VNET Peering from VNET-01 to VNET-02
resource vnetPeering01To02 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-04-01' = {
  parent: vnet01
  name: '${resourcePrefix}-peer-vnet01-to-vnet02'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: vnet02.id
    }
  }
}

// VNET Peering from VNET-02 to VNET-01
resource vnetPeering02To01 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-04-01' = {
  parent: vnet02
  name: '${resourcePrefix}-peer-vnet02-to-vnet01'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: vnet01.id
    }
  }
}

// Outputs
output keyVaultName string = keyVault.name
output keyVaultId string = keyVault.id
output vm01ManagedIdentityPrincipalId string = vm01.identity.principalId
output dbPasswordSecretUri string = '${keyVault.properties.vaultUri}secrets/db-password'
