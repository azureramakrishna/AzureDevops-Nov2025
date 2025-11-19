# Azure terraform backend configuration
terraform {
  backend "azurerm" {
    resource_group_name  = "saanvikit-rg"           # Can also be set via `ARM_SAS_TOKEN` environment variable.
    storage_account_name = "saanvikittfstate"       # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "prod.terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}