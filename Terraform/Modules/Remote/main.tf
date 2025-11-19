module "prod_vm" {
  source = "git::https://github.com/azureramakrishna/AzureDevops-Nov2025.git//Terraform/RemoteModule?ref=main"

  resource_group_name = var.resource_group_name
  location            = var.location
  storageaccountname  = var.storageaccountname
  count_value         = var.count_value
  tags                = var.tags
}