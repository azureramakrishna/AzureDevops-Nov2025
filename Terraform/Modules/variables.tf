variable "resource_group_name" {
  type    = string
}

variable "location" {
  type    = string
}

variable "storageaccountname" {
  type    = string
}

variable "tags" {
  type = map(string)
}

variable "virtual_network_name" {
  type    = string
}

variable "virtual_network_address" {
  type    = list(string)
}

variable "subnet_name" {
  type    = string
}

variable "subnet_address" {
  type    = list(string)
}

variable "public_ip_name" {
  type    = string
}

variable "network_security_group_name" {
  type    = string
}

variable "network_interface_name" {
  type    = string
}

variable "virtual_machine_name" {
  type    = string
}

variable "virtual_machine_size" {
  type    = string
}

variable "admin_username" {
  type    = string
}

variable "admin_password" {
  type = string
}