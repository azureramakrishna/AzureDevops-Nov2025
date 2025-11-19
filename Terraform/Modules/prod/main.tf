module "prod_vm" {
  source = "../"

  resource_group_name         = var.resource_group_name
  location                    = var.location
  storageaccountname          = var.storageaccountname
  tags                        = var.tags
  virtual_network_name        = var.virtual_network_name
  virtual_network_address     = var.virtual_network_address
  subnet_name                 = var.subnet_name
  subnet_address              = var.subnet_address
  public_ip_name              = var.public_ip_name
  network_security_group_name = var.network_security_group_name
  network_interface_name      = var.network_interface_name
  virtual_machine_name        = var.virtual_machine_name
  virtual_machine_size        = var.virtual_machine_size
  admin_username              = var.admin_username
  admin_password              = var.admin_password
}