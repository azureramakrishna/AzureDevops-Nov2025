variable "resource_group_name" {
  type    = string
  default = "saanvikit-rg"
}

variable "storageaccountname" {
  type    = string
  default = "terraformsa1411"
}

variable "tags" {
  type = map(string)
  default = {
    environment = "Dev"
    project     = "Terraform"
  }
}

variable "virtual_network_name" {
  type    = string
  default = "saanvikit-vnet"
}

variable "subnet_name" {
  type    = string
  default = "default"
}

variable "keyvault_name" {
  type    = string
  default = "saanvikitkv"
}

variable "keyvault_secret" {
  type    = string
  default = "win-vm-password"
}

variable "public_ip_name" {
  type    = string
  default = "terraform-pip"
}

variable "network_security_group_name" {
  type    = string
  default = "terraform-nsg"
}

variable "network_interface_name" {
  type    = string
  default = "terraform-nic"
}

variable "virtual_machine_name" {
  type    = string
  default = "terraform-vm"
}

variable "virtual_machine_size" {
  type    = string
  default = "Standard_Ds1_V2" // 1 vCPU 3.5GB RAM
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}