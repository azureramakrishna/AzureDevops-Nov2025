param storage_account_name string = 'saanvikit83748374'
param location string = resourceGroup().location

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storage_account_name
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}
