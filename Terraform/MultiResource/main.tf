# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# Create a storage account within the resource group
resource "azurerm_storage_account" "sa" {
  name                     = "${var.storageaccountname}${count.index + 1}" //saanvikitsa1, saanvikitsa2, .... saanvikitsa30
  count                    = var.count_value
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}