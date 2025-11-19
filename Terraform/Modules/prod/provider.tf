# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}

  client_id       = "17b89dd2-baaa-450f-8f0b-e0ffaa82099a"
  client_secret   = "czE8Q~6gGRf~Fp_A.oTOeBITQTpADCm1NKBCQamY"
  tenant_id       = "459865f1-a8aa-450a-baec-8b47a9e5c904"
  subscription_id = "2e28c82c-17d7-4303-b27a-4141b3d4088f"
}