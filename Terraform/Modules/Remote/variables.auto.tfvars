resource_group_name = "remote-rg"
location            = "eastus"
storageaccountname  = "remotetfsa"
tags = {
  environment = "dev"
  project     = "terraform"
}
count_value = 5