resource_group_name = "dev-rg"
location            = "eastus"
storageaccountname  = "devterraformsa1911"
tags = {
  environment = "dev"
  project     = "terraform"
}
virtual_network_name        = "dev-vnet"
virtual_network_address     = ["10.0.0.0/24"]
subnet_name                 = "dev-subnet"
subnet_address              = ["10.0.0.0/24"]
public_ip_name              = "dev-public-ip"
network_security_group_name = "dev-nsg"
network_interface_name      = "dev-nic"
virtual_machine_name        = "dev-vm"
virtual_machine_size        = "Standard_DS1_v2"
admin_username              = "adminuser"
admin_password              = "P@ssw0rd12345"