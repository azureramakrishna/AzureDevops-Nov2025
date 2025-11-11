@description('Name of the storage account')
param storage_account_name string

@description('Location of the storage account')
param location string = resourceGroup().location

var tags = {
  Project: 'volvo'
  Environment: 'DEV'
  Region: 'Eastus'
}

resource storage_account_name_resource 'Microsoft.Storage/storageAccounts@2025-06-01' = {
  name: toLower(storage_account_name)
  tags: tags
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

output storageAccountEndpoint string = storage_account_name_resource.properties.primaryEndpoints.blob
