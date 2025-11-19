resource_group_name = "nonprod-rg"
location            = "eastus"
storageaccountname  = "nonprodterraformsa1911"
tags = {
  environment = "nonprod"
  project     = "terraform"
}
virtual_network_name        = "nonprod-vnet"
virtual_network_address     = ["10.0.1.0/24"]
subnet_name                 = "nonprod-subnet"
subnet_address              = ["10.0.1.0/24"]
public_ip_name              = "nonprod-public-ip"
network_security_group_name = "nonprod-nsg"
network_interface_name      = "nonprod-nic"
virtual_machine_name        = "nonprod-vm"
virtual_machine_size        = "Standard_DS1_v2"
admin_username              = "adminuser"
admin_password              = "P@ssw0rd12345"