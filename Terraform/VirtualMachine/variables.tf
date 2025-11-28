variable "resource_group_name" {
  type    = string
  default = "terraform-rg"
}

variable "location" {
  type    = string
  default = "EastUS"
}

variable "storageaccountname" {
  type    = string
  default = "terraformsa141125"
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
  default = "terraform-vnet"
}

variable "virtual_network_address" {
  type    = list(string)
  default = ["10.0.0.0/24"]
}

variable "subnet_name" {
  type    = string
  default = "terraform-snet"
}

variable "subnet_address" {
  type    = list(string)
  default = ["10.0.0.0/24"]
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

variable "admin_password" {
  type = string
}